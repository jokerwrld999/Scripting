#!/bin/bash

declare -A package_managers=(
  [pacman]="sudo pacman -S --noconfirm"
  [apt]="sudo apt install -y"
  [dnf]="sudo dnf install -y"
  [zypper]="sudo zypper -n install"
)

sshpass_package="sshpass"
if ! command -v $sshpass_package >/dev/null 2>&1; then
  for package_manager in "${!package_managers[@]}"; do
    if command -v $package_manager >/dev/null 2>&1; then
      eval "${package_managers[$package_manager]} $sshpass_package"
      echo "Packages installed using $package_manager."
      exit 0
    fi
  done
  echo "FAILED TO INSTALL PACKAGES: No supported package manager found."
fi

function key_exists() {
  local ssh_password="$1"
  local username="$2"
  local ip_address="$3"
  local key_file="$4"

  echo "$ssh_password" | sshpass ssh -o 'ConnectTimeout=5' -q $username@$ip_address "grep -q \"$(cat ~/.ssh/$key_file)\" ~/.ssh/authorized_keys" &> /dev/null
}

declare -A server_info

# inventory_dir="/home/jokerwrld/github/k3s-on-proxmox/2_ansible/inventory"
inventory_dir="./inventory"

for filename in "$inventory_dir"/*; do
  if [[ -f "$filename" ]]; then
    while IFS= read -r line; do
      ip_address=$(echo "$line" | awk '{print $1}')
      username=$(echo "$line" | awk '{print $2}' | cut -d "=" -f2)
      username=${username:-root}

      if [[ ! $ip_address =~ ^[0-9]{1,3}(\.[0-9]{1,3}){3}$ ]] || ! ping -c1 -W1 $ip_address &> /dev/null; then
        continue
      fi

      server_info["$ip_address"]="$username"
    done < "$filename"
  fi
done


ssh_password=$(cat ./.ssh_pass)

if [[ -z "$ssh_password" ]]; then
  read -p "Enter the SSH password for the server: " ssh_password
  echo
fi

generate_and_copy_keys() {
  local ssh_password="$1"
  local username="$2"
  local ip_address="$3"
  local key_file="$4"
  local key_name="$5"

  local key_path="$HOME/.ssh/$key_file"
  if [ ! -f "$key_path" ]; then
    echo "Generating SSH key: $description..."
    ssh-keygen -f "$key_path" -t ed25519 -C "$description" -N '' -q
  fi

  if key_exists "$ssh_password" "$username" "$ip_address" "$key_file.pub"; then
    echo "Key '$key_file.pub' already authorized."
  else
    echo "Copying '$key_file.pub' to $ip_address..."
    ssh-keygen -q -f ~/.ssh/known_hosts -R "$ip_address" &> /dev/null
    echo "$ssh_password" | sshpass ssh-copy-id -o 'StrictHostKeyChecking=no' -i "$key_path.pub" $username@$ip_address &>/dev/null
  fi
}

for server in "${!server_info[@]}"; do
  ip_address=$server
  username=${server_info[$server]}
  echo "Provisioning server: $ip_address."

  generate_and_copy_keys "$ssh_password" "$username" "$ip_address" "id_ed25519" "Default key"
  generate_and_copy_keys "$ssh_password" "$username" "$ip_address" "ansible" "Ansible key"

  echo
done

echo "SSH key setup completed!"
echo

#!/bin/bash
# Basic arithmetic using double parentheses
#let
letMethod=$(let "$1 * $2")
echo "Multiplyed by LET: $letMethod"

#expr
exprMethod=$(expr "$1 * $2")
echo "Multiplyed by EXPR: $exprMethod"

#double parentheses
parenthesesMethod=$(( $1 * $2 ))
echo "Multiplyed by (()): $parenthesesMethod"
#!/bin/bash

# symlink ~/quotes
QUOTE_FILE="/Users/hamish/quotes"

QUOTES=()
current_quote=""

while IFS= read -r line || [ -n "$line" ]; do
  if [[ -z "$line" ]]; then
    if [[ -n "$current_quote" ]]; then
      QUOTES+=("$current_quote")
      current_quote=""
    fi
  else
    current_quote+="${line}"$'\n'
  fi
done <"$QUOTE_FILE"

if [[ -n "$current_quote" ]]; then
  QUOTES+=("$current_quote")
fi

shuf -n 1 -e "${QUOTES[@]}" | sed '/^[[:space:]]*$/d'


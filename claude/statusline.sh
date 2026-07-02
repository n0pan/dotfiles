#!/bin/bash

input=$(cat)

TEXT=$'\033[38;2;197;201;199m'
DIM=$'\033[38;2;117;121;127m'
BLUE=$'\033[38;2;139;164;176m'
GREEN=$'\033[38;2;135;169;135m'
YELLOW=$'\033[38;2;220;165;97m'
VIOLET=$'\033[38;2;147;138;169m'
RESET=$'\033[0m'

cwd=$(jq -r '.workspace.current_dir // empty' <<<"$input")
model=$(jq -r '.model.display_name // empty' <<<"$input")
used=$(jq -r '.context_window.used_percentage // empty' <<<"$input")
cost=$(jq -r '.cost.total_cost_usd // empty' <<<"$input")
session=$(jq -r '.rate_limits.five_hour.used_percentage // empty' <<<"$input")
week=$(jq -r '.rate_limits.seven_day.used_percentage // empty' <<<"$input")

# shorten path like p10k: keep ~ and last segment full, truncate others to first char
dir_display=$(awk -v home="$HOME" '{
  gsub("^"home,"~",$0)
  n=split($0,parts,"/")
  out=""
  for(i=1;i<=n;i++){
    if(i==n || parts[i]=="" || parts[i]=="~") seg=parts[i]
    else seg=substr(parts[i],1,1)
    out = out (i>1?"/":"") seg
  }
  print out
}' <<<"$cwd")

git_segment=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
  [ -z "$branch" ] && branch=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
    git_segment="${DIM}on ${YELLOW}${branch} ✱${RESET}"
  else
    git_segment="${DIM}on ${GREEN}${branch}${RESET}"
  fi
fi

line="${BLUE}${dir_display}${RESET}"
[ -n "$git_segment" ] && line="${line}  ${git_segment}"
line="${line}  ${DIM}·${RESET}  ${VIOLET}${model}${RESET}"
if [ -n "$used" ]; then
  pct=$(printf "%.0f" "$used")
  line="${line}  ${DIM}·${RESET}  ${TEXT}${pct}% ctx${RESET}"
fi
if [ -n "$cost" ]; then
  # static approximate rate (update as needed); avoids a network call on every render
  USD_TO_CAD=1.38
  cad=$(awk -v u="$cost" -v r="$USD_TO_CAD" 'BEGIN{printf "%.2f", u*r}')
  line="${line}  ${DIM}·${RESET}  ${TEXT}CA\$${cad}${RESET}"
fi
if [ -n "$session" ]; then
  spct=$(printf "%.0f" "$session")
  line="${line}  ${DIM}·${RESET}  ${TEXT}${spct}% session${RESET}"
fi
if [ -n "$week" ]; then
  wpct=$(printf "%.0f" "$week")
  line="${line}  ${DIM}·${RESET}  ${TEXT}${wpct}% week${RESET}"
fi

printf "%s" "$line"

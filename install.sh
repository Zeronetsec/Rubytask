#!/usr/bin/env bash
# Rubytask Project

N='\033[0m'
R='\033[1;31m'
B='\033[1;34m'
GG='\033[0;32m'
DG='\033[1;90m'

base="$PREFIX/opt"
symlink="$PREFIX/bin"

function spinner() {
    local cmd=""
    local msg="Running command"

    for args in "$@"; do
        case "$args" in
            --command=*)
                cmd="${args#*=}"
                ;;
            --message=*)
                msg="${args#*=}"
                ;;
        esac
    done

    function spinner_anim() {
        local pid=$1
        local delay=0.1
        local spinstr='|/-\'

        while kill -0 "$pid" 2>/dev/null; do
            local temp="${spinstr#?}"
            printf " \033[0m[\033[0;32m%c\033[0m] " "$spinstr"
            spinstr="$temp${spinstr%"$temp"}"
            command sleep "$delay"
            printf "\b\b\b\b\b"
        done
        printf "     \b\b\b\b\b"
    }

    echo -ne "${B}[*] ${N}${msg}${N}"
    command bash -c "${cmd}" > /dev/null 2>&1 &
    local pid=$!

    spinner_anim "$pid"
    wait "$pid"
    local status=$?

    if [[ "$status" -eq 0 ]]; then
        echo -ne " ${DG}- ${N}[${GG}✔ ${N}Success]\n"
    else
        echo -ne " ${DG}- ${N}[${R}✖ ${N}Failed (exit code: ${GG}${status}${N})]\n"
    fi
}

function rescursor() {
    local input="$1"
    echo -ne "\033[?25h"
    printf '\n'
    exit $input
}

printf '\n'
echo -e "${B}[*] ${N}Enter path to your rubytask folder"
read -p "$(echo -e "${N}Path: ")" path
declare -A varmap=(
    ["~"]="$HOME"
    ["\$HOME"]="$HOME"
    ["\$PREFIX"]="$PREFIX"
    ["\$PWD"]="$PWD"
)

for exp in "${!varmap[@]}"; do
    path="${path/#$exp/${varmap[$exp]}}"
done

if [[ ! -d "$path" ]]; then
    echo -e "\n${R}[!] ${N}Folder: ${GG}${path} ${N}not found! \n"
    exit 1
fi

echo -ne "\033[?25l"
echo -e "\n${B}[*] ${N}Installing: ${GG}Rubytask${N}"

pack=(
    "ruby"
    "zip"
)

for i in "${pack[@]}"; do
    spinner \
        --command="command apt install \"${i}\" -y" \
        --message="Installing: ${GG}${i}${N}" || {
            rescursor 1
        }
done

if [[ ! -d "$base" ]]; then
    spinner \
        --command="command mkdir -p \"${base}\"" \
        --message="Create directory: ${GG}${base}${N}" || {
            rescursor 1
        }
fi

if [[ -d "$base/rubytask" ]]; then
    cd "$base"
    spinner \
        --command="command zip -r \"rubytask_$(command date +%Y_%b_%d_%H_%M_%S).bak.zip\" \"rubytask\"" \
        --message="Backup: ${GG}${base}/rubytask ${DG}=> ${GG}${base}/rubytask_$(command date +%Y_%b_%d_%H_%M_%S).bak.zip${N}" || {
            rescursor 1
        }
    cd

    spinner \
        --command="command rm -rf \"${base}/rubytask\"" \
        --message="Removing: ${GG}old rubytask${N}" || {
            rescursor 1
        }
fi

spinner \
    --command="command mv \"${path}\" \"${base}/rubytask\"" \
    --message="Moving: ${GG}${path} ${DG}=> ${GG}${base}/rubytask${N}" || {
        rescursor 1
    }

spinner \
    --command="command chmod +x \"${base}/rubytask/rubytask.rb\"" \
    --message="Setting up permission" || {
        rescursor 1
    }

spinner \
    --command="command ln -sf \"${base}/rubytask/rubytask.rb\" \"${symlink}/rubytask\"" \
    --message="Symlink: ${GG}${base}/rubytask/rubytask.rb ${DG}=> ${GG}${symlink}/rubytask${N}" || {
        rescursor 1
    }

printf '\n'
if command -v rubytask &>/dev/null; then
    echo -e "${GG}[+] ${N}Rubytask installed!"
    echo -e "${GG}[+] ${N}Usage: ${GG}rubytask --help ${N}to show helper"
    rescursor 0
else
    echo -e "${R}[!] ${N}Failed installing Rubytask!"
    rescursor 1
fi

# Copyright (c) 2026 Zeronetsec
#!/usr/bin/env bash
# Rubytask Project

N='\033[0m'
R='\033[1;31m'
B='\033[1;34m'
GG='\033[0;32m'

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

    echo -ne "\033[1;34m[*] \033[0m${msg}"
    command bash -c "${cmd}" > /dev/null 2>&1 &
    local pid=$!

    spinner_anim "$pid"
    wait "$pid"
    local status=$?

    if [[ "$status" -eq 0 ]]; then
        echo -ne " \033[0;32m✔ \033[0mSuccess\n"
    else
        echo -ne " \033[1;31m✖ \033[0mFailed (exit code: \033[0;32m${status}\033[0m)\n"
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
echo -e "\n${B}[*] ${N}Installing: ${GG}rubytask${N}"
printf '\n'

spinner \
    --command="command apt install ruby -y" \
    --message="Installing ruby" || {
        rescursor 1
    }

if [[ ! -d "$base" ]]; then
    spinner \
        --command="command mkdir -p "$base"" \
        --message="Create directory ${base}" || {
            rescursor 1
        }
fi

if [[ -d "$base/rubytask" ]]; then
    spinner \
        --command="command rm -rf "$base/rubytask"" \
        --message="Removing old rubytask" || {
            rescursor 1
        }
fi

spinner \
    --command="command mv "$path" "$base/rubytask"" \
    --message="Moving ${path} => ${base}/rubytask" || {
        rescursor 1
    }

spinner \
    --command="command chmod +x "$base/rubytask/rubytask.rb"" \
    --message="Set permission" || {
        rescursor 1
    }

spinner \
    --command="command ln -sf "$base/rubytask/rubytask.rb" "$symlink/rubytask"" \
    --message="Symlink ${base}/rubytask/rubytask.rb => ${symlink}/rubytask" || {
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
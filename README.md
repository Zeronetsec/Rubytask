<!-- Rubytask Project -->

[![version](https://img.shields.io/badge/Rubytask-Version%201.0-blue.svg?maxAge=259200)]()
[![os](https://img.shields.io/badge/Supported%20OS-Linux-blue.svg)]()
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

# Rubytask
Rubytask is a lightweight CLI tool for managing tasks and notes with zero dependencies. <br>

## Features
- Create new tasks
- View a list of all tasks
- Open and view task details
- Mark tasks as completed
- Delete tasks
- Add notes to a task
- Rename existing tasks

## Installation
```bash
git clone https://github.com/Zeronetsec/Rubytask.git
cd Rubytask
chmod +x install.sh
./install.sh

# for backup
./install.sh --backup
```

## Usage
``` bash
rubytask --create <name> [<date>]
rubytask --open <name>
rubytask --finish <name>
rubytask --delete <name>
rubytask --add-note <name>
rubytask --rename <name> <new_name>
rubytask --list
```

## License
This project is licensed under the MIT License. <br>

<!-- Copyright (c) 2026 Zeronetsec -->
#!/usr/bin/env ruby
# Rubytask Project

require 'json'
require 'fileutils'

N = "\033[0m"
R = "\033[1;31m"
GG = "\033[0;32m"
DG = "\033[1;90m"
CC = "\033[0;36m"

Dir[File.join(__dir__, 'utils', '*.rb')].each { |file| require file }

Name = "rubytask"
DATA_DIR = File.join(__dir__, 'data')
FileUtils.mkdir_p(DATA_DIR)

command = ARGV[0]

case command
    when '--create'
        name = ARGV[1]
        start_date = ARGV[2]
        if name
            Create.create_note(name, start_date)
        else
            puts "#{R}[!] #{N}Usage: #{GG}#{Name} --create #{DG}<#{CC}name#{DG}> [<#{CC}date#{DG}>]#{N}"
        end

    when '--list'
        List.list_notes

    when '--open'
        name = ARGV[1]
        if name
            OpenNote.open_note(name)
        else
            puts "#{R}[!] #{N}Usage: #{GG}#{Name} --open #{DG}<#{CC}name#{DG}>#{N}"
        end

    when '--finish'
        name = ARGV[1]
        if name
            Finish.finish_note(name)
        else
            puts "#{R}[!] #{N}Usage: #{GG}#{Name} --finish #{DG}<#{CC}name#{DG}>#{N}"
        end

    when '--delete'
        name = ARGV[1]
        if name
            Delete.delete_note(name)
        else
            puts "#{R}[!] #{N}Usage: #{GG}#{Name} --delete #{DG}<#{CC}name#{DG}>#{N}"
        end

    when '--add-note'
        name = ARGV[1]
        if name
            AddNote.add_note(name)
        else
            puts "#{R}[!] #{N}Usage: #{GG}#{Name} --add-note #{DG}<#{CC}name#{DG}>#{N}"
        end

    when '--rename'
        old_name = ARGV[1]
        new_name = ARGV[2]
        if old_name && new_name
            Rename.rename_note(old_name, new_name)
        else
            puts "#{R}[!] #{N}Usage: #{GG}#{Name} --rename #{DG}<#{CC}old_name#{DG}> <#{CC}new_name#{DG}>#{N}"
        end

    when '--uwu'
        printf "\033[?25l"
        Uwu.run(5)
        printf "\033[?25h"

    when '--version'
        Version.show_version

    when '--help'
        Birthday.rubytask_birthday
        Help.show_help

    else
        puts "#{R}[!] #{N}Invalid input!"
        puts "#{R}[!] #{N}Try: #{GG}#{Name} --help#{N}"
end

# Copyright (c) 2026 Zeronetsec
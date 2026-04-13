# Rubytask Project

module Help
    R = "\033[1;31m"
    N = "\033[0m"
    GG = "\033[0;32m"
    YY = "\033[0;33m"
    DG = "\033[1;90m"
    CC = "\033[0;36m"

    def self.show_help
        puts "#{N}Usage: #{GG}rubytask #{CC}<command> [<args>]#{N}"

        puts "#{N}Available command:"
        puts "    #{R}› #{GG}--create #{DG}<#{CC}name#{DG}> [<#{CC}date#{DG}>]       #{N}- #{YY}create a new task#{N}"
        puts "    #{R}› #{GG}--open #{DG}<#{CC}name#{DG}>                  #{N}- #{YY}open a task#{N}"
        puts "    #{R}› #{GG}--finish #{DG}<#{CC}name#{DG}>                #{N}- #{YY}finish a task#{N}"
        puts "    #{R}› #{GG}--delete #{DG}<#{CC}name#{DG}>                #{N}- #{YY}delete a task#{N}"
        puts "    #{R}› #{GG}--add-note #{DG}<#{CC}name#{DG}>              #{N}- #{YY}add note text to a task#{N}"
        puts "    #{R}› #{GG}--rename #{DG}<#{CC}name#{DG}> <#{CC}new_name#{DG}>     #{N}- #{YY}rename an existing task#{N}"
        puts "    #{R}› #{GG}--list                         #{N}- #{YY}list all tasks#{N}"
        puts "    #{R}› #{GG}--version                      #{N}- #{YY}show version#{N}"
        puts "    #{R}› #{GG}--help                         #{N}- #{YY}show this message#{N}"
    end
end

# Copyright (c) 2026 Zeronetsec
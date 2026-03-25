# Rubytask Project

module Help
    R = "\033[1;31m"
    N = "\033[0m"
    GG = "\033[0;32m"
    YY = "\033[0;33m"
    DG = "\033[1;90m"
    CC = "\033[0;36m"

    Name = "rubytask"

    def self.show_help
        puts "#{N}Rubytask command:"
        puts "    #{R}› #{N}#{Name} #{GG}--create #{DG}<#{CC}name#{DG}> [<#{CC}date#{DG}>]       #{N}- #{YY}Create a new task#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--list                         #{N}- #{YY}List all tasks#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--open #{DG}<#{CC}name#{DG}>                  #{N}- #{YY}Open a task#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--finish #{DG}<#{CC}name#{DG}>                #{N}- #{YY}Finish a task#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--delete #{DG}<#{CC}name#{DG}>                #{N}- #{YY}Delete a task#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--add-note #{DG}<#{CC}name#{DG}>              #{N}- #{YY}Add note text to a task#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--rename #{DG}<#{CC}name#{DG}> <#{CC}new_name#{DG}>     #{N}- #{YY}Rename an existing task#{N}" 
        puts "    #{R}› #{N}#{Name} #{GG}--version                      #{N}- #{YY}Show version#{N}"
        puts "    #{R}› #{N}#{Name} #{GG}--help                         #{N}- #{YY}Show this message#{N}"
    end
end

# Copyright (c) 2026 Zeronetsec
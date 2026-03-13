# Rubytask Project

module Version
    N = "\033[0m"
    GG = "\033[0;32m"

    PROJECT = "Rubytask"
    VERSION = "v1.0"
    CREATOR = "Zeronetsec"
    GITHUB = "https://github.com/Zeronetsec/Rubytask"

    def self.show_version
        puts "#{N}Project: #{GG}#{PROJECT}#{N}"
        puts "#{N}Version: #{GG}#{VERSION}#{N}"
        puts "#{N}Creator: #{GG}#{CREATOR}#{N}"
        puts "#{N}Homepage: #{GG}#{GITHUB}#{N}"
    end
end

# Copyright (c) 2026 Zeronetsec
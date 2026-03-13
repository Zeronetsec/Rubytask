# Rubytask Project

require 'json'

module OpenNote
    R  = "\033[1;31m"
    N  = "\033[0m"
    GG = "\033[0;32m"
    WW = "\033[0;37m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.open_note(name)
        file = Dir.glob(File.join(DATA_DIR, "#{name}_*.json")).first

        if file && File.exist?(file)
            note = JSON.parse(File.read(file))
            note['notes'] ||= "-"

            puts "#{GG}#{note['name']}#{N}"
            puts "#{R}› #{N}Start: #{GG}#{note['start_date']}#{N}"
            puts "#{R}› #{N}Finish: #{GG}#{note['finish_date']}#{N}"

            if note['notes'].nil? || note['notes'].strip.empty? || note['notes'] == "-"
                puts "#{R}› #{N}Notes: #{GG}-#{N}"
            else
                puts "#{R}› #{N}Notes:"
                note['notes'].split("\n").each do |line|
                puts "#{GG}- #{WW}#{line}#{N}"
                end
            end
        else
            puts "#{R}[!] #{N}Task: #{GG}#{name} #{N}not found!"
        end
    end
end

# Copyright (c) 2026 Zeronetsec
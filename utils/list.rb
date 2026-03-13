# Rubytask Project

require 'json'

module List
    N = "\033[0m"
    R = "\033[1;31m"
    GG = "\033[0;32m"
    DG = "\033[1;90m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.list_notes
        files = Dir.glob(File.join(DATA_DIR, '*.json'))
        if files.empty?
            puts "#{R}[!] #{N}There are no tasks yet!"
            return
        end

        files.each do |file|
            note = JSON.parse(File.read(file))
            puts "#{R}› #{N}Task: #{GG}#{note['name']} #{DG}| #{N}Start: #{GG}#{note['start_date']} #{DG}| #{N}Finish: #{GG}#{note['finish_date']}#{N}"
        end
    end
end

# Copyright (c) 2026 Zeronetsec
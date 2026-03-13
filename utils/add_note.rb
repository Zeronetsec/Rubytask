# Rubytask Project

require 'json'

module AddNote
    R  = "\033[1;31m"
    N  = "\033[0m"
    GG = "\033[0;32m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.add_note(name)
        file = Dir.glob(File.join(DATA_DIR, "#{name}_*.json")).first

        unless file && File.exist?(file)
            puts "#{R}[!] #{N}Task: #{GG}#{name} #{N}not found!"
            return
        end

        note = JSON.parse(File.read(file))
        note['notes'] ||= "-"

        print "Notes: "
        input = STDIN.gets.chomp.strip

        if input.empty?
            puts "#{R}[!] #{N}Nothing note entered!"
            return
        end

        if note['notes'] == "-" || note['notes'].strip.empty?
            note['notes'] = input
        else
            note['notes'] += "\n" + input
        end

        File.write(file, JSON.pretty_generate(note))
        puts "#{GG}[+] #{N}Note added to: #{GG}#{name}#{N}"
    end
end

# Copyright (c) 2026 Zeronetsec
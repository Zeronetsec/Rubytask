# Rubytask Project

require 'json'
require 'date'

module Finish
    R = "\033[1;31m"
    N = "\033[0m"
    GG = "\033[0;32m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.finish_note(name)
        file = Dir.glob(File.join(DATA_DIR, "#{name}_*.json")).first

        unless file
            puts "#{R}[!] #{N}Task: #{GG}#{name} #{N}not found!"
            return
        end

        note = JSON.parse(File.read(file))
        note['finish_date'] = DateTime.now.strftime("%Y-%m-%d")

        File.write(file, JSON.pretty_generate(note))
        puts "#{GG}[+] #{N}Task: #{GG}#{name} #{N}finished on #{GG}#{note['finish_date']}#{N}"
    end
end

# Copyright (c) 2026 Zeronetsec
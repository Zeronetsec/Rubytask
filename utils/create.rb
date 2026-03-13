# Rubytask Project

require 'json'
require 'fileutils'
require 'date'

module Create
    N = "\033[0m"
    R = "\033[1;31m"
    GG = "\033[0;32m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.create_note(name, start_date = nil)
        start_date = Date.today.strftime('%Y-%m-%d') if start_date.nil? || start_date.strip.empty?

        file_name = "#{name}_#{start_date}.json"
        path = File.join(DATA_DIR, file_name)

        if File.exist?(path)
            puts "#{R}[!] #{N}Task: #{GG}#{name} #{N}is already exist!"
            return
        end

        note = {
            "name" => name,
            "start_date" => start_date,
            "finish_date" => "-"
        }

        File.write(path, JSON.pretty_generate(note))
        puts "#{GG}[+] #{N}Task: #{GG}#{name} #{N}created successfully"
    end
end

# Copyright (c) 2026 Zeronetsec
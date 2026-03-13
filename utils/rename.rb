# Rubytask Project

require 'json'
require 'fileutils'

module Rename
    N = "\033[0m"
    GG = "\033[0;32m"
    R = "\033[1;31m"
    WW = "\033[0;37m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.rename_note(old_name, new_name)
        file_pattern = File.join(DATA_DIR, "#{old_name}_*.json")
        files = Dir[file_pattern]

        if files.empty?
            puts "#{R}[!] #{N}Task: #{GG}#{old_name} #{N}not found!"
            return
        end

        files.each do |old_file|
            filename = File.basename(old_file, ".json")
            _, date = filename.split("_", 2)

            new_file = File.join(DATA_DIR, "#{new_name}_#{date}.json")

            data = JSON.parse(File.read(old_file))
            data['name'] = new_name

            File.write(new_file, JSON.pretty_generate(data))
            File.delete(old_file)

            puts "#{GG}[+] #{N}Renamed: #{GG}#{old_name} #{WW}=> #{GG}#{new_name}#{N}"
        end
    end
end

# Copyright (c) 2026 Zeronetsec
# Rubytask Project

require 'fileutils'

module Delete
    N = "\033[0m"
    R = "\033[1;31m"
    GG = "\033[0;32m"
    YY = "\033[0;33m"

    DATA_DIR = File.join(__dir__, '..', 'data')

    def self.delete_note(name)
        file = Dir.glob(File.join(DATA_DIR, "#{name}_*.json")).first

        if file && File.exist?(file)
            File.delete(file)
            puts "#{YY}[-] #{N}Task: #{GG}#{name} #{N}deleted successfully"
        else
            puts "#{R}[!] #{N}Task: #{GG}#{name} #{N}not found!"
        end
    end
end

# Copyright (c) 2026 Zeronetsec
# Rubytask Project

module Uwu
    def self.run(duration)
        faces = [
            "(｡◕‿◕｡)",
            "(≧◡≦)",
            "ʕ•ᴥ•ʔ",
            "(・ω・)",
            "(๑˃ᴗ˂)ﻭ",
            "(ง'̀-'́)ง",
            "(=^･ω･^=)"
        ]

        delay = 0.2
        start_time = Time.now
        nyaa = 0

        loop do
            break if Time.now - start_time >= duration
            print "\r#{faces[nyaa % faces.length]}\033[K"
            sleep(delay)
            nyaa += 1
        end

        print "\r\033[K"
    end
end

# Copyright (c) 2026 Zeronetsec
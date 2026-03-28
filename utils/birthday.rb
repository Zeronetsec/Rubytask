# Rubytask Project

module Birthday
    R = "\033[1;31m"
    N = "\033[0m"
    GG = "\033[0;32m"

    def self.rubytask_birthday
        birth_date = "03-13"
        today = Time.now.strftime("%m-%d")

        if today == birth_date
            puts "#{R}› #{N}Happy birthday for #{GG}rubytask #{N}🎉\n"
            puts "\n"
        end
    end
end

# Copyright (c) 2026 Zeronetsec
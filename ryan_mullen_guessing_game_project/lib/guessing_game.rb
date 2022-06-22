class GuessingGame
    attr_reader :min, :max, :num_attempts
    attr_writer :secret_num, :num_attempts, :game_over

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false

    end

    def game_over?
        return @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num > @secret_num
            p "too big"
        elsif num != @secret_num
            @game_over = false
            p "too small"
        else
            @game_over = true
            p "you win"
        end
    end
        
    def ask_user
        p "enter a number"
        number = gets.chomp.to_i
        self.check_num(number)
    end

end


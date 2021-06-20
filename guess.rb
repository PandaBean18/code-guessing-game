require_relative "code"

class Mastermind

    attr_reader :secret_code
    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(code)
        p secret_code.num_exact_matches(code)
        p secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess = gets.chomp 
        code = Code.from_string(guess)
        print_matches(code)
        @secret_code == code
    end
end
 

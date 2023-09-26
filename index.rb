class Game
  def play
    # Generate random enemy code
    code = generate_code

    # Start game
    12.times do |i|
      guess = get_guess
      if check_guess(code, guess)
        puts 'You won the game'
        break
      else
        puts "#{12 - i - 1} tries left"
      end
    end
  end

  private

  def get_guess
    loop do
      puts 'Enter 4 numbers as your guess'
      guess = gets.chomp.to_s.split('')
      return guess if guess.length == 4
    end
  end

  def check_guess(code, guess)
    result = []
    4.times do |i|
      if code[i] == guess[i]
        result.push('+')
      elsif code.include?(guess[i])
        result.push('-')
      end
    end

    if result.all?('+')
      true
    else
      puts result
      false
    end
  end

  def generate_code
    code = []
    4.times do
      n = rand(5).to_s
      code.push(n)
    end

    # Return code
    code
  end
end

game = Game.new
game.play

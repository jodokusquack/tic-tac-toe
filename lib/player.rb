class Player

  attr_reader :sign

  def initialize(sign)
    @sign = sign
  end

  def set_move()
    begin
      puts("Player #{@sign}, where do you want to make your move? [row:col]")
      input = gets.chomp()
      if input[0].capitalize == "Q"
        abort("You quit the program")
      end
      if input.length != 3
        raise ArgumentError, "\e[31mPlease type in the format #:#.\n"\
        "The first # symbolizes the row and the second # the column.\e[0m"
      end

      if input[0].to_i > 3 or input[0].to_i < 1 or input[2].to_i > 3 or input[2].to_i < 1
        raise ArgumentError, "\e[31mPlease only input numbers from 1-3.\e[0m"
      end
    end
    row = input[0].to_i - 1
    col = input[2].to_i - 1
    return row, col
  end
end

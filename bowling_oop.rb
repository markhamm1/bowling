class Player

  def initialize(input_options)
    @name = input_options[:name]
  end

  def player
    return @players
  end

  def add_player(player)
    @players << player
  end

  def roll(player)
    index1 = 1
    total_pins = 0
    while index1 < player.length
      index2 = 0
      while index2 < player[index1].length
        if player[index1][index2].class == Integer
          total_pins += player[index1][index2]
        end
        index2 += 1
      end
      index1 += 1
    end
    return total_pins
  end

end

# def roll(player)
#   index1 = 1
#   total_pins = 0
#   while index1 < player.length
#     index2 = 0
#     while index2 < player[index1].length
#       if player[index1][index2].class == Integer
#         total_pins += player[index1][index2]
#       end
#       index2 += 1
#     end
#     index1 += 1
#   end
#   return total_pins
# end

def score(player)
  total_score = 0
  index = 1
  while index < player.length
    if index < 10
      if player[index][0] < 10
        if player[index][0] + player[index][1] == 10
          if player[index + 1] != nil
            total_score += player[index][0] + player[index][1] + player[index + 1][0]
          end
        else
          total_score += player[index][0] + player[index][1]
        end
      elsif player[index][0] == 10
        if player[index + 1] != nil
          if player[index + 1][1] == "-"
            if player[index + 2] != nil
              total_score += player[index][0] + player[index + 1][0] + player[index + 2][0]
            end
          else
              total_score += player[index][0] + player[index + 1][0] + player[index + 1][1]
          end
        end
      end
    elsif index == 10
      if player[index][0] + player[index][1] < 10
        total_score += player[index][0] + player[index][1]
      else
        total_score += player[index][0] + player[index][1] + player[index][2]
      end
    end
    index += 1
  end

  return total_score
end


index = 0

player1 = Player.new({"name" => "Megan", 1 => [], 2 => []})

# puts "How many players are bowling in today's game?"
# number_of_players = gets.chomp.to_i

# index = 0
# while index < number_of_players.length
#   puts "What is the name of player ##{index + 1}?"
#   player_name = gets.chomp.capitalize
#   players.add_player(Player.new{"name" => player_name})
#   index += 1
# end

while index < 10
  if index < 9
    puts "How many pins did you knock down on your first throw:"
    while true
      throw1 = gets.chomp.to_i
      if throw1 <= 10
        break
      else
        puts "Invalid entry. How many pins on first throw:"
      end
    end
    if throw1 < 10
      puts "How many pins did you knock down on your second throw:"
      while true
        throw2 = gets.chomp.to_i
        if throw1 + throw2 <= 10
          break
        else
          puts "Invalid entry. How many pins on second throw:"
        end
      end
      turn = [throw1, throw2]
      player1[index + 1] = turn
    elsif throw1 == 10
      turn = [throw1, "-"]
      player1[index + 1] = turn
    end
  else
    puts "Last frame. How many pins did you knock down on your first throw:"
    while true
      throw1 = gets.chomp.to_i
      if throw1 <= 10
        break
      else
        puts "Invalid entry. How many pins on first throw:"
      end
    end
    if throw1 < 10
      puts "How many pins did you knock down on your second throw:"
      while true
        throw2 = gets.chomp.to_i
        if throw1 + throw2 <= 10
          break
        else
          puts "Invalid entry. How many pins on second throw:"
        end
      end
      if throw1 + throw2 == 10
        puts "How many pins did you knock down on your third throw:"
        while true
          throw3 = gets.chomp.to_i
          if throw3 <= 10
            break
          else
            puts "Invalid entry. How many pins on second throw:"
          end
        end
        turn = [throw1, throw2, throw3]
        player1[index + 1] = turn
      else
        turn = [throw1, throw2]
        player1[index + 1] = turn
      end
    elsif throw1 == 10
      puts "How many pins did you knock down on your second throw:"
      while true
        throw2 = gets.chomp.to_i
        if throw2 <= 10
          break
        else
          puts "Invalid entry. How many pins on second throw:"
        end
      end
      puts "How many pins did you knock down on your third throw:"
      while true
        throw3 = gets.chomp.to_i
        if throw2 < 10
          if throw2 + throw3 <= 10
            break
          end
        elsif throw2 == 10
          if throw3 <= 10
            break
          end
        else
          puts "Invalid entry. How many pins on third throw:"
        end
      end
      turn = [throw1, throw2, throw3]
      player1[index + 1] = turn
    end
  end
  # p player1
  p player1.roll
  p score(player1)
  index += 1
end


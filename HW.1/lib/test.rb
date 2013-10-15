class RockPaperScissors
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    hand1 = player1[1]
    hand2 = player2[1]

    if ((hand1 =~ /[^rpsRPS]/) != nil) | ((hand2 =~ /[^rpsRPS]/) !=nil )
      raise NoSuchStrategyError,"Strategy must be one of R,P,S"
    end

    if hand1 == hand2
    return player1
    end

    if hand1=="R"
      if hand2=="S"
      return player1
      end
      if hand2=="P"
      return player2
      end
    end

    if hand1=="P"
      if hand2=="R"
      return player1
      end
      if hand2=="S"
      return player2
      end
    end

    if hand1=="S"
      if hand2=="P"
      return player1
      end
      if hand2=="R"
      return player2
      end
    end

  end

  def self.group(group)

    result = Array.new
    winners = Array.new
    group.each do |pair|
      tmpwinner = winner pair[0], pair[1]
      winners.push(tmpwinner)
    end

    counter = 0
    while winners.length > counter do
      result.push([winners[counter],winners[counter+1]])
      counter+=2
    end

    while result.length > 1 do
      result = group(result)
    end

    return result

  end
  
  def self.players?(tour)
    @count =0
    tour.each do |t|
      players?(t)
      count+=1
    end
    count
    
  end
  
  

  def self.tournament_winner(tournament)
    
    # check if we have been supplied with just 2 playrs
    if ! tournament[0][0].is_a? Array 
      return winner(tournament[0],tournament[1])
    end

    group1 = tournament[0]
    group2 = tournament[1]

    group1_finals = group(group1)
    group2_finals = group(group2)


    finalist1 = winner(group1_finals[0][0],group1_finals[0][1])
    finalist2 = winner(group2_finals[0][0],group2_finals[0][1])


    final_winner = winner finalist1, finalist2


  end
# tournament_winner([winners1,winners2])

end


print RockPaperScissors.tournament_winner [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ]
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

# print RockPaperScissors.tournament_winner([["mitsos","P"],["paparas","S"]])

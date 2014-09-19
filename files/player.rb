class Player 
	
	def initialize(game)
		@money = 100
		@total = 0
		@hand = []
		@game = game
	end

	def player_total
		@player_total
	end

	def total
		@total
	end

	def hand
		@hand
	end

	def money
		@money
	end

	def hit
		@hand << @game.deck.pop
	end

	def bust?(total)
		total > 21		
	end

	def blackjack?(total)
		total == 21 
	end

	def player_wins_round?(d_total, p_total)
		p_total < 22 && d_total <= p_total 	
	end

	def player_wins_round(d_total, p_total)
		puts "-------" * 10
		puts "-------" * 10
		puts "		YOU WIN THE ROUND!!!"
		puts "		Dealer: #{d_total} ||| Player: #{p_total}"	
	end

	def display_money(bet,money)
		puts "			You win #{bet}"
		puts "			Bank: #{money}"
		puts "-------" * 10
		puts "-------" * 10
	end

	def player_wins_game?(money)
		money >= 1000
	end

	def player_wins_game_display
		puts "-------" * 10
		puts "-------" * 10
		puts "				YOU WIN THE GAME!!!!"
		puts "-------" * 10
		puts "-------" * 10
		exit(0)
	end

	def display_player_total
		@display_player_total
		
		@hand.each do |card|
			puts "          ***CARD***: #{card.display} with #{card.value} points"
		end
		@total = 0
		hand.each do |card|
			@total+= card.value
		end
								
		puts ' ' * 20
		puts '                     ----------------'
		puts "                     Your TOTAL is #{@total}"
		puts '                     ----------------'	
		puts '_' * 70
	end

end
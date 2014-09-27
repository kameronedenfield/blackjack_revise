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
		total = 0
		@hand.each do |card|
			total+= card.value
		end
		@total = total
	end

	def hand
		@hand
	end

	def reset
		@hand = []
		@total = 0
	end

	def money
		@money
	end

	def hit
		@hand << @game.deck.pop
	end
	
	def display_money(bet)
		puts "			You win #{bet}"
		puts "			Bank: #{@money}"
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

	def display_card
		@hand.each do |card|
			puts "          ***CARD***: #{card.display} with #{card.value} points"
		end
	end

	def display_total
		@total = 0
		@hand.each do |card|
			@total+= card.value
		end
								
		puts ' ' * 20
		puts '                     ----------------'
		puts "                     Your TOTAL is #{@total}"
		puts '                     ----------------'	
		puts '_' * 70
	end

end
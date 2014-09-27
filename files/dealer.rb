class Dealer 

	def initialize(game)
		@total = 0
		@hand = []
		@game = game
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

	def hit
		
		puts ' ' * 20	
		puts "                      DEALER's CARDS:"
		puts '                      ---------------' 
		puts ' ' * 20

		if @total < 16
			@hand << @game.deck.pop
		end
	end

	
	
	def display_money(bet, money)
		puts "			You lose #{bet}"
		puts "			Bank left: #{money}"
		puts "-------" * 10
		puts "-------" * 10
	end

	def dealer_wins_game?(money)
		money <= 2
	end

	def dealer_wins_game_display
		puts "-------" * 10
		puts "-------" * 10
		puts "			OUT OF MONEY! YOU LOSE!!!"
		puts "-------" * 10
		puts "-------" * 10
		puts "				----GAME OVER-----"
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
		puts '                      -----------------'
		puts "                      Dealer TOTAL is #{@total}"
		puts '                      -----------------'
		puts '_' * 70	
	end

end
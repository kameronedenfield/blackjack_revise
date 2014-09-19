class Dealer 

	def initialize
		@dealer_hand = []
		@dealer_total = 0
	end

	def hit_dealer(total, hand, deck)
		
		puts ' ' * 20	
		puts "                      DEALER's CARDS:"
		puts '                      ---------------' 
		puts ' ' * 20

		if total < 16
			hand << deck.pop 
		end
	end

	def dealer_bust?(total)
		total > 21
	end

	def dealer_blackjack?(total)
		total == 21
	end

	def dealer_wins_round? (d_total,p_total)
		d_total < 22 && d_total > p_total
	end

	def dealer_wins_round(d_total, p_total)
		puts "-------" * 10
		puts "-------" * 10
		puts "		DEALER WINS THE ROUND!" 
		puts "		Dealer: #{d_total} ||| Player: #{p_total}"	
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

	def display_dealer_total(hand, total)

		hand.each do |card|
			puts "          ***CARD***: #{card.display} with #{card.value} points"
		end
		total = 0
		hand.each do |card|
			total+= card.value
		end
			
		puts ' ' * 20
		puts '                      -----------------'
		puts "                      Dealer TOTAL is #{total}"
		puts '                      -----------------'
		puts '_' * 70	
	end

end
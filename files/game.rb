class Game
	
	def initialize
		@player = Player.new self
		@dealer = Dealer.new self
		@deck = Card.deck
	end

	def bet
		@bet
	end

	def deck
		@deck
	end

	def total
		@total
	end

	def player
		@player
	end

	def dealer
		@dealer
	end

	

	# def save(money,deck)
	# save_hash = {"deck" => deck, "money" => money}
	# puts "choose a name for your save file"
	# file_name = "save/" << gets.chomp.downcase << ".rb"

	# File.open(file_name,"w"){|file|
	# 	file.write(YAML.dump(save_hash))
	# }
	# end
	
	def run
		
		@shuffle = @deck.shuffle!
		
		@money = 100

		until (@player.money >= 1000) == true || (@player.money <= 2) == true	

			# puts "Do you want to load a game(Y/N)?"
			# choice = gets.chomp.downcase
			# if choice == "y"
			# 	puts "Please enter file name:"
			# 	file_name = "save/" << gets.chomp.downcase << ".rb"
				
			# 	File.open(file_name,"w"){|file|
			# 	file.read(YAML.dump)
			# 	}	
			# end

			puts '_' * 20	
			puts ' ' * 20		
			puts "Current Bank: #{@money}" 
			puts '_' * 20	
			puts '_' * 20	
			puts '_' * 20
			puts ' ' * 20	
			puts "Place a bet!"
			puts '_' * 20	
			puts '_' * 20	
			puts '_' * 20
			puts 'Here:'
			
			@bet = gets.to_i

			if @bet > 0 && @bet <= @money
				
				# @player_total = 0
				# @dealer_total = 0
				# @dealer_hand = []
				# @hand = []
			
				puts ' ' * 20
				puts "                         Dealing..."
				puts '_' * 70
				puts ' ' * 20
				puts "                      YOUR CARDS:"
				puts '                      ------------' 
				puts ' ' * 20
			
				# hit player 
				@player.hit
				@player.hit

				#display
				@player.display_player_total
				
				# hit dealer
				dealer.hit_dealer(@dealer_total, @dealer_hand, @deck)
				
				#display
				dealer.display_dealer_total(@dealer_hand, @dealer_total)

				#keep track of total
				@hand.each do |card|
						@player_total+= card.value
					end
				
				#keep track of total	
				@dealer_hand.each do |card|
					@dealer_total+= card.value
				end

			else 
				puts '!' * 20
				puts ' ' * 20
				puts '!!!!!!ERROR!!!!!!!!!'
				puts ' ' * 20
				puts '!' * 20
				puts ' ' * 20
				puts "Please place a bet!"
				puts ' ' * 20
				@bet = gets.to_i
				# deal
			end	

			round = 0
			
			until round == "end"

				puts ' ' * 70
				puts'              ***** What do you what to do? *****'
				puts ' ' * 70
				puts'                     >>> HIT or STAND <<<        ' 
				puts '-' * 70
				@move = gets.chomp.downcase 
			
				# HIT	
				if @move == "hit" 					
					puts '_' * 70
					puts '_' * 70
					puts '_' * 70
					puts '                        ------------' 
					puts "                        >>> HIT <<<"
					puts '                        ------------' 
					
					#deals 1 card to player 
					player.hit(@hand, @deck)

					#displays player cards and total points
					player.display_player_total(@hand, @player_total)

					#deals 1 card to dealer 
					dealer.hit_dealer(@dealer_total, @dealer_hand, @deck)

					#displays dealer cards total points
					dealer.display_dealer_total(@dealer_hand, @dealer_total)

					@player_total = 0
					@dealer_total = 0

					#keep track of total
					@hand.each do |card|
						@player_total+= card.value
					end

					#keep track of total
					@dealer_hand.each do |card|
						@dealer_total+= card.value
					end

					#check for bust or blackjack (how can I make only one of these happen - e.g. it's possible for player to get Blackjack AND dealer to bust at the same time - this results in double win right now - not good)
					if player.bust?(@player_total) || dealer.dealer_blackjack?(@dealer_total)
						# puts "-------" * 10
						# puts "-------" * 10
						# puts "                       >>BUST!!<<"
						dealer.dealer_wins_round(@dealer_total, @player_total)
						@money -= @bet
						dealer.display_money(@bet,@money)
						round = "end"
							
					elsif dealer.dealer_bust?(@dealer_total) || player.blackjack?(@player_total)
						# puts "-------" * 10
						# puts "-------" * 10
						# puts "                     >>DEALER BUST!!!<<"
						player.player_wins_round(@dealer_total, @player_total)
						@money += @bet
						player.display_money(@bet,@money)
						round = "end"		
					end
						
					

				#STAND
				elsif @move == "stand" 			
					puts '_' * 70
					puts '_' * 70
					puts '_' * 70
					puts '                        ------------' 
					puts "                        >>> STAND <<<"
					puts '                        ------------' 
					
					#displays player cards and total points
					player.display_player_total(@hand, @player_total)
			
					#deals card and displays
					dealer.hit_dealer(@dealer_total, @dealer_hand, @deck)
					
					#gives dealer total
					dealer.display_dealer_total(@dealer_hand, @dealer_total)

					
					@player_total = 0
					@dealer_total = 0

					#keep track of total
					@hand.each do |card|
						@player_total+= card.value
					end
					
					#keep track of total
					@dealer_hand.each do |card|
						@dealer_total+= card.value
					end

					#check for dealer bust or blackjack 

					if dealer.dealer_bust?(@dealer_total)
						puts "-------" * 10
						puts "-------" * 10
						puts "                     >>DEALER BUST!!!<<"
						player.player_wins_round(@dealer_total, @player_total)
						@money += @bet
						player.display_money(@bet,@money)
						round = "end"
						
					elsif dealer.dealer_blackjack?(@dealer_total)
						puts "-------" * 10
						puts "-------" * 10
						puts "  				>>DEALER GOT BLACKJACK!!<<"
						dealer.dealer_wins_round(@dealer_total, @player_total)
						@money -= @bet
						dealer.display_money(@bet,@money)
						round = "end"
					end

					#check for round win 
					if player.player_wins_round?(@dealer_total, @player_total)
						player.player_wins_round(@dealer_total, @player_total)
						@money += @bet
						player.display_money(@bet,@money)
						round = "end"
				
					elsif dealer.dealer_wins_round?(@dealer_total, @player_total)
						dealer.dealer_wins_round(@dealer_total, @player_total)
						@money -= @bet
						dealer.display_money(@bet,@money)
						round = "end"
					end
					# puts YAML.load(@money)
					# puts YAML.load(@deck)

					puts "save or continue"
					choice = gets.chomp.downcase
					if choice == "save"
						save(@money,@deck)
					end

				#catch all other input
				else
					puts '_' * 20
					puts "please choose hit or stand"
					puts '_' * 20
				end	

				#check for game win
				if player.player_wins_game?(@money)
					player.player_wins_game_display
				end

				if dealer.dealer_wins_game? (@money)
					dealer.dealer_wins_game_display
				end
			end
		end
	end
end





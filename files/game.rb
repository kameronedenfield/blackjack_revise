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
		total = 0
		@hand.each do |card|
			total+= card.value
		end
		@total = total
	end

	def player
		@player
	end

	def dealer
		@dealer
	end

	def bust?
		@player.total > 21	
	end

	def dealer_bust?
		@dealer.total > 21	
	end

	def blackjack?
		@player.total == 21 
	end

	def dealer_blackjack?
		@dealer.total == 21 
	end


	def player_wins_round?
		@player.total < 22 && @dealer.total <= @player.total	
	end

	def player_wins_round
		puts "-------" * 10
		puts "-------" * 10
		puts "		YOU WIN THE ROUND!!!"
		puts "		Dealer: #{@dealer.total} ||| Player: #{@player.total}"	
	end
	

	def dealer_wins_round? 
		@dealer.total < 22 && @dealer.total > @player.total
	end

	def dealer_wins_round
		puts "-------" * 10
		puts "-------" * 10
		puts "		DEALER WINS THE ROUND!" 
		puts "		Dealer: #{@dealer.total} ||| Player: #{@player.total}"	
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

			@dealer.reset
			@player.reset

			if @bet > 0 && @bet <= @money
			
			
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
				@player.display_card

				@player.display_total
				
				# hit dealer
				@dealer.hit
				
				#display
				@dealer.display_card

				puts @dealer.display_total


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
					@player.hit

					#displays player cards and total points
					@player.display_card

					@player.display_total

					#deals 1 card to dealer 
					@dealer.hit

					#display
					@dealer.display_card

					puts @dealer.display_total


					#check for bust or blackjack (how can I make only one of these happen - e.g. it's possible for player to get Blackjack AND dealer to bust at the same time - this results in double win right now - not good)
					if bust? || dealer_blackjack?
						# puts "-------" * 10
						# puts "-------" * 10
						# puts "                       >>BUST!!<<"
						dealer_wins_round
						@money -= @bet
						@dealer.display_money(@bet, @money)
						round = "end"
							
					elsif dealer_bust? || blackjack?
						# puts "-------" * 10
						# puts "-------" * 10
						# puts "                     >>DEALER BUST!!!<<"
						player_wins_round
						@money += @bet
						@player.display_money(@bet)
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
					@player.display_card

					@player.display_total
			
					#deals card and displays
					dealer.hit
					
					#display
					@dealer.display_card

					puts @dealer.display_total

					
					@player_total = 0
					@dealer_total = 0


					#check for dealer bust or blackjack 

					if dealer_bust?
						puts "-------" * 10
						puts "-------" * 10
						puts "                     >>DEALER BUST!!!<<"
						player_wins_round
						@money += @bet
						@player.display_money(@bet)
						round = "end"
						
					elsif dealer_blackjack?
						puts "-------" * 10
						puts "-------" * 10
						puts "  				>>DEALER GOT BLACKJACK!!<<"
						dealer_wins_round
						@money -= @bet
						@dealer.display_money(@bet,@money)
						round = "end"
					end

					#check for round win 
					if player_wins_round?
						player_wins_round
						@money += @bet
						@player.display_money(@bet)
						round = "end"
				
					elsif dealer_wins_round?
						@dealer.dealer_wins_round
						@money -= @bet
						@dealer.display_money(@bet,@money)
						round = "end"
					end
					# puts YAML.load(@money)
					# puts YAML.load(@deck)

					# puts "save or continue"
					# choice = gets.chomp.downcase
					# if choice == "save"
					# 	save(@money,@deck)
					# end

				#catch all other input
				else
					puts '_' * 20
					puts "please choose hit or stand"
					puts '_' * 20
				end	

				#check for game win
				if @player.player_wins_game?(@money)
					@player.player_wins_game_display
				end

				if @dealer.dealer_wins_game? (@money)
					@dealer.dealer_wins_game_display
				end
			end
		end
	end
end





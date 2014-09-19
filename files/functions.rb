class Cardplayer

	def initialize 
		@hand = []
		@total = 0
	end

	def hand
		@hand
	end

	def total
		@total
	end

	def save(money,deck)
	save_hash = {"deck" => deck, "money" => money}
	puts "choose a name for your save file"
	file_name = "save/" << gets.chomp.downcase << ".rb"

	File.open(file_name,"w"){|file|
		file.write(YAML.dump(save_hash))
	}
	end

	# def deal
		
	# 	@player_total = 0
	# 	@dealer_total = 0
	
	# 	puts ' ' * 20
	# 	puts "                         Dealing..."
	# 	puts '_' * 70
	# 	puts ' ' * 20
	# 	puts "                      YOUR CARDS:"
	# 	puts '                      ------------' 
	# 	puts ' ' * 20
	
	# 	# hit player - only difference between deal and hit_player
	# 	@player_hand = [@deck.pop, @deck.pop]
		
	# 	display_player_total
		
	# 	hit_dealer

	# 	display_dealer_total
	# end

	def bet
		@bet
	end


	# def new_round
	# 	@player_hand = []
	# 	@dealer_hand = []

	# 	@player_total = 0
	# 	@dealer_total = 0

	# 	puts '_' * 20
	# 	puts '_' * 20
	# 	puts '_' * 20
	# 	puts ' ' * 20	
	# 	puts "   NEW ROUND"
	# 	puts '_' * 20
	# 	puts '_' * 20

	# 	#takes bet from player
	# 	get_bet
			
	# 	#initial deal
	# 	deal
	# end

	# def move
	# 	@move
	# end

end
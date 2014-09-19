class Card
	
	def self.deck
		@deck = []
		for face in ["ace",2,3,4,5,6,7,8,9,10,"jack","queen","king"]
			for suit in [' of hearts',' of spades',' of diamonds',' of clubs']
				@deck << Card.new(face,suit)
			end
		end
		@deck
	end

	def initialize(face,suit)
		@face = face # a,2,3,4,5,6,7,8,9,10,j,q,k
		@suit = suit # h,s,d,c
		@display = (face.to_s+suit)
	end

	def face 
		@face
	end

	def suit
		@suit
	end

	def display
		@display
	end

	def show
		@hand.each do |card|
			puts "          ***CARD***: #{card.display} with #{card.value} points"
		end
	end

	def value
		if @face == "ace"
			1
		elsif @face == "jack" or @face == "queen" or @face == "king"
			10
		else 
			face.to_i
		end		
	end

	def sum
        self.inject{|sum,x| sum + x }
    end

end
class Question

	attr_accessor :difficulty
	attr_reader :id, :standard_id

	def initialize(id, difficulty)

		@id, @difficulty = id, difficulty
		
	end

	
end
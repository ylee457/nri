class Question

	attr_accessor :difficulty
	attr_reader :id, :standard_id

	def initialize(id, difficulty, standard_id)

		@id, @difficulty, @standard_id = id, difficulty, standard_id
		
	end

	
end
class Standard

	attr_accessor :name
	attr_reader :id, :strand_id

	def initialize(id, name, strand_id)

		@id, @name, @strand_id = id, name, strand_id
		
	end

  
	  

end
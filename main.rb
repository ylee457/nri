
require File.expand_path('../questions', __FILE__)
require File.expand_path('../strands', __FILE__)
require File.expand_path('../standards', __FILE__)
require 'csv'

class Service

	def initialize
		@strands = {}
		@questions = {}
		@standards = {}
	end

	def run

		# ask question - using command line argument
		if ARGV.size != 1
      puts "Error! Please provide proper parameters to your command. \n\n"
      puts "Usage: ruby main.rb number_of_questions.\n"
      puts "Example. ruby main.rb 10"
      exit 1
    elsif ARGV[0].to_i <= 0
    	puts "Error! Please provide a positive number greater than 0 for the number of question. \n\n"
      puts "Usage: ruby main.rb number_of_questions.\n"
      puts "Example. ruby main.rb 10"
      exit 1
    end

		# process data file
		process_data_file('questions.csv')

		# debug print
		debug_print
		

		# distribute questions
		distribute_questions(ARGV[0])


		
	end


	private

	  def process_data_file(file_name)

	  	full_path = File.expand_path("data")
	  	file_name_path = full_path + '/' + file_name
	  	puts "Data file is imported from #{file_name_path}."

	  	# check to make sure the CSV file exists
      if !File.exist?(file_name_path) 
        
        puts "\nError! #{file_name_path} does not exist. Program exit."
        exit
      end


	  	# open csv file and read in data and build data structure

	  	CSV.foreach(file_name_path, headers: true) do |row|
        begin
  
          #puts "\n\nRow is #{row}"
          #puts "strand_id: #{row['strand_id']}. strand_name: #{row['strand_name']}." 
          # standard_id: #{row['standard_id']}. standard_name: #{row['standard_name']}. question_id: #{row['question_id']} difficulty: #{row['difficulty']}.\n"
  
          # skip empty row
          next if row.size == 0

          # store data info into a question hash
          unless @questions.has_key?(row['question_id'])
  
            a_question = Question.new(row['question_id'], row['difficulty'], row['standard_id'])
  
            @questions.store(row['question_id'], a_question)
  
          end

          # store standard
          unless @standards.has_key?(row['standard_id'])
  
            a_standard = Standard.new(row['standard_id'], row['standard_name'], row['strand_id'])
  
            @standards.store(row['standard_id'], a_standard)
  
          end

          # store strand
          unless @strands.has_key?(row['strand_id'])
  
            a_strand = Strand.new(row['strand_id'], row['strand_name'])
  
            @strands.store(row['strand_id'], a_strand)
  
          end
  
        rescue StandardError => e  
          puts "\nException in CSV for row: #{row}! Error is: #{e.message}."
        end
      end

	  end


	  def distribute_questions(total_questions)





	  	
	  end

	  def print_instances(label='', my_data)
      
      my_data.each do |q|
        puts "#{label} #{q}"
        puts "\n\n"
      end

    end

    def debug_print

      print_instances("strands:", @strands)
      print_instances("standrads:", @standards)
    	print_instances("ques:", @questions)
    	
    end
    

end



service = Service.new
service.run
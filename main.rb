
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
    end

		# process data file
		process_data_file('questions.csv')

		
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
          # standard_id: #{row['standard_id']}. standard_name: #{row['standard_name']}. question_id: #{row['question_id'] difficulty: #{row['difficulty']}.\n"
  
          # skip empty row
          next if row.size == 0
  
          
  
        rescue StandardError => e  
          puts "\nException in CSV for row: #{row}! Error is: #{e.message}."
        end
      end








	  	

	  end

end



service = Service.new
service.run
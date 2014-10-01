require_relative 'test_helper'

class SaverTest < MiniTest::Test

	def test_saved_a_csv
		csv 			 = Loader.new("test.csv")
		repository = Repository.new(csv.attendees)
		saver 		 = Saver.new
		attribute  = "first_name"
		criteria   = "sarah"
		queue      = repository.find_by(attribute, criteria)
		file_name  = "test_output_file.csv"

		saver.save_file(queue, file_name)

		assert File.exist?('./data/test_output_file.csv')

		File.delete('./data/test_output_file.csv')
	end
end

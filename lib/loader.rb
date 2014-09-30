require 'csv'

class Loader
	attr_reader :attendees
	def initialize(path="data/event_attendees.csv")
		data = CSV.open(path, headers: true, header_converters: :symbol)
		@attendees = data.map {|row| Entry.new(row)}
	end

	def save_file(queue, file_name)
		CSV.open("data/#{file_name}.csv", "wb") do |csv|
			csv << %w( ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode)
			queue.each do |entry|
				# csv << entry.to_a
				csv << [entry.id, entry.regdate, entry.first_name]
			end
		end
	end
end
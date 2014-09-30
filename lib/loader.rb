require 'csv'

class Loader
	attr_reader :attendees
	def initialize(path="data/event_attendees.csv")
		data = CSV.open(path, headers: true, header_converters: :symbol)
		@attendees = data.map {|row| Entry.new(row)}
	end
end
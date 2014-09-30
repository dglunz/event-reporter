class Entry
	attr_reader :regdate,
							:first_name,
							:last_name,
							:email_address,
							:homephone,
							:street,
							:city,
							:state,
							:zipcode,
							:cleaner

	def initialize(data)
		@cleaner       = Cleaner.new
		@id 					 = data[:_]
		@regdate			 = data[:regdate]
		@first_name		 = cleaner.clean(data[:first_name])
		@last_name 		 = cleaner.clean(data[:last_name])
		@email_address = cleaner.clean(data[:email_address])
		@homephone		 = cleaner.phone(data[:homephone])
		@street	       = cleaner.clean(data[:street])
		@city 				 = cleaner.clean(data[:city])
		@state 				 = cleaner.clean(data[:state])
		@zipcode 			 = data[:zipcode]
	end
end

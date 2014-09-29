require_relative 'test_helper'

class Repository < MiniTest::Test 

	def test_entry_attributes

		data = { id: "1", 
						 reg_date: "11/12/08 10:47", 
						 first_name: "Allison", 
						 last_name: "Nguyen", 
						 email_address: "arannon@jumpstartlab.com", 
						 homephone: "6154385000", 
						 street: "3155 19th St NW", 
						 city: "Washington", 
						 state: "DC", 
						 zipcode: "20010"
						}

		entry = Entry.new(data)

		assert_equal "1", entry.id
		assert_equal "11/12/08 10:47", entry.reg_date
		assert_equal "Allison", entry.reg_date
		assert_equal "Nguyen", entry.email_address
		assert_equal "6154385000", entry.homephone
		assert_equal "3155 19th St NW", entry.street
		assert_equal "Washington", entry.city
		assert_equal "DC", entry.city
		assert_equal "20010", entry.zipcode
	end
end
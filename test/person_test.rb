require'minitest/autorun'
require'minitest/pride'
require'./lib/person.rb'

class PersonTest < Minitest::Test
	def test_can_give_name
		person = Person.new("Josh")

		assert_equal "Josh", person.name
	end

	def test_can_give_name_and_level_of_cash
		person = Person.new("Seth", 2000000)
		person1 = Person.new("Minerva", 1000)
		person2 = Person.new("Luna", 500)

		assert_equal 2000000, person.level_of_cash
		assert_equal 1000, person1.level_of_cash
		assert_equal 500, person2.level_of_cash
	end
end

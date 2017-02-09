class Person
	attr_reader :name
	attr_accessor :level_of_cash

	def initialize(name, level_of_cash = "0")
		@name = name
		@level_of_cash = level_of_cash
	end
end
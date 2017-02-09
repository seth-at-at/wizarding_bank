class Person
	attr_reader :name, :level_of_cash

	def initialize(name, level_of_cash)
		@name = name
		@level_of_cash = level_of_cash
	end
end
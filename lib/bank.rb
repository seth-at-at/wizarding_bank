require_relative'person'
require'pry'

class Bank
	attr_reader :name, :has_account, :person_cash

	def initialize(name)
		@name = name
		@has_account = false
		@person_cash = 0
	end

	def open_account(person)
		@has_account = true
		{ Balance: 0, Cash: person.level_of_cash}
	end

	def deposit(person, cash)
		if cash <= person.level_of_cash
			person.level_of_cash -= cash
			open_account(person)[:Balance] += cash
			open_account(person)[:Cash] = person.level_of_cash
		else
			"#{person.name} does not have enough cash to perform this deposit."
		end
	end

	def withdrawal(person, cash)
		if cash <= open_account(person)[:Balance]
			person.level_of_cash += cash
			open_account(person)[:Balance] -= cash
			open_account(person)[:Cash] += cash 
		else
			"Insufficient funds."
		end
	end
end
require_relative'person'
require'pry'

class Bank
	attr_reader :name, :has_account, :person_cash, :people

	def initialize(name)
		@name = name
		@has_account = false
		@person_cash = 0
		@people = []
	end

	def has_account?(person)
		has_account
	end

	def open_account(person)
		@has_account = true
		if people.include?(person) != true
			people << person
		end
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

	def withdrawal(person, cash = "0")
		if cash <= open_account(person)[:Balance]
			person.level_of_cash += cash
			open_account(person)[:Balance] -= cash
			open_account(person)[:Cash] += cash 
		else
			"Insufficient funds."
		end
	end

	def transfer(person, bank, cash)
		if has_account?(person) == false
			"#{person.name} does not have an account with #{bank.name}"
		elsif cash > open_account(person)[:Balance]
			"Insufficient funds."
		else
			open_account(person)[:Balance] -= cash
			bank.open_account(person)[:Balance] += cash
		end
	end

	def total_cash
		people
	end
end
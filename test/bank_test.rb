require'minitest/autorun'
require'minitest/pride'
require'./lib/person'
require'./lib/bank'

class BankTest < Minitest::Test
	def test_bank_can_be_created
		bank = Bank.new("5/3 Bank")

		assert_equal "5/3 Bank", bank.name
	end

	def test_can_have_multiple_banks
		chase = Bank.new("JP Morgan Chase")
		wells_fargo = Bank.new("Wells Fargo")

		assert_equal "JP Morgan Chase", chase.name
		assert_equal "Wells Fargo", wells_fargo.name
	end

	def test_can_deposit_and_withdrawal_from_an_account
		chase = Bank.new("JP Morgan Chase")
		person1 = Person.new("Minerva", 1000)
		
		chase.open_account(person1)
		chase.deposit(person1, 750)

		assert_equal "Minerva does not have enough cash to perform this deposit.", chase.deposit(person1, 5000)
		assert_equal 250, chase.open_account(person1)[:Cash]
		assert_equal "Insufficient funds.", chase.withdrawal(person1, 500000)
	end

	def test_can_open_an_account
		chase = Bank.new("JP Morgan Chase")
		wells_fargo = Bank.new("Wells Fargo")
		
		person1 = Person.new("Minerva", 1000)
		chase.open_account(person1)

		assert_equal true, chase.has_account?(person1)


		assert_equal "Insufficient funds.", chase.transfer(person1, wells_fargo, 100000)
		assert_equal false, wells_fargo.has_account?(person1)

		wells_fargo.open_account(person1)

		assert_equal true, wells_fargo.has_account?(person1)
	end

	def test_can_get_total_amount_of_cash_in_bank

	end
end
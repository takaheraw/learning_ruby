class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = ['red', 'green', 'blue']
i = ArrayIterator.new(array)
while i.has_next?
  puts "item: #{i.next_item}"
end


class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

account1 = Account.new('foo', 100)
account2 = Account.new('bar', 50)
portfolio = Portfolio.new
portfolio.add_account(account1)
portfolio.add_account(account2)
p portfolio.any? {|account| account.balance > 50 }
p portfolio.all? {|account| account.balance > 50 }


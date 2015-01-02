class BankAccount
  attr_reader :balance

  def initialize(balance=0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class BankAccountProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def balance
    @real_object.balance
  end

  def deposit(amount)
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    @real_object.withdraw(amount)
  end
end

class VirtualAccountProxy
  def initialize(balance=0)
    @balance = balance
  end

  def deposit(amount)
    s = subject
    return s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    return s.withdraw(amount)
  end

  def balance
    s = subject
    return s.balance
  end

  def subject
    @subject || (@subject = BankAccount.new(@balance))
  end
end

account = BankAccount.new(100)
account.deposit(50)
account.withdraw(10)
proxy = BankAccountProxy.new(account)
proxy.deposit(100)

vproxy = VirtualAccountProxy.new(100)
vproxy.deposit(100)
vproxy.withdraw(50)

require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (receiver.valid? && sender.valid?) ? true : false
  end

  def execute_transaction
    if self.valid? == true
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
      @amount = 0
    else
      return "Transaction rejected. Please check your account balance."
    end
  end
end

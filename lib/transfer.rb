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
    (self.receiver.valid? && self.sender.valid?) ? true : false
  end

  def execute_transaction
    if self.valid? && @amount < @sender.balance 
      @receiver.balance += @amount
      @sender.balance -= @amount
      @amount = 0
      @status = "complete"
    elsif self.valid? == false
      return "Transaction rejected. Please check your account balance."
    end
  end
end

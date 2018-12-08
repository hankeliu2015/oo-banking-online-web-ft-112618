require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?  && self.receiver.valid?
  end

  def execute_transaction
    #check the status before making transaction
    if self.status == "pending" && self.sender.valid? && self.sender.balance > amount
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

    if self.status == "complete"

      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
    #binding.pry
  end

end #end of class

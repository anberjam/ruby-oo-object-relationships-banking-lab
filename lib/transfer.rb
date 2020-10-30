require 'pry'

class Transfer
  
  attr_reader :receiver, :sender, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
     sender.valid? && receiver.valid? 
  end

  def execute_transaction
    #@original_amount = self.amount
    
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.deposit(self.amount)
      sender.balance -= self.amount
      self.status = "complete"
      
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."


    #elsif  sender.balance < self.amount
     # self.status = "rejected"
      
      #self.amount = sender.
    end
  end

    def reverse_transfer
      if self.status== "complete"
        receiver.balance -= self.amount
        sender.deposit(self.amount)
        self.status = "reversed"
      end
    end 
end

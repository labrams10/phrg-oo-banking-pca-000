class Transfer
 attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    if status != "complete"
      sender.balance -= amount
      receiver.balance += amount
    end
    @status = "complete"
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
    end
    @status = "reversed"
  end



  def whatever_method
    @sender.any_method_ive_defined_in_bank_account
  end
end

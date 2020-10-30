class BankAccount
@@all = []

    attr_reader :name
    attr_accessor :balance, :status, :transfer

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def deposit(value)
        @balance +=value
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.balance > 0 && self.status == "open"
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end


end

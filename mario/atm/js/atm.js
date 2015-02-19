var accounts = {

  checking: {
    balance: 0,
    deposit: function (amount) {
      this.balance += amount;
    },
    withdraw: function (amount) {
      if (amount <= this.balance) {
        this.balance -= amount;
      } else if (amount <= combinedBalance()) {
        accounts.savings.balance = combinedBalance() - amount;
        this.balance = 0;
      }
    }
  },

  savings: {
    balance: 0,
    deposit: function (amount) {
      this.balance += amount;
    },
    withdraw: function (amount) {
      if (amount <= this.balance) {
        this.balance -= amount;
      } else if (amount <= combinedBalance()) {
        accounts.savings.balance = combinedBalance() - amount;
        this.balance = 0;
      }
    }
  }
};

var combinedBalance = function() {
  return accounts.checking.balance + accounts.savings.balance;
}

$( "#checkingDeposit" ).click(function() {
  var checkingAmount = parseInt($( "#checkingAmount" ).val());
  accounts.checking.deposit(checkingAmount);
  $( "#balance1" ).html("$" + accounts.checking.balance);
});

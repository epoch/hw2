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
        accounts.checking.balance = combinedBalance() - amount;
        this.balance = 0;
      }
    }
  }
};

var combinedBalance = function() {
  return accounts.checking.balance + accounts.savings.balance;
}

var balanceRedChecking = function(account) {
  if (accounts.checking.balance === 0) {
    $( "#balance1" ).addClass( "zero" );
  } else {
    $( "#balance1" ).removeClass( "zero" );
  }
}

var balanceRedSavings = function(account) {
  if (accounts.savings.balance === 0) {
    $( "#balance2" ).addClass( "zero" );
  } else {
    $( "#balance2" ).removeClass( "zero" );
  }
}

var updateBalance = function() {
  $( "#balance1" ).html("$" + accounts.checking.balance);
  $( "#balance2" ).html("$" + accounts.savings.balance);
  balanceRedChecking();
  balanceRedSavings();
}

$( "#checkingDeposit" ).click(function() {
  var checkingAmount = parseInt($( "#checkingAmount" ).val());
  accounts.checking.deposit(checkingAmount);
  updateBalance();
});

$( "#checkingWithdraw" ).click(function() {
  var checkingAmount = parseInt($( "#checkingAmount" ).val());
  accounts.checking.withdraw(checkingAmount);
  updateBalance();
});

$( "#savingsDeposit" ).click(function() {
  var savingsAmount = parseInt($( "#savingsAmount" ).val());
  accounts.savings.deposit(savingsAmount);
  updateBalance();
});

$( "#savingsWithdraw" ).click(function() {
  var savingsAmount = parseInt($( "#savingsAmount" ).val());
  accounts.savings.withdraw(savingsAmount);
  updateBalance();
});

updateBalance();
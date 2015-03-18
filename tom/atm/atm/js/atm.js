var accounts = {
  checking: {
    balance: 0,
    deposit: function (amount) {
      amount = parseInt($('#checkingAmount').val());
      accounts.checking.balance += amount;

      var $bal = $('#balance1');
      $bal.text('$' + accounts.checking.balance)
      accounts.inTheRed();
    },
    withdraw: function (amount) {

      amount = parseInt($('#checkingAmount').val());

      if ((accounts.checking.balance - amount < 0) === false){

        accounts.checking.balance -= amount;
        var $bal = $('#balance1');
        $bal.text('$' + accounts.checking.balance)

      } else if ((accounts.checking.balance + accounts.savings.balance) - amount >= 0) {    // overdraft protection

        var leftOvers = amount - accounts.checking.balance;
        accounts.checking.balance = 0;
        accounts.savings.balance -= leftOvers;

        var $bal = $('#balance1');
        var $bal2 = $('#balance2');
        $bal.text('$' + accounts.checking.balance);
        $bal2.text('$' + accounts.savings.balance);
      }

      accounts.inTheRed();
    }
  },

  savings: {
    balance: 0,
    deposit: function (amount) {
      amount = parseInt($('#savingsAmount').val());
      accounts.savings.balance += amount;

      var $bal = $('#balance2');
      $bal.text('$' + accounts.savings.balance)
      accounts.inTheRed();
    },
    withdraw: function (amount) {

      amount = parseInt($('#savingsAmount').val());

      if ((accounts.savings.balance - amount < 0) === false){

        accounts.savings.balance -= amount;
        var $bal = $('#balance2');
        $bal.text('$' + accounts.savings.balance)

      } else if ((accounts.checking.balance + accounts.savings.balance) - amount >= 0) {

        var leftOvers = amount - accounts.savings.balance;
        accounts.savings.balance = 0;
        accounts.checking.balance -= leftOvers;

        var $bal = $('#balance1');
        var $bal2 = $('#balance2');
        $bal.text('$' + accounts.checking.balance);
        $bal2.text('$' + accounts.savings.balance);
      }

      accounts.inTheRed();
    }
  },

  inTheRed: function(){
    var $background1 = $('#balance1');
    var $background2 = $('#balance2');

    if (accounts.checking.balance === 0) {
      $background1.css("background-color", "red");
    } else {
      $background1.css("background-color", "#E3E3E3");
    }

    if (accounts.savings.balance === 0) {
      $background2.css("background-color", "red");
    } else {
      $background2.css("background-color", "#E3E3E3");
    }
  }
};

// initial call to set red by default, then called AFTER each
// transaction (to check if new value affects it)
accounts.inTheRed();

// Button events

var $checkingDeposit = $('#checkingDeposit');
$checkingDeposit.click(accounts.checking.deposit);

var $checkingWithdraw = $('#checkingWithdraw');
$checkingWithdraw.click(accounts.checking.withdraw);

var $savingsDeposit = $('#savingsDeposit');
$savingsDeposit.click(accounts.savings.deposit);

var $savingsWithdraw = $('#savingsWithdraw');
$savingsWithdraw.click(accounts.savings.withdraw);

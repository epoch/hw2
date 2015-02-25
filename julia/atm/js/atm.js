var checkingBalance = 0;
var savingsBalance = 0;

var checkingDeposit = function (amount) {
  if (amount > 0) {
    checkingBalance += amount;
  };
};

var checkingWithdraw = function (amount) {
  if (amount <= checkingBalance) {
    checkingBalance -= amount;
  } 
  else if (amount <= getTotalBalance()) {
    var newCheckingBalance = Math.abs(amount - checkingBalance);
    savingsBalance = savingsBalance - newCheckingBalance;
    $('#balance2').text('$' + savingsBalance);
    checkingBalance = 0;
  };
};

var savingsDeposit = function (amount) {
  if (amount > 0) {
    savingsBalance +=amount;
  };
};

var savingsWithdraw = function (amount) {
  if (amount <= savingsBalance) {
    savingsBalance -=amount;
       } 
  else if (amount <= getTotalBalance()) {
    var newSavingsBalance = Math.abs(amount - savingsBalance);
    checkingBalance = checkingBalance - newSavingsBalance;
    $('#balance1').text('$' + checkingBalance);
    savingsBalance = 0;
  };
};

var getTotalBalance = function () {
  return checkingBalance + savingsBalance;
}

$(document).ready(function () {

  var updateChecking = function () {
    $('#balance1').text('$' + checkingBalance);
    $('#checkingAmount').val('');

    if (checkingBalance === 0) {
      $('#checkingAccount').addClass('zero');
    } else {
      $('#checkingAccount').removeClass('zero');
    }
  };

  var updateSavings = function () {
    $('#balance2').text('$' + savingsBalance);
    $('#savingsAmount').val('');

    if (savingsBalance === 0) {
      $('#savingsAccount').addClass('zero');
    } else {
      $('#savingsAccount').removeClass('zero');
    }
  };

  $('#checkingDeposit').on('click', function () {
    var amount = parseInt($('#checkingAmount').val());
    checkingDeposit(amount);
    updateChecking();
  });

  $('#checkingWithdraw').on('click', function () {
    var amount = parseInt($('#checkingAmount').val());
    checkingWithdraw(amount);
    updateChecking();
  });

  $('#savingsDeposit').on('click', function () {
    var amount = parseInt($('#savingsAmount').val());
    savingsDeposit(amount);
    updateSavings();
  });

  $('#savingsWithdraw').on('click', function () {
    var amount = parseInt($('#savingsAmount').val());
    savingsWithdraw(amount);
    updateSavings();
  });
});


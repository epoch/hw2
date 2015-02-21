// A possible approach:
var accounts = {
  checking: {
    balance: 0,
    deposit: function (amount) {
      var checkingAmount = $('#checkingAmount').val()
      $('#checkingAmount').val('');
      accounts.checking.balance = accounts.checking.balance + parseInt(checkingAmount);
      $('#balance1').html('$' + accounts.checking.balance)
    },
    withdraw: function (amount) {
      var checkingAmount = $('#checkingAmount').val()
      $('#checkingAmount').val('');
      accounts.checking.balance = accounts.checking.balance - parseInt(checkingAmount);
      $('#balance1').html('$' + accounts.checking.balance)
    }
  },

  savings: {
    balance: 0,
    deposit: function (amount) {
      var savingsAmount = $('#savingsAmount').val()
      $('#savingsAmount').val('');
      accounts.savings.balance = accounts.savings.balance + parseInt(savingsAmount);
      $('#balance2').html('$' + accounts.savings.balance)
    },
    withdraw: function (amount) {
      var savingsAmount = $('#savingsAmount').val()
      $('#savingsAmount').val('');
      accounts.savings.balance = accounts.savings.balance - parseInt(savingsAmount);
      $('#balance2').html('$' + accounts.savings.balance)
    }
  }
};

$('#savingsDeposit').on( "click", function() {
  accounts.savings.deposit();
});

$('#savingsWithdraw').on( "click", function() {
  accounts.savings.withdraw();
});

$('#checkingDeposit').on( "click", function() {
  accounts.checking.deposit();
});

$('#checkingWithdraw').on( "click", function() {
  accounts.checking.withdraw();
});

if (accounts.checking.balance === 0 || accounts.savings.balance == 0) {
  $('#balance1').class = '.zero'
}
else {
  movePixels = Math.abs(movePixels);
  img.id = null;
}

if (accounts.checking.balance === 0) { 
 var $checkingred = $('#balance1');
 $checkingred.addClass('red'); 
}
else { 
 var $checkingred = $('#balance1');
 $checkingred.removeClass('red'); 
}




// // Where do I start from here?

// // Get value from savingsAmount input

// var savingsAmount = $('#savingsAmount').val();

// // Reset savingsAmount input
// $('#savingsAmount').val('');


// // Deposit button gets value and updates balance
// var savingsDeposit = $('#savingsDeposit');

// savingsDeposit.addEventListener('click', accounts.savings.deposit);


// // Get value from checkingAmount input
// var checkingAmount = $('#checkingAmount').val();

// // Reset checkingAmount input
// $('#savingsAmount').val('');



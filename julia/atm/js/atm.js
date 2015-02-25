var accounts = {
  checking: {
    balance: 0,
    deposit: $('#checkingDeposit').on('click', function () {
      var $currentAmount = parseInt($('#balance1').html());
      var $amt = parseInt($('#checkingAmount').val());
      $('#balance1').text($amt + $currentAmount);
    }),

    withdraw: $('#checkingWithdraw').on('click', function () {
      var $currentAmount = parseInt($('#balance1').html());
      var $amt = parseInt($('#checkingAmount').val());

      if ($currentAmount > $amt) {
        $('#balance1').text($currentAmount - $amt);
      } else if ($currentAmount < $amt){
          var $currentSavAmount = parseInt($('#balance2').html());
          var totalBalance = $currentSavAmount + $currentAmount;

          if ($totalBalance > $amt ) {
            $('#balance1').text("Yes");
          } else{
            $('#balance1').text('No');
          }

      }
    })
  },

  savings: {
    balance: 0,
    deposit: function (amount) {},
    withdraw: function (amount) {}
  }
}


// $('#checkingDeposit').on('click', function () {
//   console.log('clicked!');
// });

// $('#checkingDeposit').click();
// $('#savingsDeposit').click();
// $('#checkingWithdraw').click();
// $('#savingsWithdraw').click();
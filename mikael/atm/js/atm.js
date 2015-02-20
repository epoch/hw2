$(document).ready(function () {
  var $balance = {
    $checking: 0,
    $savings: 0
  };

  var checkingDeposit = function() {
    var $checkingAmount = parseInt($('#checkingAmount').val());
    $balance.$checking += $checkingAmount;
    updateBalance($balance.$checking, '#balance1');
  }

  var checkingWithdraw = function() {
    var $checkingAmount = parseInt($('#checkingAmount').val());
    var $newChecking = $balance.$checking - $checkingAmount;

    if ($newChecking >= 0) {
      $balance.$checking = $newChecking;
      updateBalance($balance.$checking, '#balance1');
    } else if (0 > $balance.$savings + ($balance.$checking - $checkingAmount)) {
      alert("Don't be a little bitch.");
    } else {
      $balance.$savings += ($balance.$checking - $checkingAmount);
      $balance.$checking = 0;
      updateBalance($balance.$checking, '#balance1');
      updateBalance($balance.$savings, '#balance2');
    }
  }

  var savingsDeposit = function() {
    var $savingsAmount = parseInt($('#savingsAmount').val());
    $balance.$savings += $savingsAmount;
    updateBalance($balance.$savings, '#balance2');
  }

  var savingsWithdraw = function() {
    var $savingsAmount = parseInt($('#savingsAmount').val());
    var $newSavings = $balance.$savings - $savingsAmount;
    if ($newSavings >= 0) {
      $balance.$savings = $newSavings;
      updateBalance($balance.$savings, '#balance2');
    } else {
      alert("Don't be a little bitch.");
    }
  }

  var updateBalance = function(amount, selector) {
    $(selector).text('$' + amount);
    cssChanger();
  }

  var cssChanger = function() {
    $('#balance1, #balance2').removeClass('zero');

    if ($balance.$checking <= 0) {
      $('#balance1').addClass('zero');
    }

    if ($balance.$checking <= 0) {
      $('#balance2').addClass('zero');
    }
  }

  $('#checkingDeposit').click(checkingDeposit);
  $('#savingsDeposit').click(savingsDeposit);
  $('#checkingWithdraw').click(checkingWithdraw);
  $('#savingsWithdraw').click(savingsWithdraw);
});

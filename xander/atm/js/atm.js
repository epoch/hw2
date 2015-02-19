
var accounts = {
  checking: {
    balance: 0,
    deposit: function (amount) {
      $('accounts.checking.balance').replaceWith(accounts.checking.balance + amount);

    },
    withdraw: function (amount) {

    }
  },


  savings: {
    balance: 0,
    deposit: function (amount) {


    },
    withdraw: function (amount) {


    }
  }
};

// $(#checkingDeposit).click(accounts.checking.deposit)

// var logDiv = $( "#log" );
// 
// for ( var i = 0; i < 5; i++ ) {
//   $( "button" ).eq( i ).on( "click", { value: i }, function( event ) {
//     var msgs = [
//       "button = " + $( this ).index(),
//       "event.data.value = " + event.data.value,
//       "i = " + i
//     ];
//     logDiv.append( msgs.join( ", " ) + "<br>" );
//   });
// }
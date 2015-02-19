console.log('hello');

var accounts = {
  checking: {
    balance: 0,
    deposit: $('#checkingDeposit').on('click', function (amount) {
                var $amt = parseInt($( "#checkingAmount" ).val());
                accounts.checking.balance += $amt;
                $('#balance1').html(accounts.checking.balance); 
    }),

    withdraw: $('#checkingWithdraw').on('click', function (amount) {
               var $amt = parseInt($( "#checkingAmount" ).val());

                var totalBalance = accounts.savings.balance + accounts.checking.balance;

                if ($amt > accounts.checking.balance && $amt < totalBalance ) {
                    console.log("hello im overdrawn checkings");
                    var overdraft = Math.abs($amt - accounts.checking.balance);
                    accounts.checking.balance = 0;
                    accounts.savings.balance -= overdraft;
                    $('#balance1').html(accounts.checking.balance); 
                    $('#balance2').html(accounts.savings.balance); 

                }else if ($amt > accounts.checking.balance && $amt > totalBalance){
                    console.log("insufficient funds even for overdraft");
                     $('#balance2').html("Insufficient funds");

                }else if ($amt < accounts.checking.balance){
                    accounts.checking.balance -= $amt;
                    $('#balance1').html(accounts.checking.balance); 
                }
    })

  },

  savings: {
    balance: 0,
    deposit: $('#savingsDeposit').on('click', function (amount) {
                var $amt = parseInt($( "#savingsAmount" ).val());
                accounts.savings.balance += $amt;
                $('#balance2').html(accounts.savings.balance); 
    }),

    withdraw: $('#savingsWithdraw').on('click', function (amount) {
               var $amt = parseInt($( "#savingsAmount" ).val());
 
                var totalBalance = accounts.savings.balance + accounts.checking.balance;

                if ($amt > accounts.savings.balance && $amt < totalBalance ) {
                    console.log("hello im overdrawn savings");
                    var overdraft = Math.abs($amt - accounts.savings.balance);
                    accounts.savings.balance = 0;
                    accounts.checking.balance -= overdraft;
                    $('#balance1').html(accounts.checking.balance); 
                    $('#balance2').html(accounts.savings.balance); 

                }else if ($amt > accounts.savings.balance && $amt > totalBalance){
                    console.log("insufficient funds even for overdraft");
                    $('#balance2').html("Insufficient funds");

                }else if ($amt < accounts.savings.balance){
                    accounts.savings.balance -= $amt;
                    $('#balance2').html(accounts.savings.balance); 
                }

    })

  },
    
};

function changeCheckingBackground(balance){
    if (accounts.checking.balance === 0){
        console.log("bal is equal to zero");
        $('#balance1').addClass('zero-background');
    }else{
        console.log("bal is greater than zero");
        $('#balance1').removeClass('zero-background');
    }
}

// changeCheckingBackground();

function changeSavingsBackground(){
    if (accounts.savings.balance === 0){
        $('#balance2').addClass('zero-background');
    }else{
        $('#balance2').removeClass('zero-background');
    }
}

// changeSavingsBackground();



// function changeSavingsBackground(){
//     if (accounts.checking.balance === 0 || accounts.savings.balance === 0){
//         $('#balance1').addClass('zero-background');
//         $('#balance2').addClass('zero-background');
//     }
//     else{
//         console.log("Im going into the else case");
//         $('#balance1').removeClass('zero-background');
//         $('#balance2').removeClass('zero-background');
//     }
// }
// changeBackgroundColor();


// var totalBalance = accounts.savings.balance + accounts.checking.balance

// var overdraftChecking = function(){
//     if ($amt > accounts.checking.balance && $amt < totalBalance ) {
//         console.log("hello im overdrawn checkings");

//     }
// }


// var overdraftSavings = function(){

// }
// overdraftSavings();




// $('#checkingDeposit').on('click', function () {
//   console.log('clicked!');
//   $amt = $( "#checkingAmount" ).val();
//   $('#balance1').text($amt);

// });

// $('#checkingWithdraw').on('click', function () {
//   console.log('clicked!');
// });



// $('#checkingWithdraw').click(onButtonClick)



// still to go 

// // When the balance of the bank account is $0 the background of that bank account 
// should be red. It should be gray when there is money in the account 
// (hint: add/remove classes with corresponding colours set in the CSS).

// // What happens when the user wants to withdraw more money from the checking account 
// than is in the account? These accounts have overdraft protection, so if a withdrawal 
// can be covered by the balances in both accounts, take the checking balance down to $0 
// and take the rest of the withdrawal from the savings account. 

// If the withdrawal amount 
// is more than the combined account balance, ignore it.
// // Make sure there is overdraft protection going both ways.
// // Are there ways to refactor your code to make it DRYer



// Done

// // Keep track of the checking and savings balances somewhere
// // Add functionality so that a user can deposit money into one of the bank accounts.
// // Make sure you are updating the display and manipulating the HTML of the page so a 
// user can see the change.
// // Add functionality so that a user can withdraw money from one of the bank accounts.
// // Make sure you are updating the display and manipulating the HTML of the page so a 
// user can see the change.
// // Make sure the balance in an account can't go negative. If a user tries to withdraw 
// more money than exists in the account, ignore the transaction.



// https://gist.github.com/wofockham/f0631a5710d78d12d44d

/*To do
1. grab value from Deposit & Withdraw
2. build event handlers for Deposit & Withdraw buttons
3. print amount in balance1 and balance2
4. disable negative numbers in value
5. change BG-color of .balance when 0
6. overdraft protection
*/

// this part is just about js and logic (ie the model)
var accounts = {

    checking: {
        balance: 0,
        deposit: function(amount) {
            if (amount > 0) {
                accounts.checking.balance += amount;
            }
        },
        withdraw: function(amount) {
            if (amount <= accounts.checking.balance) {
                accounts.checking.balance -= amount;
            }
        }
    },

    savings: {
        balance: 0,
        deposit: function(amount) {
            if (amount > 0) {
                accounts.savings.balance += amount;
            }
        },
        withdraw: function(amount) {
            if (amount <= accounts.savings.balance) {
                accounts.savings.balance -= amount;
            }
        }
    }
};

// down here is jQuery with event handlers which call inside the account (ie the controller)
// this part works out the input and pushes it to var accounts

var ATM;

$(document).ready(function() {

    ATM = {
        ui: {
            $checkingDeposit: $('#checkingDeposit'),
            $checkingWithdrawal: $('#checkingWithdraw'),
            $checkingAmount: $('#checkingAmount'),
            $checkingBalance: $('#balance1'),
            $checkingAccount: $('checkingAccount'),
            $savingsDeposit: $('#savingsDeposit'),
            $savingsWithdrawal: $('#savingsWithdraw'),
            $savingsAmount: $('#savingsAmount'),
            $savingsBalance: $('#balance2'),
            $savingsAccount: $('savingsAccount')
        },
        updateChecking: function() {
            ATM.ui.$checkingBalance.text('$' + accounts.checking.balance);
            ATM.ui.$checkingAmount.val('');

            if (accounts.checking.balance === 0) {
                ATM.ui.$checkingAccount.addClass('zero');
            } else {
                ATM.ui.$checkingAccount.removeClass('zero');
            }
        },

        updateSaving: function() {
            ATM.ui.$savingsBalance.text('$' + accounts.savings.balance);
            ATM.ui.$savingsAmount.val('');

            if (accounts.savings.balance === 0) {
                ATM.ui.$savingsAccount.addClass('zero');
            } else {
                ATM.ui.$savingsAccount.removeClass('zero');
            }
        }
    };

    ATM.ui.$checkingDeposit.on('click', function() {
        var amount = parseInt(ATM.ui.$checkingAmount.val());
        accounts.checking.deposit(amount);
        ATM.updateChecking();
    });

    ATM.ui.$checkingWithdrawal.on('click', function() {
        var amount = parseInt(ATM.ui.$checkingAmount.val());
        accounts.checking.withdraw(amount);
        accounts.savings.withdraw(amount);
        ATM.updateChecking();
        ATM.updateSaving();
    });

    ATM.updateChecking();

    ATM.ui.$savingsDeposit.on('click', function() {
        var amount = parseInt(ATM.ui.$savingsAmount.val());
        accounts.savings.deposit(amount);
        ATM.updateSaving();
    });

    ATM.ui.$savingsWithdrawal.on('click', function() {
        var amount = parseInt(ATM.ui.$savingsAmount.val());
        accounts.savings.withdraw(amount);
        accounts.checking.withdraw(amount);
        ATM.updateSaving();
        ATM.updateChecking();
    });

    ATM.updateSaving();

});
class BankAccount {
  constructor(initialBalance) {
    this.initialBalance = initialBalance;
    this.transactions = [];
    this.currentBalance = initialBalance;
  }

  addTransaction(amount) {
  this.transactions.push(amount);
  }

  getBalance() {
    let total = this.initialBalance;
    this.transactions.forEach((transaction) => {
      total += transaction;
    });
    this.currentBalance = total;
    console.log(total);
  }
}



let myInitialBalance = 1000;

let myBankAccount = new BankAccount(myInitialBalance);
myBankAccount.getBalance();
myBankAccount.addTransaction(-300);
myBankAccount.getBalance();
myBankAccount.addTransaction(-300);
myBankAccount.getBalance();
myBankAccount.addTransaction(-300);
myBankAccount.getBalance();

// Third version of MTA, first version in Javascript

const LINES = {
    n_line : ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
    l_line : ["8th", "6th", "Union Square", "3rd", "1st"],
    six_line : ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

singleLine = {
  line : "n_line",
  startStation : "28th",
  finishStation : "8th",

  startIndex : function() {
    return LINES[this.line].indexOf(this.startStation)
  },

  finishIndex : function() {
    return LINES[this.line].indexOf(this.finishStation)
  },

  counter : function() {
    return Math.abs(this.finishIndex() - this.startIndex());
  },

  stations : function() {
    if (this.finishIndex() === this.startIndex()) {
      return [LINES[this.line][this.startIndex]]
    } else if (this.startIndex() < this.finishIndex()) {
      return LINES[this.line].slice(this.startIndex(), this.finishIndex() + 1)
    } else {
      return (LINES[this.line].slice(this.finishIndex(), this.startIndex() + 1)).reverse()
    }
  }
}

mta = {
  startLine : "n_line",
  finishLine : "six_line",
  startStation : "28th",
  finishStation : "Grand Central",

  journey : function () {
    if (this.startLine === this.finishLine) {
      return this.tripWithNoTransfers()
    } else {
      return this.tripWithTransfers()
    }
  },

  tripWithNoTransfers : function() {
    singleLine.line = this.startLine;
    singleLine.startStation = this.startStation;
    singleLine.finishStation = this.finishStation;
    console.log("The number of stops is " + singleLine.counter());
    console.log("The stations are " + singleLine.stations());
  },

  tripWithTransfers : function() {
    singleLine.line = this.startLine;
    singleLine.startStation = this.startStation;
    singleLine.finishStation = "Union Square";
    counter = singleLine.counter();
    stations1 = singleLine.stations();

    singleLine.line = this.finishLine;
    singleLine.startStation = "Union Square";
    singleLine.finishStation = this.finishStation;
    counter += singleLine.counter();
    stations2 = singleLine.stations();

    console.log("The number of stops is " + counter);
    console.log("The stop on " + this.startLine + " are " + stations1);
    console.log("Transfer at Union Square.");
    console.log("Then, the stop on " + this.finishLine + " are " + stations2);
  }
}

mta.journey()
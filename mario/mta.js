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
    noLineOrStopError = this.errorChecker()

    if (noLineOrStopError ) {
      return noLineOrStopError 
    }


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
    output = []
    output.push("The number of stops is " + singleLine.counter());
    output.push("The stations are " + singleLine.stations());
    return output.join('\n')
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

    output = []
    output.push("The number of stops is " + counter);
    output.push("The stop on " + this.startLine + " are " + stations1);
    output.push("Transfer at Union Square.");
    output.push("Then, the stop on " + this.finishLine + " are " + stations2);
    return output.join('\n')
  },

  errorChecker : function() {
    if (!(this.startLine in LINES)) {
      return "Please check your start line."
    } else if (!(this.finishLine in LINES)) {
      return "Please check your finish line."
    } else if (LINES[this.startLine].indexOf(this.startStation) === -1) {
      return "Please check your start station."
    } else if (LINES[this.finishLine].indexOf(this.startStation) === -1) {
      return "Please check your finish station."
    } else {
      return false
    }
  }
}

console.log(mta.journey());
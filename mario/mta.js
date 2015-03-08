// Third version of MTA, first version in Javascript

const LINES = {
    nLine : ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
    lLine : ["8th", "6th", "Union Square", "3rd", "1st"],
    sixLine : ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

singleLine = {
  line : "nLine",
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
  startLine : "nLine",
  startStation : "34th",
  finishLine : "sixLine",
  finishStation : "Astor Place",
  prettyPrint : {
                  nLine : "N-Line",
                  lLine : "L-Line",
                  sixLine : "6-Line"
                },

  journey : function () {
    noLineOrStopError = this.errorChecker()

    if (noLineOrStopError ) {
      return noLineOrStopError 
    } else if (this.startLine === this.finishLine) {
      return this.tripWithNoTransfers()
    } else if (this.startStation === "Union Square") {
      this.startLine = this.finishLine;
      return this.tripWithNoTransfers()
    } else if (this.finishStation === "Union Square"){
      return this.tripWithNoTransfers()
    } else {
      return this.tripWithTransfers()
    }
  },

  tripWithNoTransfers : function() {
    singleLine.line = this.startLine;
    singleLine.startStation = this.startStation;
    singleLine.finishStation = this.finishStation;
    if (singleLine.counter() === 0) {
      return "You're aleady there, stupid!"
    } else {
      line = this.prettyPrint[this.startLine];
      output = []
      output.push("The number of stops is " + singleLine.counter());
      output.push("On the " + line + ", the stations are " + singleLine.stations().join(", "));
      return output.join('\n')
    }
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
    startLine = this.prettyPrint[this.startLine];
    finishLine = this.prettyPrint[this.finishLine];

    output = []
    output.push("The number of stops is " + counter);
    output.push("The stops on " + startLine + " are " + stations1.join(", "));
    output.push("Transfer at Union Square.");
    output.push("Then, the stops on " + finishLine + " are " + stations2.join(", "));
    return output.join('\n')
  },

  errorChecker : function() {
    if (!(this.startLine in LINES)) {
      return "Please check your start line."
    } else if (!(this.finishLine in LINES)) {
      return "Please check your finish line."
    } else if (LINES[this.startLine].indexOf(this.startStation) === -1) {
      return "Please check your start station."
    } else if (LINES[this.finishLine].indexOf(this.finishStation) === -1) {
      return "Please check your finish station."
    } else {
      return false
    }
  }
}

mta.startLine = "nLine"
mta.startStation = "34th"
mta.finishLine = "sixLine"
mta.finishStation = "Astor Place"
console.log(mta.journey());
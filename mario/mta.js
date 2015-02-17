// Third version of MTA, first version in Javascript

const LINES = {
    n_line : ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
    l_line : ["8th", "6th", "Union Square", "3rd", "1st"],
    six_line : ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

singleLine = {
  line : "n_line",
  startStation : "28th",
  finishStation : "28th",

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

console.log("Start index is " + singleLine.startIndex());
console.log("Finish index is " + singleLine.finishIndex());
console.log("The number of stops is " + singleLine.counter());
console.log("The stations are " + singleLine.stations())
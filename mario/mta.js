// Third version of MTA, first version in Javascript

const LINES = {
    n_line : ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
    l_line : ["8th", "6th", "Union Square", "3rd", "1st"],
    six_line : ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

singleLine = {
  line : undefined,
  startStation : undefined,
  finishStation : undefined,

  startIndex : function() {
    return LINES[this.line].indexOf(this.startStation)
  },

  finishIndex : function() {
    return LINES[this.line].indexOf(this.finishStation)
  }

}

singleLine.line = "n_line"
singleLine.startStation = "Time Square"
singleLine.finishStation = "8th"

console.log("Start index is " + singleLine.startIndex())
console.log("Finish index is " + singleLine.finishIndex())
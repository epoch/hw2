var getOrdinal = function(n) {
   var s=["th","st","nd","rd"],
       v=n%100;
   return n+(s[(v-20)%10]||s[v]||s[0]);
}

var myFavoriteCountries = ['Italy', 'France', 'Brazil', 'Costa Rica', 'USA'];

for (var c = 0; c < 5; c++) {
  var rank = getOrdinal(c+1);
  console.log('My ' + rank + ' choice is ' + myFavoriteCountries[c] + '.');
}
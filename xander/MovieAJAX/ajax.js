var request = new XMLHttpRequest();
request.onreadystatechange = function () {
  console.log('readyState has changed');
  console.log(this.readyState);
  console.log(this.responseText);

  if (this.readyState === 4) {
    $('h3').text( this.responseText );
    console.log('Done');
  }
};

request.open('GET', '/slow');
request.send(); // Asynchronous request

console.log('AJAX request is probably still running');
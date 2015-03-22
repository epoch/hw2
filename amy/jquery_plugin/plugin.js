// https://learn.jquery.com/plugins/basic-plugin-creation/

// Basic plugin authoring:

// The $.fn object contains all of the jQuery 
// object methods, and if we want to write our own methods, 
// it will need to contain those as well.

// Let's say we want to create a plugin that makes text within 
// a set of retrieved elements green. All we have to do is add 
// a function called greenify to $.fn and it will be available 
// just like any other jQuery object method.

$(document).ready(function(){

  console.log('document is ready');

  $.fn.greenify = function(){
    this.css("color", "green");
  };
  $("a").greenify();

});

// In the above example, we use we use this, not $( this )
// because our greenify function is a part of the same object
// as .css()

// Chaining:

// Making our plugin method chainable takes one line of code:

$(document).ready(function(){

  console.log('document is ready');

  $.fn.greenify = function(){
    this.css("color", "green");
    return this;
  };
  $("a").greenify().addClass("greenified");

});

// Using the each method:

// If you want to do any manipulating with specific elements 
// (e.g. getting a data attribute, calculating specific positions)
// then you need to use .each() to loop through the elements.

$.fn.myNewPlugin = function() {
 
    return this.each(function() {
    // Do something to each element here.
    });
};

// Accepting options:

// it's a good idea to make your plugin customizable by accepting 
// options. 

(function ( $ ) {
 
    $.fn.greenify = function( options ) {
 
        // This is the easiest way to have default options.
        var settings = $.extend({
            // These are the defaults.
            color: "#556b2f",
            backgroundColor: "white"
        }, options );
 
        // Greenify the collection based on the settings variable.
        return this.css({
            color: settings.color,
            backgroundColor: settings.backgroundColor
        });
 
    };
 
}( jQuery ));

$( "div" ).greenify({
    color: "orange"
});

// In the above example, the default value for color of #556b2f 
// gets overridden by $.extend() to be orange.


// Putting it all together:

$(document).ready(function(){

  (function($){

    $.fn.showLinkLocation = function(){

      this.filter("a").each(function(){
        var link = $(this);
        link.append("("+link.attr("href")+")");

      });
      return this 

    };

  }(jQuery));

  // Usage example:
  $( "a" ).showLinkLocation();

});

// This plugin goes through all anchors in the collection
//  and appends the href attribute in parentheses.

// <!-- Before plugin is called: -->
// <a href="page.html">Foo</a>
 
// <!-- After plugin is called: -->
// <a href="page.html">Foo (page.html)</a>

// A better way of writing the above function:

(function( $ ) {
 
    $.fn.showLinkLocation = function() {
 
        this.filter( "a" ).append(function() {
            return " (" + this.href + ")";
        });
 
        return this;
 
    };
 
}( jQuery ));



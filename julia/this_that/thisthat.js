// This for That App
// Students will build a "this for that" application that pulls words from array and combines them into strings

// Objectives:
// create and use arrays
// create and use variables
// create and use functions

// Write a function called randomThis() that picks a random "This" element from the array
// Write a function called randomThat() that picks a random "That" element from the array
// Write a function that prints a statement saying: "So.... your startup is basically like a like a this for that?" It should print a new statement each time the function is called.

var _this = ["Skynet","Digital Music Distribution","FitBit","Realtime Data","ManPacks","Landing Page","Conversion Funnel","Social Network","Airbnb","SnapChat","Bang With Friends","HTML5 App","Google Analytics","Mapreduce Query","Node.js Server","KickStarter","Match.com","Adultfriendfinder","Pinterest","Amber Alert System","Groupon","Appstore","Digital Magazine","Distributed Social Network","Quadcopter","Daring Fireball","Content Distribution Network","Analytics Platform","OpenTable","LinkedIn","Brick and Mortar Solution","Aggregator","Social Game","jQuery Plugin","Game-based Incentive","Foursquare","YouTube","WeedMaps","Texts From Last Night","Ponzi Scheme","1-800-Flowers","Cash4Gold","Online Marketplace","Viral Marketer","Wearable Computer","Google Glass App","Facebook Marketplace","Zivity","Playboy","Cloud Storage Provider","Kindle Fire App","Pandora","Green Tech Program","Eco-Friendly Marketplace","Netflix","Amazon","Zappos","Reddit","Enron","Wordpress","iPhone App","Android App","Meme Generator","Crowdsourcing App","Mac App","SEO Optimizer","Apartment Guide","Social CRM","Database Abstraction Layer","Microblogging Service","Product Curation Service","API","New Social Platform","Tumblr","Deal Finder","CPA Ad Network","Collaborative Filter","Shopping Site","Digg 2.0","Recommendation Engine","News Recommender","Neural Network","Tesseract OCR engine","Unreadable CAPTCHA","Mobile Ecosystem","Flickr","Salesforce.com","Twitter Filter","Wikipedia","Yelp"];
 
var _that = ["Facebook Platform","Erlang Enthusiasts","Collegiate Jewish Women","Ex-Girlfriends","Binders Full of Women","Mitt Romney's Hair","Laundromats","Celebrity Gossip","Endangered Species","Pandas","Middle Schoolers","Alpha Phi Girls","Funeral Homes","Chinese Take-out","Ex-Convicts","Fast Casual Restaurants","Marketers","Qualifying Leads","Funeral Homes","Farmers","Cougars","Pilots","Gynecologists","Cracked iPhone Apps","Stolen Goods","Adult Dancers","People Who Hate Groupon","Hunters","High-End Pornography","Sysadmins","Bath Salts","Nootropics","California","Gay Marriages","Government Corruption","Political Attack Ads","Whiskey Lovers","Parking Tickets","Highway Accidents","Traveling","Airlines","Presentation Tools","Your Boss","Ponzi Schemes","Your Finances","Restroom Attendants","Your Aquarium","Your Cat's Litter Box","Pets","Alcoholics","Camp Counselors","Nature Blogs","World of Warcraft","Models","Family Guy Enthusiasts","The Army","Cheap Vodka","Tech Incubators","Star Trek Conventions","Presentation Tools","Small Businesses","Beer","Nightclub Lines","Semi-Active Volcanoes","Attractive People","Ugly People","Sanctimonial Artifacts","Traveling Abroad","Your Mom","Billionaires","Happy Hours","Ugg Boots","The Homeless","Blacking Out","Red Wine","Christian Families","Social Outcasts","Surgeons","Sorority Chicks","Pounding Jagger Bombs","Medicinal Marijuana","Textbooks","Coffee Shops","Baristas"];


var randomThis = function(x) {
  var randThis = x[Math.floor(Math.random()* x.length)];
  return randThis;
  // console.log(randThis);
}
// randomThis(_this);

var randomThat = function(x) {
  var randThat = x[Math.floor(Math.random()* x.length)];
  return randThat;
  // console.log(randThat);
}

// randomThat(_that);

var sayWhat = function() {
  console.log("So.... your startup is basically like a like a " + randomThis(_this) + " for " + randomThat(_that) + "?");
}

sayWhat();
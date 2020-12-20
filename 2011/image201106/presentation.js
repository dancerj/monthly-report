// some kind of presentation using HTML.

// Uses the 'hash' of URL as page number.
var startPresentation = function() {
    document.body.innerHTML += '<div id=music></div>';

    var displayDiv = document.getElementById('display');
    var musicDiv = document.getElementById('music');
    var presentationDiv = document.getElementById('presentation');
    var pages = presentationDiv.getElementsByTagName('div');
    var currentPage = 0;

    var turnPage = function(/* number */ page) {
	// TODO: if page > pages.length, die.
	if (pages[page] == undefined) {
	    return;
	}
	displayDiv.innerHTML = pages[page].innerHTML;
	var musicUrl = pages[page].getAttribute('music')
	if (!!musicUrl) {
	    musicDiv.innerHTML = '<audio src="' + musicUrl + '" autoplay=true>';
	}
	currentPage = page;
	document.location.hash = page;
    }

    var keypressHandler = function(/* event */ e) {
	var keyCode = e.which;
	switch(keyCode) {
	case 37: // left
	    turnPage(currentPage - 1);
	    break;
	case 39: // right
	    turnPage(currentPage + 1);
	    break;
	}
    }

    // initialization.

    // Hide the presentation source
    presentationDiv.setAttribute('style', 'display:none;');
    // you should zoom rather than setting it here.
    // displayDiv.setAttribute('style', 'font-size: 300%;');
    var page = 0;
    if (document.location.hash != undefined && 
	document.location.hash != "") {
	// get the '1' part from '#1'
	page = document.location.hash.substring(1)
    }
    turnPage(page);

    document.addEventListener("keydown", keypressHandler, true);
}
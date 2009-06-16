// ==UserScript==
// @name           DDTP two-panes
// @namespace      ddtptwo
// @description    Display DDTP in two-panes mode
// @include        http://ddtp.debian.net/ddtss/index.cgi/*/translate/*
// ==/UserScript==

(function() {
    // get the third UL, and name it floatie
    document.getElementsByTagName("ul")[2].setAttribute("id", "floatie");
    var style =
	<><![CDATA[
		   ul#floatie > li {
		       float: left;
		       width: 50%;
		   }
		   ul#floatie * pre {
		       font-size: 70%;
		   }
		   ul#floatie * textarea {
		       font-size: 70%;
		   }
		   ]]></>
    GM_addStyle(style);
})()


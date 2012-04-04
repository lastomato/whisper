var paper1 = Raphael("prev", 100, 100);
var paper2 = Raphael("next", 100, 100);

var paper3 = Raphael("info", 50, 50);
var paper4 = Raphael("help", 50, 50);
var paper5 = Raphael("search", 50, 50);

var paper6 = Raphael("gotop", 50, 50);
var paper7 = Raphael("goback", 50, 50);

var prev = paper1.path("M21.871,9.814 15.684,16.001 21.871,22.188 18.335,25.725 8.612,16.001 18.335,6.276z").attr({fill: "#cccccc", stroke: "none"}).transform("s3,3,0,0");
var next = paper2.path("M10.129,22.186 16.316,15.999 10.129,9.812 13.665,6.276 23.389,15.999 13.665,25.725z").attr({fill: "#cccccc", stroke: "none"}).transform("s3,3,0,0");

var info = paper3.path("M16,1.466C7.973,1.466,1.466,7.973,1.466,16c0,8.027,6.507,14.534,14.534,14.534c8.027,0,14.534-6.507,14.534-14.534C30.534,7.973,24.027,1.466,16,1.466z M14.757,8h2.42v2.574h-2.42V8z M18.762,23.622H16.1c-1.034,0-1.475-0.44-1.475-1.496v-6.865c0-0.33-0.176-0.484-0.484-0.484h-0.88V12.4h2.662c1.035,0,1.474,0.462,1.474,1.496v6.887c0,0.309,0.176,0.484,0.484,0.484h0.88V23.622z").attr({fill: "#cccccc", stroke: "none"}).transform("s1.5,1.5,0,0");
var help = paper4.path("M16,1.466C7.973,1.466,1.466,7.973,1.466,16c0,8.027,6.507,14.534,14.534,14.534c8.027,0,14.534-6.507,14.534-14.534C30.534,7.973,24.027,1.466,16,1.466z M17.328,24.371h-2.707v-2.596h2.707V24.371zM17.328,19.003v0.858h-2.707v-1.057c0-3.19,3.63-3.696,3.63-5.963c0-1.034-0.924-1.826-2.134-1.826c-1.254,0-2.354,0.924-2.354,0.924l-1.541-1.915c0,0,1.519-1.584,4.137-1.584c2.487,0,4.796,1.54,4.796,4.136C21.156,16.208,17.328,16.627,17.328,19.003z").attr({fill: "#cccccc", stroke: "none"}).transform("s1.5,1.5,0,0");
var search = paper5.path("M29.772,26.433l-7.126-7.126c0.96-1.583,1.523-3.435,1.524-5.421C24.169,8.093,19.478,3.401,13.688,3.399C7.897,3.401,3.204,8.093,3.204,13.885c0,5.789,4.693,10.481,10.484,10.481c1.987,0,3.839-0.563,5.422-1.523l7.128,7.127L29.772,26.433zM7.203,13.885c0.006-3.582,2.903-6.478,6.484-6.486c3.579,0.008,6.478,2.904,6.484,6.486c-0.007,3.58-2.905,6.476-6.484,6.484C10.106,20.361,7.209,17.465,7.203,13.885z").attr({fill: "#cccccc", stroke: "none"}).transform("s1.5,1.5,0,0");

var gotop = paper6.path("M25.682,24.316L15.5,6.684L5.318,24.316H25.682z").attr({fill: "#cccccc", stroke: "none"}).transform("s1.5,1.5,0,0");
var goback = paper7.path("M12.981,9.073V6.817l-12.106,6.99l12.106,6.99v-2.422c3.285-0.002,9.052,0.28,9.052,2.269c0,2.78-6.023,4.263-6.023,4.263v2.132c0,0,13.53,0.463,13.53-9.823C29.54,9.134,17.952,8.831,12.981,9.073z").attr({fill: "#cccccc", stroke: "none"}).transform("s1.5,1.5,0,0");

var list = ["prev", "next", "info", "help", "search", "gotop", "goback"];
list.forEach(function(element, index, array){
  if(index == 0 || index == 1 || index == 4){
    window[element].attr({title: list[index]});
  }

  if(index == 5){
    window[element].attr({title: "Scroll top"});
  }

  if(index == 6){
    window[element].attr({title: "Go back"});
  }

  $("div#" + element).hover(function(){
    window[element].attr({fill: "#000000"});
  }, function(){
    window[element].attr({fill: "#cccccc"});
  });

//  window[element].click(function(){
//    location.href = target[index];
//  })
});

var list2 = ["info", "help"];
list2.forEach(function(element, index, array){
  var xFix = 10;
  //var yFix = 20;

  window[element].hover(function(e){
    $("div#" + element + "-popup").show()
      .css('top', e.pageY - window.scrollY)
      .css('left', e.pageX - window.scrollX + xFix);
  }, function(){
    $("div#" + element + "-popup").hide();
    })
});

$("div#search").click(function(e){
  if($("div#search-popup").css('display') == "block"){
    $("div#search-popup").css('display', 'none');
  } else {
    $("div#search-popup").show()
    .css('top', e.pageY - scrollY)
    .css('left', e.pageX - scrollX + 10);
  }
});

//go top and go back
$("div#gotop").hide();

$(function () {
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			$("div#gotop").fadeIn();
		} else {
			$("div#gotop").fadeOut();
		}
	});

	// scroll body to 0px on click
	window["gotop"].click(function () {
		$("body,html").animate({
			scrollTop: 0
		}, 500);
		return false;
	});
});
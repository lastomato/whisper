var fromNow = function(date) {
  var now = new Date();
  var oneYear = 365 * 24 * 60 * 60;
  var oneMonth = 30 * 24 * 60 * 60;
  var oneDay = 24 * 60 * 60;
  var oneHour = 60 * 60;
  var oneMinute = 60;

  if(now <= date){
    return 0;
  } else {
    var interval = now.getTime() - date.getTime();
    interval = Math.ceil(interval / 1000);

    var year = Math.floor(interval / oneYear);
    var month = Math.floor((interval - year * oneYear) / oneMonth);
    var day = Math.floor((interval - year * oneYear - month * oneMonth) / oneDay);
    var hour = Math.floor((interval - year * oneYear - month * oneMonth - day * oneDay) / oneHour);
    var minute = Math.floor((interval - year * oneYear - month * oneMonth - day * oneDay - hour * oneHour) / oneMinute);
    var second = interval - year * oneYear - month * oneMonth - day * oneDay - hour * oneHour - minute * oneMinute;

    $("div#year").text(year < 10 ? "0" + year : year);
    $("div#month").text(month < 10 ? "0" + month : month);
    $("div#day").text(day < 10 ? "0" + day : day);
    $("div#hour").text(hour < 10 ? "0" + hour : hour);
    $("div#minute").text(minute < 10 ? "0" + minute : minute);
    $("div#second").text(second < 10 ? "0" + second : second);
  }
}

var increment = function() {
  var year   = $("div#year").html();
  var month  = $("div#month").html();
  var day    = $("div#day").html();
  var hour   = $("div#hour").html();
  var minute = $("div#minute").html();
  var second = $("div#second").html();

  if(second == "59"){
    $("div#second").text("00");

    if(minute == "59"){
      $("div#minute").text("00");

      if(hour == "23"){
        $("div#hour").text("00");

        if(day == "29"){
          $("div#day").text("00");

          if(month == "11"){
            $("div#month").text("00");

            year = parseInt(year, 10) + 1;
            $("div#year").text(year < 10 ? "0" + year : year);
          } else {
            month = parseInt(month, 10) + 1;
            $("div#month").text(month < 10 ? "0" + month : month);
          }
        } else {
          day = parseInt(day, 10) + 1;
          $("div#day").text(day < 10 ? "0" + day : day);
        }
      } else {
        hour = parseInt(hour, 10) + 1;
        $("div#hour").text(hour < 10 ? "0" + hour : hour);
      }
    } else {
      minute = parseInt(minute, 10) + 1;
      $("div#minute").text(minute < 10 ? "0" + minute : minute);
    }
  } else {
    second = parseInt(second, 10) + 1;
    $("div#second").text(second < 10 ? "0" + second : second);
  }
}

var randomMaker = function(range) {
	return Math.floor(range * Math.random());
}

var heartSnow = function(heartMax, sinkSpeed){
  var heartColor = new Array("#aaaacc","#ddddFF","#ccccDD");

  //initialize
  var actualMax = randomMaker(heartMax);

  for(var i = 0; i < actualMax; i++){

  }
}

var entrance = function(date){
  fromNow(date);
  //heartSnow(10, 0.6);

  setInterval(increment, 1000);
}

var d = new Date(2006, 10, 01, 08, 15, 00);
entrance(d);


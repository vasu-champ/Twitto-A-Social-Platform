
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<title>CodePen - Music Player</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700'>
<style>
*, *:before, *:after {
box-sizing: border-box;
}

html {
min-height: 100%;
}

body {
background: #eee url("https://buffer.com/library/wp-content/uploads/2017/09/13-Places-to-Find-Background-Music-for-Video-Cover-Image-2-1024x685.jpg") no-repeat center;
background-size: cover;
font-family: "Open Sans", sans-serif;
}

.music-player {
position: relative;
width: 350px;
height: 290px;
margin: 150px auto;
box-shadow: 0 0 60px rgba(0, 0, 0, 0.8);
border-radius: 10px;
background: #222;
overflow: hidden;
z-index: 0;
}
.music-player img {
position: absolute;
top: 0px;
left: 0px;
bottom: 0px;
right: 0px;
z-index: -1;
display: block;
width: 100% !important;
height: 100% !important;
-webkit-filter: blur(2px);
filter: blur(2px);
}
.music-player .info {
width: 100%;
height: 100px;
background: #222;
background: rgba(0, 0, 0, 0.8);
text-align: center;
position: relative;
}
.music-player .info .jp-playlist li {
display: none;
}
.music-player .info .jp-playlist li a {
font-size: 30px;
font-weight: 300;
text-decoration: none;
color: #fff;
color: rgba(225, 225, 225, 0.4);
}
.music-player .info .jp-playlist li a span {
font-size: 14px;
display: block;
margin-top: 10px;
}
.music-player .info .jp-playlist li.jp-playlist-current {
display: block;
}
.music-player .info .jp-playlist li .jp-free-media, .music-player .info .jp-playlist li .jp-playlist-item-remove {
display: none;
}
.music-player .info .left, .music-player .info .right {
width: 25px;
position: absolute;
top: 30px;
left: 30px;
}
.music-player .info .right {
left: auto;
right: 30px;
}
.music-player .info [class^="icon-"] {
margin: 0 0 10px;
}
.music-player .info .center {
padding: 20px 0 0;
}
.music-player .progress, .music-player .volume-level {
width: 100%;
height: 5px;
display: block;
background: #000;
position: absolute;
bottom: 0px;
cursor: pointer;
border: none;
}
.music-player .progress .ui-slider-range, .music-player .volume-level .ui-slider-range {
display: block;
background: #ed553b;
height: 5px;
border-radius: 0;
}
.music-player .progress .ui-slider-handle, .music-player .volume-level .ui-slider-handle {
position: absolute;
top: -8px;
width: 8px;
height: 22px;
background: url("//i.imgur.com/tsqwz1N.png") no-repeat center;
border: none;
outline: none;
margin: 0 0 0 -3px;
cursor: move;
}
.music-player .controls {
text-align: center;
width: 100%;
height: 190px;
background: #982e4b;
background: rgba(152, 46, 75, 0.6);
}
.music-player .controls .current {
font-size: 48px;
color: #fff;
color: rgba(225, 225, 225, 0.4);
padding: 15px 0 20px;
}
.music-player .controls .play-controls a {
display: inline-block;
width: 35px;
height: 40px;
margin: 0 30px;
}
.music-player .controls .volume-level {
position: relative;
bottom: auto;
width: 200px;
height: 2px;
margin: 30px auto 0;
background: rgba(225, 225, 225, 0.3);
}
.music-player .controls .volume-level .ui-slider-range {
height: 2px;
}
.music-player .controls .volume-level .ui-slider-handle {
top: -8px;
margin-left: -9px;
width: 22px;
height: 22px;
background-image: url("//i.imgur.com/V5i67V2.png");
}
.music-player .controls .volume-level .icon-volume-up, .music-player .controls .volume-level .icon-volume-down {
position: absolute;
right: -34px;
top: -8px;
width: 22px;
}
.music-player .controls .volume-level .icon-volume-down {
right: auto;
left: -27px;
}

[class^="icon-"] {
width: 18px;
height: 18px;
background: url("//i.imgur.com/E09T8tf.png") no-repeat center;
display: block;
}

.icon-shuffle {
background-image: url("//i.imgur.com/AQAxRxS.png");
}
.icon-heart {
background-image: url("//i.imgur.com/E09T8tf.png");
}
.icon-repeat {
background-image: url("//i.imgur.com/338F8MX.png");
}
.icon-share {
background-image: url("//i.imgur.com/PGIC6ME.png");
}
.icon-previous {
background-image: url("//i.imgur.com/LIqj0nr.png");
}
.icon-play {
background-image: url("//i.imgur.com/xlBv5aR.png");
}
.icon-pause {
background-image: url("//i.imgur.com/lIhwduj.png");
}
.icon-next {
background-image: url("//i.imgur.com/Mb6Nzj5.png");
}
.icon-volume-up {
background-image: url("//i.imgur.com/qqdoddi.png");
}
.icon-volume-down {
background-image: url("//i.imgur.com/3iirf2f.png");
}

.copyrights {
text-align: center;
text-transform: capitalize;
margin: 50px;
color: rgba(0, 0, 0, 0.6);
}
.copyrights a {
color: rgba(152, 46, 75, 0.9);
text-decoration: none;
}
</style>
<script>
window.console = window.console || function(t) {};
</script>
<script>
if (document.location.search.match(/type=embed/gi)) {
window.parent.postMessage("resize", "*");
}
</script>
</head>
<body translate="no">
<div class="music-player">

<div class="info">
<div class="left">
<a href="javascript:;" class="icon-shuffle"></a>
<a href="javascript:;" class="icon-heart"></a>
</div>
<div class="center">
<div class="jp-playlist">
<ul>
<li></li>
</ul>
</div>
</div>
<div class="right">
<a href="javascript:;" class="icon-repeat"></a>
<a href="javascript:;" class="icon-share"></a>
</div>
<div class="progress"></div>
</div>
<div class="controls">
<div class="current jp-current-time">00:00</div>
<div class="play-controls">
<a href="javascript:;" class="icon-previous jp-previous" title="previous"></a>
<a href="javascript:;" class="icon-play jp-play" title="play"></a>
<a href="javascript:;" class="icon-pause jp-pause" title="pause"></a>
<a href="javascript:;" class="icon-next jp-next" title="next"></a>
</div>
<div class="volume-level">
<a href="javascript:;" class="icon-volume-up" title="max volume"></a>
<a href="javascript:;" class="icon-volume-down" title="mute"></a>
</div>
</div>
<div id="jquery_jplayer" class="jp-jplayer"></div>
</div>
<p class="copyrights"><b>
Designed by Shreyansh jain and we love Director- @Rishabh jain/codingculb.tech</b></a>
</p>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jplayer/2.6.4/jquery.jplayer/jquery.jplayer.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jplayer/2.6.4/add-on/jplayer.playlist.min.js'></script>
<script id="rendered-js">
$(document).ready(function () {


var playlist = [{
title: "Hidden",
artist: "Miaow",
mp3: "https://files1.mp3slash.xyz/stream/0633b9f472d65335e3e8cd6d54897f84",
oga: "https://files1.mp3slash.xyz/stream/0633b9f472d65335e3e8cd6d54897f84",
poster: "https://i.imgur.com/sCbrzQa.png" },
{
title: "Cro Magnon Man",
artist: "The Stark Palace",
mp3: "https://files1.mp3slash.xyz/stream/0633b9f472d65335e3e8cd6d54897f84",
oga: "https://files1.mp3slash.xyz/stream/0633b9f472d65335e3e8cd6d54897f84",
poster: "https://i.imgur.com/lXvsuBu.png" },
{
title: "Bubble",
m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg",
poster: "https://i.imgur.com/klJKSVZ.jpg" }];


var cssSelector = {
jPlayer: "#jquery_jplayer",
cssSelectorAncestor: ".music-player" };


var options = {
swfPath: "https://cdnjs.cloudflare.com/ajax/libs/jplayer/2.6.4/jquery.jplayer/Jplayer.swf",
supplied: "ogv, m4v, oga, mp3",
volumechange: function (event) {
$(".volume-level").slider("value", event.jPlayer.options.volume);
},
timeupdate: function (event) {
$(".progress").slider("value", event.jPlayer.status.currentPercentAbsolute);
} };


var myPlaylist = new jPlayerPlaylist(cssSelector, playlist, options);
var PlayerData = $(cssSelector.jPlayer).data("jPlayer");


// Create the volume slider control
$(".volume-level").slider({
animate: "fast",
max: 1,
range: "min",
step: 0.01,
value: $.jPlayer.prototype.options.volume,
slide: function (event, ui) {
$(cssSelector.jPlayer).jPlayer("option", "muted", false);
$(cssSelector.jPlayer).jPlayer("option", "volume", ui.value);
} });


// Create the progress slider control
$(".progress").slider({
animate: "fast",
max: 100,
range: "min",
step: 0.1,
value: 0,
slide: function (event, ui) {
var sp = PlayerData.status.seekPercent;
if (sp > 0) {
// Move the play-head to the value and factor in the seek percent.
$(cssSelector.jPlayer).jPlayer("playHead", ui.value * (100 / sp));
} else {
// Create a timeout to reset this slider to zero.
setTimeout(function () {
$(".progress").slider("value", 0);
}, 0);
}
} });



});
//# sourceURL=pen.js
</script>
</body>
</html>

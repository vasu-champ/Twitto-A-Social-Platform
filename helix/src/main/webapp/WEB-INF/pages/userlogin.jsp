<html>
<body>
USER IS TRYING TO LOGING AT
<br>
<br>
<div id="time">
<br>
<br>
</div>
<div>
<marquee> Made with  love Shreyansh Jain </marquee>
</div>
<script type="text/javascript">
function updateTime(){
document.getElementById("time").innerText=new Date().toString();
}
//every 1000ms
setInterval(updateTime,1000);

</script>

</body>
</html>
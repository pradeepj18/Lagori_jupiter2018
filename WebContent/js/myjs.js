function startTime() {
		var today = new Date();
		var h = today.getHours();

		var m = today.getMinutes();
		var s = today.getSeconds();
		var date = today.toDateString();
		var ampm = h >= 12 ? 'PM' : 'AM';
		if (h > 12)
			h = h - 12;
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('txt').innerHTML = date + " " + h + ":" + m
				+ ":" + s + " " + ampm;
		var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		; // add zero in front of numbers < 10
		return i;
	}
console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
	type: 'GET',
	url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
	success(data) {
		console.log("We have your weather!");
		console.log(data.weather[0].description);
		console.log(data);
	},
	error() {
		console.log("Something went horribly wrong...");
	},
});
// Add another console log here, outside your AJAX request
console.log("After the AJAX request! (But not really because it's async)");

/*
** When does request get sent? -> Right after console.log
** When does response come back? -> After the final console.log, async!
** What's current weather in NY? -> overcast clouds
** Did the page refresh? -> No
** How to use diff HTTP methods? -> Change type
*/

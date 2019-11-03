document.addEventListener("DOMContentLoaded", function(){
	let canvas = document.getElementById('mycanvas');
	canvas.height = 500;
	canvas.width = 500;
	let ctx = canvas.getContext('2d');
	ctx.fillStyle = 'red';
	ctx.fillRect(150, 300, 400, 300);

	ctx.beginPath();
	ctx.arc(50, 50, 50, 0, 360);
	ctx.strokeStyle = 'blue';
	ctx.lineWidth = 5;
	ctx.stroke();
	ctx.fillStyle = 'green';
	ctx.fill();

	ctx.beginPath();
	ctx.strokeStyle = 'orange';
	ctx.moveTo(250, 200);
	ctx.lineTo(300, 250);
	ctx.lineTo(300, 150);
	ctx.fill();
});

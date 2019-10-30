function mysteryScoping1() {
	var x = 'out of block';
	if (true) {
		var x = 'in block';
		console.log(x);
	}
	console.log(x);
}

mysteryScoping1() // results in two 'in block' statements

function mysteryScoping2() {
	const x = 'out of block';
	if (true) {
		const x = 'in block';
		console.log(x);
	}
	console.log(x);
}

mysteryScoping2() // results in 'in block' then 'out of block'

/*
function mysteryScoping3() {
	const x = 'out of block';
	if (true) {
		var x = 'in block';
		console.log(x);
	}
	console.log(x);
}

mysteryScoping3() // Results in error as x has already been declared
*/

function mysteryScoping4() {
	let x = 'out of block';
	if (true) {
		let x = 'in block';
		console.log(x);
	}
	console.log(x);
}

mysteryScoping4() // Results in 'in block' then 'out of block'

/*
function mysteryScoping5() {
	let x = 'out of block';
	if (true) {
		let x = 'in block';
		console.log(x);
	}
	let x = 'out of block again';
	console.log(x);
}

mysteryScoping5() // Results in error, x already declared at line 55
*/

// Deciding to use function expression rather than function declaration syntax
const madLib = (verb, adjective, noun) => {
	return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
};
console.log(madLib('make', 'best', 'guac'));


const isSubstring = (searchString, subString) => {
	if (searchString.length < 1 || subString.length < 1 || (searchString.length <
		subString.length)) {
			return false;
		}
	let end_idx = searchString.length - (subString.length - 1);
	for (i = 0; i < end_idx; i++) {
		if (searchString.substring(i, i + subString.length) === subString) {
			return true;
		}
	}
	return false;
}

console.log(isSubstring("time to program", "time"))
console.log(isSubstring("Jump for joy", "joys"))

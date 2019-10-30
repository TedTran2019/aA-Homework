// Phase 1: Callbacks

const titleize = (names, fnc) => {
	fnc(names.map(name => `Mx. ${name} Jingleheimer Schmidt`));
};

const printCallback = names => {
	names.forEach(name => console.log(name));
};

titleize(["Mary", "Brian", "Leo"], printCallback);

// Phase 2: Constructors, Prototypes, and this

const Elephant = function(name, height, tricks) {
	this.name = name,
	this.height = height,
	this.tricks = tricks
};

Elephant.prototype.trumpet = function() {
	console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function() {
	this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
	this.tricks.push(trick)
};

Elephant.prototype.play = function() {
	let i = Math.floor(Math.random() * this.tricks.length);
	console.log(this.tricks[i]);
};

let Todd = new Elephant('Todd', 60, ['painting a picture', 'flying']);
console.log(Todd);
Todd.trumpet();
Todd.grow()
console.log(Todd);
Todd.addTrick('raging against the man');
console.log(Todd);
Todd.play()

// Phase 3: Function Invocation
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
	console.log(`${elephant.name} is trotting by!`);
}
herd.forEach(Elephant.paradeHelper);

// Phase 4: Closures
function dinerBreakfast() {
	let order = ['cheesy scrambled eggs'];
	console.log(`"I'd like ${order.join(' and ')} please."`);
	const addOrder = item => {
		order.push(item);
		console.log(`"I'd like ${order.join(' and ')} please."`);
	};
	return addOrder;
}

let bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please"
bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."


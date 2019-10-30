const fizzBuzz = (array) => {
	return array.filter(el => el % 3 === 0 ^ el % 5 === 0);
};

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
console.log(fizzBuzz(array));

const isPrime = num => {
	for (i = 2; i < num; i++) {
		if (num % i === 0) {
			return false;
		}
	}
	return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

const sumOfNPrimes = n => {
	let num = 2;
	let sum = 0;
	while (n > 0) {
		if (isPrime(num)) {
			sum += num;
			n--;
		}
		num += 1;
	}
	return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));

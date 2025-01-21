const readline = require('readline');
const { of, from } = require('rxjs');
const { map, filter, reduce, catchError, debounceTime } = require('rxjs/operators');

// Readline interface létrehozása
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Kérlek, adj meg néhány számot (vesszővel elválasztva): ', (input) => {
  // Bemenet feldolgozása
  const numbers = input.split(',').map(Number);

  from(numbers).pipe(
    filter(x => x % 2 === 0), // Csak a páros számokat tartja meg
    debounceTime(300), // Késlelteti a bemenet feldolgozását (pl. 300ms)
    map(x => x * 10), // Minden számot megszoroz 10-zel
    reduce((acc, x) => acc + x, 0), // Összegzi a számokat
    catchError(err => {
      console.error('Hiba történt: ', err);
      return of(0); // Hibakezelés
    })
  ).subscribe({
    next: val => console.log('Eredmény: ', val),
    complete: () => rl.close()
  });
});

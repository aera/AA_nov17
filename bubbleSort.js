const {log} = console;
function bubbleSort (arr) {
  let hasSwapped = true;
  const max = arr.length

  while (hasSwapped) {
    hasSwapped = false

    for (let i = 1; i < max; i += 1) {
      if (arr[i - 1] > arr[i]) {
        let tmp = arr[i];
        arr[i] = arr[i - 1]
        arr[i - 1] = tmp;

        hasSwapped = true
      }
    }
  }
}

function bubbleSortImp (arr) {
  let hasSwapped = true;
  const max = arr.length

  for (let j = max; j > 1 && hasSwapped; j -= 1) {
  // while (hasSwapped) {
    hasSwapped = false

    for (let i = 1; i < j; i += 1) {
      if (arr[i - 1] > arr[i]) {
        let tmp = arr[i];
        arr[i] = arr[i - 1]
        arr[i - 1] = tmp;

        hasSwapped = true
      }
    }
  }
}

function bubbleSortImp2 (arr) {
  let hasSwapped = true;
  const max = arr.length

  for (let j = max; j > 1 && hasSwapped; j -= 1) {
  // while (hasSwapped) {
    hasSwapped = false

    for (let i = 1; i < j; i += 1) {
      if (arr[i - 1] > arr[i]) {
        let tmp = arr[i];
        arr[i] = arr[i - 1]
        arr[i - 1] = tmp;

        hasSwapped = true;
      }
    }
    let j = i + 1;
  }
}


let unsortedArr = [4,7,8,5,2,1,10,9]
log('unsorted arr:', unsortedArr);
bubbleSort(unsortedArr);
log('sorted arr:', unsortedArr);


log('Benchmarks!')
// Use Array.from to generate arrays from different
// kinds values including strings, objects and other
// arrays.
// With object containing a property length, you
// can use to create an array of a chosen size as
// shown below:
let bigRandomArr = Array
  .from({length: 10000})
  .map(() => Math.random() * 10000);

// Also, use it to clone arrays.
let bigRandomArr1 = Array.from(bigRandomArr);
let bigRandomArr2 = Array.from(bigRandomArr);
let bigRandomArr3 = Array.from(bigRandomArr);

console.time('bubbleSort');
bubbleSort(bigRandomArr1);
console.timeEnd('bubbleSort');

console.time('bubbleSortImp');
bubbleSortImp(bigRandomArr2);
console.timeEnd('bubbleSortImp');

console.time('bubbleSortImp2');
bubbleSortImp(bigRandomArr3);
console.timeEnd('bubbleSortImp2');

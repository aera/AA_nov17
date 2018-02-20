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


function insertionSort (arr) {
  let held;
  const max = arr.length;
  for (let i = 1; i < max; i += 1) {
    held = arr[i];

    let j;
    for (j = i - 1; held < arr[j] && j >= 0; j -= 1) {
      arr[j + 1] = arr[j]
    }

    arr[j + 1] = held
  }
}



//merge
function mergeSortedArr(arr1, arr2) {
  const newArr = [];
  let i = 0;
  let j = 0;

  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      newArr.push(arr1[i]);
      i += 1;
    } else {
      newArr.push(arr2[j]);
      j += 1;
    }
  }

  return newArr
    .concat(arr1.slice(i))
    .concat(arr2.slice(j));
}

function mergeSort (arr) {
  if (arr.length <= 1) return arr;

  let middleIndex = Math.floor(arr.length / 2);
  let leftArr = arr.slice(0, middleIndex);
  let rightArr = arr.slice(middleIndex);

  return mergeSortedArr(
    mergeSort(leftArr),
    mergeSort(rightArr)
  );
}




//BM!!!!
log('Benchmarks!')
// Use Array.from to generate arrays from different
// kinds values including strings, objects and other
// arrays.
// With object containing a property length, you
// can use to create an array of a chosen size as
// shown below:
let bigRandomArr = Array
  .from({length: 1000})
  .map(() => Math.random() * 1000);

// Also, use it to clone arrays.
let bigRandomArr1 = Array.from(bigRandomArr);
let bigRandomArr2 = Array.from(bigRandomArr);
let bigRandomArr3 = Array.from(bigRandomArr);
let bigRandomArr4 = Array.from(bigRandomArr);
let bigRandomArr5 = Array.from(bigRandomArr);

console.time('bubbleSort');
bubbleSort(bigRandomArr1);
console.timeEnd('bubbleSort');

console.time('bubbleSortImp');
bubbleSortImp(bigRandomArr2);
console.timeEnd('bubbleSortImp');

console.time('bubbleSortImp2');
bubbleSortImp(bigRandomArr3);
console.timeEnd('bubbleSortImp2');

console.time('insertionSort');
insertionSort(bigRandomArr4);
console.timeEnd('insertionSort');

console.time('mergeSort');
mergeSort(bigRandomArr5);
console.timeEnd('mergeSort');

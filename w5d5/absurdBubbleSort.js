readline = require('readline')

reader = readline.createInterface({
  input:  process.stdin,
  output: process.stdout
});


function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}


function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i == (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }
  askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
    if (isGreaterThan) {
      var temp = arr[i];
      arr[i] = arr[i+1];
      arr[i+1] = temp;

      madeAnySwaps = true;
    }

    innerBubbleSortLoop(
      arr, i + 1, madeAnySwaps, outerBubbleSortLoop
    );
  });
}



function askIfGreaterThan(val1, val2, callback) {
  reader.question(
    "Is " + val1 + " > " + val2,
    function (answer) {
      console.log(answer)
      if (answer == "yes"){
        callback(true);
      } else {
        callback(false);
      }
    }
  );
}


absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

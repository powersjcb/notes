var readline = require('readline');

reader = readline.createInterface({
  input:  process.stdin,
  output: process.stdout
});

function addNumbers (sum, numsLeft, completionCallback) {
  if (numsLeft) {
    reader.question("What number should I add?", function (answer) {
      sum += parseInt(answer);
      console.log("Partial Sum: " + sum);
      addNumbers(sum, numsLeft - 1, completionCallback);
    })
  } else {
    completionCallback(sum);
    reader.close();
  }
};


addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
})

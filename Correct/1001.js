const rl = require("readline");
const itfc = rl.createInterface({ input: process.stdin, output: process.stdout });
itfc.on('line', (line) => {
  const nums = line.split(' ');
  console.log(Number.parseInt(nums[0]) - Number.parseInt(nums[1]));
});

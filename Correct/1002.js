const rl = require("readline");
const itfc = rl.createInterface({ input: process.stdin, output: process.stdout });

let isFirst = true;

itfc.on('line', (line) => {
  if (isFirst) {
    isFirst = false;
  } else {
    const [x1, y1, sr1, x2, y2, sr2] = line.split(' ');

    if (x1 === x2 && y1 === y2) {
      if (sr1 === sr2) console.log('-1');
      else console.log('0');
    } else {
      const d = Math.sqrt((Number.parseInt(x1) - Number.parseInt(x2)) ** 2 + (Number.parseInt(y1) - Number.parseInt(y2)) ** 2);
      const r1 = Number.parseInt(sr1);
      const r2 = Number.parseInt(sr2);
      const rp = r1 + r2;
      const rm = Math.abs(r1 - r2);

      if (rp >= d) {
        if (d < r1 || d < r2) {
          if (rm > d) console.log('0');
          else if (rm < d) console.log('2');
          else console.log('1');
        } else {
          if (d > rp) console.log('0');
          else if (d < rp) console.log('2');
          else console.log('1');
        }
      } else {
        console.log('0');
      }
    }
  }
});

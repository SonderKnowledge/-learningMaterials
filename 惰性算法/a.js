function main(max) {
  let maxSp = max.toString().split('');
  let maxSpFirst = maxSp[0];
  let maxSpCalacuLen = Math.max(0, maxSp.length - 1);
  let maxSpCalacuLen_1 = Math.max(0, maxSpCalacuLen-1);

  let maxCountOnes = maxSpFirst * Math.pow(10, maxSpCalacuLen_1) * maxSpCalacuLen + Math.pow(10, maxSpCalacuLen);

  console.log(`${maxSp},  ${maxSpFirst},  ${maxSpCalacuLen},  ${maxSpCalacuLen_1}:`,maxCountOnes);
}

main(400000000);
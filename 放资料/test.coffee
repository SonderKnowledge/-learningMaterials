config = ({
  type = 'application/json'
  Id = 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
  key = 'rRvdD9oizDgldNbbIpgFPd1X'
}) =>
  do =>
    base = 
      'Content-Type': type
      'X-LC-Id': Id
      'X-LC-Key': key
    {
      base
    }
    
console.log config({
  type: 'hh'
  Id: 'kk'
  key: 'll'
})

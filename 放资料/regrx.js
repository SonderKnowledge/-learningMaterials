var reg=/[a-z,A-Z]/g;//匹配任意字母
var str="wqeq11";
var t=str.match(reg);
for(var c in t){
console.log(t[c]);
}
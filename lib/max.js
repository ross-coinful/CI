// max.js
// 取得陣列中的最大值
module.exports = function max(array) {
  let maximum = array[0];
  for (let i = 0; i < array.length; i++) {
    maximum = array[i] > maximum ? array[i] : maximum;
  }
  return maximum;
}
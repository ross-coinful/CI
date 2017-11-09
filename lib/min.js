// min.js
// 取得陣列中的最小值
module.exports = function min(array) {
  let minimum = array[0];
  for (let i = 0; i < array.length; i++) {
    minimum = array[i] < minimum ? array[i] : minimum;
  }
  return minimum;
};
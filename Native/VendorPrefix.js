
Elm.Native.VendorPrefix = Elm.Native.VendorPrefix || {};
Elm.Native.VendorPrefix.make = function(elm) {

  elm.Native = elm.Native || {};
  elm.Native.VendorPrefix = elm.Native.VendorPrefix || {};
  if (elm.Native.VendorPrefix.values) return elm.Native.VendorPrefix.values;

  // thanks - https://github.com/daniel-lundin/snabbt.js/blob/master/snabbt.js
  var styles = window.getComputedStyle(document.documentElement, '');
  var vendorPrefix = (Array.prototype.slice
    .call(styles)
    .join('')
    .match(/-(moz|webkit|ms)-/) || (styles.OLink === '' && ['', 'o'])
  )[1];

  return {
    prefix: vendorPrefix
  }
}

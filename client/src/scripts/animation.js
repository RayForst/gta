// function elementInViewport2(el) {
//   var top = el.offsetTop;
//   var left = el.offsetLeft;
//   var width = el.offsetWidth;
//   var height = el.offsetHeight;

//   while (el.offsetParent) {
//     el = el.offsetParent;
//     top += el.offsetTop;
//     left += el.offsetLeft;
//   }

//   return (
//     top < window.pageYOffset + window.innerHeight &&
//     left < window.pageXOffset + window.innerWidth &&
//     top + height > window.pageYOffset &&
//     left + width > window.pageXOffset
//   );
// }

// function animate(selector) {
//   let el = document.querySelector(selector);

//   if (!!el && elementInViewport2(el)) {
//     if (!el.classList.contains("animate")) {
//       el.classList.add("animate");
//     }
//   } else if (el) {
//     el.classList.remove("animate");
//   }
// }

// window.addEventListener("scroll", () => {
//   {
//     animate("header.main");
//     animate("footer.main");
//   }
// });

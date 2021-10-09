// impressive number js
function formatNumber(num) {
  return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
}
function animateValue(obj, start, end, duration) {
  let startTimestamp = null;
  const step = (timestamp) => {
    if (!startTimestamp) startTimestamp = timestamp;
    const progress = Math.min((timestamp - startTimestamp) / duration, 1);
    let a = formatNumber(Math.floor(progress * (end - start) + start));
    obj.innerHTML = a;
    if (progress < 1) {
      window.requestAnimationFrame(step);
    }
  };
  window.requestAnimationFrame(step);
}

const obj = document.getElementsByClassName("impressive-item-number-count");
let end = document.getElementsByClassName("impressive-item-number-count");
for (let i = 0; i < end.length; i++) {
  end[i].innerHTML = end[i].innerHTML.replace(/ /g, "");
}
let flag = 1;
$(window).scroll(function () {
  var hT = $("#impressive-list").offset().top,
    hH = $("#impressive-list").outerHeight(),
    wH = $(window).height(),
    wS = $(this).scrollTop();
  var hT1 = (hT * 60) / 100;
  var hT2 = (hT * 70) / 100;
  console.log(Math.round(hT1), Math.round(wS));
  //   (hT + hH - wH)

  if (
    Math.round(wS) >= Math.round(hT1) &&
    Math.round(wS) <= Math.round(hT2) &&
    flag == 1
  ) {
    animateValue(obj[0], 0, end[0].innerHTML, 4000);
    animateValue(obj[1], 0, end[1].innerHTML, 5000);
    animateValue(obj[2], 0, end[2].innerHTML, 4000);
    animateValue(obj[3], 0, end[3].innerHTML, 5000);
    flag = 0;
  }
});

// scroll reveal
const sr = ScrollReveal();
// landing img
sr.reveal(".reveal-right-landing ", {
  origin: "right",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 100,
  distance: "100px",
});
sr.reveal(".reveal-left-landing", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 500,
  distance: "90px",
});
sr.reveal(".reveal-left-landing-text", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 1000,
  distance: "40px",
});
sr.reveal(".reveal-up-landing-button", {
  origin: "bottom",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 1500,
  distance: "10px",
});
// reveal section title
sr.reveal(".reveal-section-sub-title", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 500,
  distance: "30px",
});
sr.reveal(".reveal-section-title", {
  origin: "right",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 700,
  distance: "30px",
});
// how we work
sr.reveal(".reveal-hiw-1", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 1000,
  distance: "30px",
});
sr.reveal(".reveal-hiw-2", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 1500,
  distance: "30px",
});
sr.reveal(".reveal-hiw-3", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 2000,
  distance: "30px",
});
sr.reveal(".reveal-hiw-4", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  delay: 2500,
  distance: "30px",
});
// reveal category
sr.reveal(".reveal-up-category", {
  origin: "left",
  duration: 1000,
  opacity: 0,
  easing: "ease-out",
  // delay: 500,
  distance: "30px",
});

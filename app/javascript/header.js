window.addEventListener ('load', function () {
  let navToggle = document.querySelector(".nav-toggle, .hamburger");
  let nav = document.querySelector(".nav");

  navToggle.addEventListener("click", function () {
    let ariaExpanded = this.getAttribute("aria-expanded")
    if (ariaExpanded == "false") {
      this.setAttribute("aria-expanded", "true");
      this.setAttribute("aria-label", "menu");
      nav.classList.add("active");
    }
    else {
      this.setAttribute("aria-expanded", "false");
      this.setAttribute("aria-label", "menu closed");
      nav.classList.remove("active");
    }
  });
});
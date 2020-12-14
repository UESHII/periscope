window.addEventListener ('load', function () {
  let navToggle = document.querySelector(".nav-toggle, .hamburger");
  let navLink = document.querySelector(".nav-link");

  navToggle.addEventListener("click", function () {
    let ariaExpanded = this.getAttribute("aria-expanded")
    if (ariaExpanded == "false") {
      this.setAttribute("aria-expanded", "true");
      this.setAttribute("aria-label", "menu");
      navLink.classList.add("active");
    }
    else {
      this.setAttribute("aria-expanded", "false");
      this.setAttribute("aria-label", "menu closed");
      navLink.classList.remove("active");
    }
  });
});
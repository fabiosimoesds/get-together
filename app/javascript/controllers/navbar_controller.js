import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("Hello")
  }

  updateNavbar() {
    if (window.scrollY >= document.getElementById('btnScrollToTop').offsetHeight - 40) {
      this.element.classList.add("navbar-lewagon-white")
      const navButtons = document.querySelectorAll('.nav-buttons');
        navButtons.forEach(element => element.style.color = '#00B8B5');
      const logOut = document.querySelector('.nav-link.border-0.bg-transparent')
      logOut.classList.remove('text-white-50')
    } else {
      this.element.classList.remove("navbar-lewagon-white")
      const navButtons = document.querySelectorAll('.nav-buttons');
        navButtons.forEach(element => element.style.color = 'white')
      const logOut = document.querySelector('.nav-link.border-0.bg-transparent')
        logOut.classList.add('text-white-50')
    }
  }
}

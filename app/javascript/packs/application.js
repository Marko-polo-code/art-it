import "bootstrap";
// import { initUpdateNavbarOnScroll } from '../components/navbar';

import flatpickr from "flatpickr";

const initUpdateNavbarOnScroll = () => {
    const navbar = document.querySelector('.navbar-lewagon');
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight) {
          navbar.classList.add('navbar-lewagonsolid');
        } else {
          navbar.classList.remove('navbar-lewagonsolid');
        }
      });
    }
  }

initUpdateNavbarOnScroll();
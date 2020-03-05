import "bootstrap";
import flatpickr from "flatpickr";
// import { initFlatpickr } from '../plugins/init_flatpickr';

const initFlatpickr = () => {


  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#flat-booking-dates').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
  };

};

// export { initFlatpickr };


initFlatpickr();
// import { initUpdateNavbarOnScroll } from '../components/navbar';


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

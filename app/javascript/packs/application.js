import "bootstrap";
import { initUpdateNavbarOnScroll } from '../plugins/init_update_navbar_on_scroll';

// Rating star functionnality
import { initStarRating } from '../plugins/init_star_rating';

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


import { initMapbox } from '../plugins/init_mapbox';



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




initStarRating();
initUpdateNavbarOnScroll();

initMapbox();

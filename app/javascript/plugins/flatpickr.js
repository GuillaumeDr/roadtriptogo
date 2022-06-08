// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
      minDate: "today",
      mode: "range",
      showMonths: 1,
      inline: true,
      static: true,
      dateFormat: "d-m-Y"
  });

  let form = document.querySelector(".form");
  if (form){
    flatpickr("#date-event", {
      inline: true,
      static: true,
    });
  }
}


export { initFlatpickr };

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
}

export { initFlatpickr };

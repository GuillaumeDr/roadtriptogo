// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
      minDate: "today",
      mode: "range",
      showMonths: 2,
      defaultDate: "array",
      inline: true
  });
}

export { initFlatpickr };

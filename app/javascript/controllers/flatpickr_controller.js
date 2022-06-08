import { Controller } from "stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
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
}

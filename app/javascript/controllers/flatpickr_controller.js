import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static  targets = ["calendar"]

  connect() {

      flatpickr(".datepicker", {
          minDate: "today",
          mode: "range",
          showMonths: 1,
          inline: true,
          static: true,
          dateFormat: "d-m-Y",
      });

      let form = document.querySelector(".form");
      if (form){
        const start = new Date (this.calendarTarget.dataset.start)
        const end = new Date (this.calendarTarget.dataset.end)

        flatpickr("#date-event", {
          minDate: `${start.getFullYear()}-0${start.getMonth()+1}-${start.getDate()}`,
          maxDate:`${end.getFullYear()}-0${end.getMonth()+1}-${end.getDate()}`,
          inline: true,
          static: true,
        });
      }

  }
}

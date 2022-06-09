import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    let dateForm = document.querySelector(".date");
    const dateNewEvent = document.getElementsByName("event[date]")[0]
    const dateNewNote = document.getElementsByName("event[date]")[1]


    const next = document.getElementById("next")
    const previous = document.getElementById("previous")

    if (dateForm){
      const displayCard = (cards, selected_date) => {
        cards.forEach((card) => {
          card.classList.add("d-none")
          if (card.dataset.dateEvent == `${selected_date}`){
            card.classList.remove("d-none")
          }
        });
      }

      const date = document.getElementById("date-event")
      const  cardEvents = document.querySelectorAll('.event')

      let date_select = date.value
      dateNewEvent.value = date_select
      dateNewNote.value = date_select

      displayCard(cardEvents, date_select)

      date.addEventListener("change", (event) => {
        date.value = event.target.value
        date_select = date.value

        const jour = document.getElementById("date_jour")
        const newDate = new Date(date_select)

        jour.innerHTML = `Programme du ${newDate.toLocaleDateString()}`
        console.log(dateNewEvent.value)
        dateNewEvent.value = date_select
        dateNewNote.value = date_select

        displayCard(cardEvents, date_select)
      });

      next.addEventListener("click", (event) => {
        const selected = document.querySelector(".flatpickr-day.selected")
        const nextDay = selected.nextElementSibling
        nextDay.click();
      });
      previous.addEventListener("click", (event) => {
        const selected = document.querySelector(".flatpickr-day.selected")
        const previousDay = selected.previousElementSibling
        previousDay.click();
      });
    }


  };
}

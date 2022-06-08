import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    let dateForm = document.querySelector(".date");
    const dateNewEvent = document.getElementsByName("event[date]")[0]
    console.log(dateNewEvent.value)

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

      displayCard(cardEvents, date_select)

      date.addEventListener("change", (event) => {
        date.value = event.target.value
        date_select = date.value
        const jour = document.getElementById("date_jour")
        const newDate = new Date(date_select)

        // jour.insertAdjacentHTML("beforeend", ` ${newDate.toLocaleDateString()}`)
        jour.innerHTML = `Programme du ${newDate.toLocaleDateString()}`
        dateNewEvent.value = date_select

        displayCard(cardEvents, date_select)
      });
    }


  }
}

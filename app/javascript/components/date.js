const initDateEvent = () => {

  const date = document.getElementById("date-event")
  const  cardEvents = document.querySelectorAll('.event')
  let date_select = date.value
  displayCard(cardEvents, date_select)

  date.addEventListener("change", (event) => {
    date_select = date.value
    displayCard(cardEvents, date_select)
  });

}
const displayCard = (cards, selected_date) => {
  cards.forEach((card) => {
    card.classList.add("d-none")
    if (card.dataset.dateEvent == `${selected_date}`){
      console.log(card)
       card.classList.remove("d-none")
    }
  });
}


  export { initDateEvent}

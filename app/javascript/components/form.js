
const initForm = () => {
  let form = document.querySelector(".form");

  if (form){

    const event = document.getElementById("event-btn")
    const note = document.getElementById("note-btn")

    const formevent = document.getElementById("event")
    const formnote = document.getElementById("note")

    event.addEventListener("click", (event) => {
      formevent.classList.remove("d-none")
      formnote.classList.add("d-none")
    });
    note.addEventListener("click", (note) => {
      formnote.classList.remove("d-none")
      formevent.classList.add("d-none")
    });
  }
}

export { initForm}

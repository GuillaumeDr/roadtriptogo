import {initFlatpickr} from "plugins/flatpickr";
const modal = document.getElementById("myModal");

// Get the button that opens the modal
const btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
const span = document.getElementsByClassName("close")[0];

const initModal = () => {
  if(modal) {

      // When the user clicks on the button, open the modal
    btn.addEventListener("click", ()=> {
      // console.log("hello");
      modal.style.display = "block";
      initFlatpickr();
    })


    // When the user clicks on <span> (x), close the modal
    span.addEventListener("click", () => {
      modal.style.display = "none";
    })

    // When the user clicks anywhere outside of the modal, close it
    window.addEventListener ("click", (event) => {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    })
  }
}

export {initModal};

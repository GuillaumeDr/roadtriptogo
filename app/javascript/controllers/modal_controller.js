import { Controller } from "stimulus"
// import {initFlatpickr} from "plugins/flatpickr";

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    const modal = document.getElementById("myModal");
    const btn = document.getElementById("myBtn");
    const span = document.getElementsByClassName("close")[0];

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
}

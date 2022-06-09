import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["undone", "done"]

  displayUndone() {
    this.undoneTarget.classList.remove("d-none")
    this.doneTarget.classList.add("d-none")
  }

  displayDone() {
    this.undoneTarget.classList.add("d-none")
    this.doneTarget.classList.remove("d-none")
  }

}

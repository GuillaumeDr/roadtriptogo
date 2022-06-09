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

   update(e) {

        const id = e.target.dataset.id
        const project_id = e.target.dataset.project
        const todolist_id = e.target.dataset.todolist
        const csrfToken = document.querySelector("[name='csrf-token']").content
        const url = `/projects/${project_id}/todolists/${todolist_id}/tasks/${id}`
        const target = e.currentTarget
        const done = target.checked


        fetch(url, {
            method: 'PATCH', // *GET, POST, PUT, DELETE, etc.
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify({ status: e.target.checked }) // body data type must match "Content-Type" header
        }).then(response => response.json())
          .then((data) => {
            target.parentElement.parentElement.parentElement.outerHTML =""
            if(done) {
              this.doneTarget.insertAdjacentHTML("beforeend", data.form)
            }
            else {
              this.undoneTarget.insertAdjacentHTML("afterbegin", data.form)
            }
          })
    }

}

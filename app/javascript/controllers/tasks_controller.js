import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    update(e) {
        const id = e.target.dataset.id
        const project_id = e.target.dataset.project
        const todolist_id = e.target.dataset.todolist
        const csrfToken = document.querySelector("[name='csrf-token']").content
        const url = `/projects/${project_id}/todolists/${todolist_id}/tasks/${id}`

        fetch(url, {
            method: 'PATCH', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken

            },
            body: JSON.stringify({ status: e.target.checked }) // body data type must match "Content-Type" header
        })
          .then(response => response.json())
          .then(data => {
            console.log(data)

           })
    }
}

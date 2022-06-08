import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["map", "calendar", "todolist", "chat"]

  connect() {
    if(window.location.href.includes('todolists')) {
      this.todolistTarget.classList.add("icon-active")
    }else if(window.location.href.includes('events')) {
      this.calendarTarget.classList.add("icon-active")
    }else if(window.location.href.includes('chatrooms')) {
      this.chatTarget.classList.add("icon-active")
    }else {
      this.mapTarget.classList.add("icon-active")
    }
  }


}

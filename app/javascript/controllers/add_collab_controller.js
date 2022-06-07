import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "collaborators"]

  collab(event) {

    const target = event.target
    const idcollab = `collab${target.dataset.userid}`

    if (target.dataset.selected === "false"){
      target.dataset.selected = "true"
      this.inputTarget.value += target.dataset.userid +","
      console.log(target.dataset.userkey)

      if (target.dataset.userkey == null) {
        this.collaboratorsTarget.insertAdjacentHTML("beforeend",`<img class="avatar avatar-collab" id=${idcollab} data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" src="https://images.unsplash.com/photo-1608889335941-32ac5f2041b9?ixlib=rb-1.2.1&amp;raw_url=tr[…]MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=580">`)
      } else {
        var htmlUrl = `http://res.cloudinary.com/dji262zcw/image/upload/v1/development/${target.dataset.userkey}`
        this.collaboratorsTarget.insertAdjacentHTML("beforeend",`<img class="avatar avatar-collab" id=${idcollab} width="45" src=${htmlUrl}>`)
      }
    }else{
      target.dataset.selected = "false"
      var arr = this.inputTarget.value.split(',')
      for( var i = 0; i < arr.length; i++){
            if ( arr[i] === target.dataset.userid) {
                arr.splice(i, 1);
        }
      }
      this.inputTarget.value = arr.join()
      var image_x = document.getElementById(idcollab);
      image_x.parentNode.removeChild(image_x);
    }
  }
}

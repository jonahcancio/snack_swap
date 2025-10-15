import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("ModalController connected")

        this.element.addEventListener("modal:close", () => {
            this.close()
        })
    }

    close(e) {
        console.log("close method called")
        const modal = document.getElementById("modal")
        modal.innerHTML = ""
    }
}

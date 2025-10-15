import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    connect() {
        this.originalUrl = window.location.href
        document.body.classList.add("modal-open")
    }

    disconnect() {
        document.body.classList.remove("modal-open")
    }

    close() {
        this.element.innerHTML = ""
        history.replaceState({}, "", this.originalUrl)
    }
}

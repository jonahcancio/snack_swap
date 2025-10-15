import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
    open(event) {
        event.preventDefault()
        const url = $(this.element).attr("href")

        $.get(url, (html) => {
            const $frame = $("#modal")
            if ($frame.length === 0) {
                console.error("Modal frame (#modal) not found in DOM")
                return
            }

            $frame.html(html)
            $frame.find("input, textarea, select, button").first().focus()
        }).fail(() => {
            console.error("Failed to open modal:", url)
        })
    }

    connect() {
        $(document).on("click", "#modal .btn-close", function () {
            $("#modal").html("") // clear the content
        })
    }
}

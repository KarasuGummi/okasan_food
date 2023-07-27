import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "date", "time"]

  connect() {
    flatpickr(this.dateTarget, {
      inline: true,
    })
    flatpickr(this.timeTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      inline: true,
    })
  }
}

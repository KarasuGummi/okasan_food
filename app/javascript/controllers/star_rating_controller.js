import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"
// import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    new StarRating(this.element)
  }
}

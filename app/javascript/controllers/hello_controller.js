import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello Stimulus 3")
    this.element.textContent = "Hello Worldsito!"
  }
}

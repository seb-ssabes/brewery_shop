import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "totalPrice" ];

  connect() {
  console.log("Orders controller connectedddddddd")
  console.log("totalPrice", this.totalPriceTarget)
  }
}

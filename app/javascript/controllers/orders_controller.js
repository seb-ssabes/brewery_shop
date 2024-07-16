import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "totalPrice" ];

  initialize() {
  this.totalPriceTarget
  this.totalPriceTargets
  }

  connect() {
  console.log("Orders controller connectedddddddd")
  console.log("totalPrice", this.totalPriceTarget)
  }

  updateTotalPrice() {
  console.log("Shipping method chosen")
  }
}

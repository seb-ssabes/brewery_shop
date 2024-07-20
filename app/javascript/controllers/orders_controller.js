import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "totalPrice", "shipping" ];

  initialize() {
  this.totalPriceTarget
  this.totalPriceTargets
  this.shippingTarget
  this.shippingTargets
  }

  connect() {
  console.log("Orders controller connectedddddddd")
  console.log("totalPrice", this.totalPriceTarget)
  }

  updateTotalPrice() {
  console.log("Shipping method chosen")
  this.totalPriceTarget.classList.toggle("d-none")
  this.shippingTarget.classList.toggle("d-none")
  }

}

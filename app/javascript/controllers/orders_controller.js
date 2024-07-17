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

  const shippingMethodId = event.target.value;
  const orderId = this.element.dataset.orderId;
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  fetch(`/orders/${orderId}/update_total_price`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": csrfToken
    },
    body: JSON.stringify({ order_id: orderId, shipping_method_id: shippingMethodId })
  })
  .then(response => response.json())
  .then(data => {
    if (data.error) {
      console.error(data.error);
    } else {
      this.totalPriceTarget.innerText = `Total: ${data.total_price}`;
    }
  })
  .catch(error => console.error('Error:', error));

  }
}

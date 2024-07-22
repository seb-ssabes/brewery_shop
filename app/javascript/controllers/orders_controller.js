import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "totalPrice", "shipping", "subtotalPrice" ];

  updateTotalPrice(event) {
    const shippingMethodText = event.target.selectedOptions[0].text;

    const shippingPrice = this.getShippingPrice(shippingMethodText);
    const subtotalText = this.subtotalPriceTarget.textContent;
    const subtotal = parseFloat(subtotalText.replace('€', ''));
    const totalPrice = subtotal + shippingPrice;

    this.shippingTarget.textContent = shippingMethodText;
    this.totalPriceTarget.textContent = `€${totalPrice.toFixed(2)}`;
  }

  getShippingPrice(shippingMethodText) {
    const shippingPrices = {
      'Standard Shipping - €5.00': 5.00,
      'Express Shipping - €10.00': 10.00,
      'Overnight Shipping - €20.00': 20.00,
      'Barleytown Shipping (local) - €2.00': 2.00,
      'Enter a shipping method': 0.00
    };
    return shippingPrices[shippingMethodText] || 0.00;
  }
}

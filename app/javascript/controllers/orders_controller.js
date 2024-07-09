import { Controller} from 'stimulus'

export default class extends Controller {
  updateTotalPrice(event) {
    const form = this.element.closest("form")
    const url = form.action.replace("create", "update_total_price")

    fetch (url, {
      method: "POST",
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        order: {
          shipping_method_id: event.target.value
        }
      })
    })
  }
}

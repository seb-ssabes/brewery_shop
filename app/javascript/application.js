import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import OrdersController from "./controllers/orders_controller"
// import "controllers" // this one loads index.js

window.Stimulus = Application.start();
Stimulus.register("orders", OrdersController)

console.log("HOLAAAAaa FROM JS/APPLICATION.JS")

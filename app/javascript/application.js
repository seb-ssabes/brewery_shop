// import "@hotwired/turbo-rails"
// import "controllers"

import { Application } from "@hotwired/stimulus"
// import { Turbo } from "@hotwired/turbo-rails"

import OrdersController from "./controllers/orders_controller"
// import "controllers" // this one loads index.js

window.Stimulus = Application.start();
Stimulus.register("orders", OrdersController)

console.log("HOLAAAA FROM JS/APPLICATION.JS")

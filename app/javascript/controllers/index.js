import { application } from "controllers/application"

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

const application = application.start();

// console.log("HOLA from controllers/index.js")

console.log("Stimulus controllers loaded(INDEX)");

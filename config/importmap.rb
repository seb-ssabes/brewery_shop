pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin 'bootstrap', to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"

# pin "controllers/orders_controller", to: "controllers/orders_controller.js"
pin_all_from "app/javascript/controllers", under: "controllers"

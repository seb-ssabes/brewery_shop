document.addEventListener("DOMContentLoaded", function() {
  const forms = document.querySelectorAll(".quantity-form");

  forms.forEach(form => {
    const select = form.querySelector(".quantity-select");
    const input = form.querySelector(".quantity-input");
    const button = form.querySelector(".quantity-button");

    select.addEventListene("change", function () {
      if (this.value === "10+") {
        input.style.display = "block";
        input.value = 10;
        button.style.display = "inline-block";
      } else {
        input.style.display = "none";
        button.style.display = "inline-block";
      }
    });

    input.addEventListener("input", function() {
      button.style.display = "inline-block";
    });
  });
});

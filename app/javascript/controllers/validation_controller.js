import { Controller } from "@hotwired/stimulus";
import Inputmask from "inputmask";

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = ["email", "phone"];
  connect() {}
  emailVerification() {
    const email = this.emailTarget.value;
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(email)) {
      this.emailTarget.setCustomValidity("Invalid email format");
    } else {
      this.emailTarget.setCustomValidity("");
    }
  }

  phoneVerification() {
    Inputmask({
      regex: "[0-9]{3}-[0-9]{3}-[0-9]{4}",
    }).mask(this.phoneTarget);
  }
}

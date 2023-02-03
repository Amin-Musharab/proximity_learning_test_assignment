import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="data"
export default class extends Controller {
  static targets = ["personalid"];

  connect() {}
  getId(e) {
    e.id = this.data.get("id");
  }
}

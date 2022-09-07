import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="datapicker"
export default class extends Controller {
  static targets = ["start", "end"]
  connect() {
    flatpickr(this.startTarget, {
      altInput: true,
      plugins: [new rangePlugin({ input: this.endTarget})]
    });
  }
}

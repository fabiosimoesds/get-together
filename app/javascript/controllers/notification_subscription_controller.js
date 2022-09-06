import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["notify"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: data => this.#insertNotificationDot() }
    )
    console.log(`Subscribe to the user with the id ${this.userIdValue}.`)
  }

  #insertNotificationDot() {
    this.notifyTarget.classList.add('active')
  }
}

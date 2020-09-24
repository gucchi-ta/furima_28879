import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("a")
    const html = `<p>${data.content.message}</p>`;
    console.log(html)
    const messages = document.getElementById('messages');
    console.log(messages)
    const newMessage = document.getElementById('message_message');
    console.log(newMessage)
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    const messageBtn = document.getElementById('message-btn');
    messageBtn.disabled = false;
    console.log("z")
  }
});

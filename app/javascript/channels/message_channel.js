import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const userNickname = document.getElementById('user-nickname').textContent;
    const today = new Date();
    const message = data.content.message.replace(/\r\n/g, "<br>").replace(/(\n|\r)/g, "<br>");
    const html = 
      `<div class="message-border">
        <p class="message-nickname">
          ${userNickname}
          <a class="message-date">
            ${today.getFullYear()}-${(today.getMonth()+1)}-${today.getDate()}&nbsp;${today.getHours()}:${today.getMinutes()}:${today.getSeconds()}&nbsp;UTC
          </a>
        </p>
        <p class="message-mesage">
          ${message}
        </p>
      </div>`;
    console.log(html)
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_message');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    const messageBtn = document.getElementById('message-btn');
    messageBtn.disabled = false;
  }
});

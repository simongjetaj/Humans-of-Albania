// HANDLING NOTIFICATIONS
const showNotification = (message, color) => {
  const nav = document.querySelector("nav.navbar");
  nav.insertAdjacentHTML(
    "afterend",
    `
  <div class="container message">
      <div class="notification ${color}">
      <button class="delete deleteNotification"></button>
      ${message}
      </div>
  </div>`
  );

  const removeElement = document.querySelector(".message");
  setTimeout(() => removeElement.remove(), 3000);
}

module.exports = {
  showNotification
};
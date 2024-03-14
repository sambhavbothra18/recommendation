document.addEventListener('DOMContentLoaded', function() {
  const notificationsLink = document.querySelector('[data-behavior="notifications-link"]');
  if (notificationsLink) {
    notificationsLink.addEventListener('click', function(event) {
      event.preventDefault();
      fetchNotifications();
    });
  }
});

function fetchNotifications() {
  fetch('/notifications')
    .then(response => response.json())
    .then(notifications => {
      displayNotifications(notifications);
    })
    .catch(error => {
      console.error('Error fetching notifications:', error);
    });
}

function displayNotifications(notifications) {
  const notificationsContainer = document.getElementById('notifications-container');
  if (notificationsContainer) {
    notificationsContainer.innerHTML = '';
    notifications.forEach(notification => {
      const notificationElement = document.createElement('div');
      notificationElement.classList.add('notification');
      notificationElement.innerHTML = `<p>${notification.message}</p>`;
      notificationsContainer.appendChild(notificationElement);
    });
  }
}

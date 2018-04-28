// MODALS FUNCTIONALITY
const modalBtns = document.querySelectorAll('.modalBtn'),
closeBtns       = document.querySelectorAll('.closeBtn'),
cancelBtns      = document.querySelectorAll('.cancel');

modalBtns.forEach(modalBtn => {
  modalBtn.addEventListener('click', () => {
    const modal = modalBtn.getAttribute('data-modal');
    document.getElementById(modal).style.display = 'block';
  });
});

closeBtns.forEach(closeBtn => {
  closeBtn.addEventListener('click', () => {
    const modal = closeBtn.closest('.modal');
    modal.style.display = "none";
  });
});

cancelBtns.forEach(cancelBtn => {
  cancelBtn.addEventListener('click', () => {
    const modal = cancelBtn.closest('.modal');
    modal.style.display = "none";
  });
});

window.onclick = (e) => {
  e.target.className === "modal" ? event.target.style.display = "none" : '';
}

////////////////////////////////////////////

// HANDLE CREATE STORY FUNCTIONALITY
$('#newStoryForm').submit(handleCreateStory);

function handleCreateStory(e) {
  e.preventDefault();
  const formData = $(this).serialize();
  $.post('/stories', formData, function(data) {
    const output = `
      <div class="column is-one-quarter-desktop is-one-third-tablet">
      <div class="card">
        <div class="card-image">
          <figure class="image is-4by3">
            <img src="https://bulma.io/images/placeholders/1280x960.png" alt="">
          </figure>
        </div>
        <div class="card-content">
          <div class="media">
            <div class="media-left">
              <figure class="image is-48x48">
                <img src="https://bulma.io/images/placeholders/96x96.png" alt="">
              </figure>
            </div>
            <div class="media-content">
              <p class="title is-6">${data[0].title.substring(0, 25)}</p>
              <p class="subtitle is-7">@${data[0].username}</p>
            </div>
          </div>

          <div class="content">
            <p class="left">${data[0].story.substring(0, 100)+'...'}</p>
            <time datetime="2016-1-1">${data[0].created_at.toString().substring(0, 16)}</time>
          </div>
          <a href="stories/${data[0].storyId}" class="button is-dark">Read More</a>
        </div>
      </div>
    </div>
    `;
    $('.columns').append(output);
    showNotification('Story has been created successfully!', 'is-success');
    document.querySelector('.modal').style.display = "none";
    $('#title').val('');
    $('#story').val('');
  })
}

// HANDLE UPDATE STORY FORM
$('#editStoryForm').submit(handleUpdateStory);

function handleUpdateStory(e) {
  e.preventDefault();
  const formData = $(this).serialize();
  const actionUrl = $(this).attr('action');
  $.ajax({
    url: actionUrl,
    data: formData,
    type: 'PUT',
    success: function(data) {
      $('.title').html(data[0].title);
      $('.story').html(data[0].story);
      document.querySelector('.modal').style.display = "none";
      showNotification('Story has been updated successfully!', 'is-success');
    },
    error: function(xhr, status, error) {
      document.querySelector('.modal').style.display = "none";
      showNotification(error, 'is-danger');
    }
  });
}


// HANDLE DELETE STORY FUNCTIONALITY
$('#deleteStoryForm').on('submit', handleDeleteStory);

function handleDeleteStory(e) {
  e.preventDefault();
  const confirmResponse = confirm('Are you sure you want to delete this item?');
  if(confirmResponse) {
    const actionUrl = $(this).attr('action');
    $.ajax({
      url: actionUrl,
      type: 'DELETE',
      success: function(data) {
        window.location.href = "/stories";
        setTimeout(showNotification('Story has been deleted successfully!', 'is-success'),
        600
        );
      },
      error: function(xhr, status, error) {
        showNotification(error, 'is-danger');
      }
    });
  }
}

// SEARCH FUNCTIONALITY 
$('#search').on('input', searchStories);

function searchStories(e) {
  const url = `/stories?search=${encodeURIComponent(e.target.value)}`;
  $.getJSON(url, function(data) {
    $('.columns').html('');
    
    data.forEach(function(story) {
      let output = `
      <div class="column is-one-quarter-desktop is-one-third-tablet">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="https://bulma.io/images/placeholders/1280x960.png" alt="">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-48x48">
                  <img src="https://bulma.io/images/placeholders/96x96.png" alt="">
                </figure>
              </div>
              <div class="media-content">
                <p class="title is-6">${story.title.substring(0, 25)}</p>
                <p class="subtitle is-7">@${story.username}</p>
              </div>
            </div>

            <div class="content">
              <div>${story.story.substring(0, 100)+'...'}</div>
              <time datetime="2016-1-1">${story.created_at.toString().substring(0, 16)}</time>
            </div>
            <a href="stories/${story.id}" class="button is-dark">Read More</a>
          </div>
        </div>

      </div>
      `;

      $('.columns').append(output);
      
    });
  });
}

document.addEventListener('DOMContentLoaded', function () {

  // Get all "navbar-burger" elements
  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach(function ($el) {
      $el.addEventListener('click', function () {
        // Get the target from the "data-target" attribute
        var target = $el.dataset.target;
        var $target = document.getElementById(target);
        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $el.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }
});


const recognition = new webkitSpeechRecognition();
const micro = document.querySelector('span.micro');
const story = document.getElementById('story');

if(micro) {
  micro.onclick = function() {
    recognition.start();
  }
}

recognition.onresult = function(e) {
  var textGenerated = e.results[0][0].transcript;
  story.textContent += textGenerated;
}


// HANDLE NEW COMMENT FUNCTIONALITY
$('#newCommentStoryForm').submit(handleCommentCreate);

function handleCommentCreate(e) {
  e.preventDefault();

  const comment = $(this).serialize();
  const actionUrl = $(this).attr('action');
  $.post(`${actionUrl}`, comment, function(data) {
    const output = `
      <article class="media">
      <figure class="media-left">
        <p class="image is-64x64">
          <img src="https://bulma.io/images/placeholders/128x128.png">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <span>
            <strong><small>@${data[0].username}</small></strong>
          </span>
          <p>
            ${data[0].comment}
          </p>
        </div>

        <nav class="level is-mobile">
            <div class="level-left">
              <a class="level-item">
                <span class="icon is-small editCommentBtn"><i class="fas fa-edit"></i></span>
              </a>
            </div>
          </nav>

          <!-- this form is not displaying until user clicks the edit icon to update comment -->
          <form action="/stories/${data[0].storyId}/comments/${data[0].commentId}" method="POST" id="editCommentForm">
            <div class="field">
              <p class="control">
              <textarea class="textarea" rows="2" name="editedComment">${data[0].comment}</textarea>
              </p>
            </div>
            <button type="submit" class="button is-warning is-small">Update</button>
          </form>
          </div>

          <div class="media-right">
            <form action="/stories/${data[0].storyId}/comments/${data[0].commentId}" method="POST" id="deleteCommentForm">
              <button type="submit" class="delete"></button>
            </form>
          </div>
        </article>
    `;
    $('#comments').prepend(output);
    $('.textarea').val('');
  })

}

// HANDLE UPDATE COMMENT FUNCTIONALITY
$('#comments').on('click', '.editCommentBtn', function() {
  $(this).parents().eq(2).next().fadeToggle();
});

$('#comments').on('submit', '#editCommentForm', handleUpdateComment);

function handleUpdateComment(e) {
  e.preventDefault();

  const commentData = $(this).serialize();
  const actionUrl = $(this).attr('action');

  const $itemToUpdate = $(this).parent().find('.content p');
  const editCommentForm = $(this);
  $.ajax({
    url: actionUrl,
    data: commentData,
    type: 'PUT',
    success: function(data) {
      $itemToUpdate.html(data[0].comment); 
      editCommentForm.fadeToggle(); // close form editing when comment update successfully
    },
    error: function(xhr, status, error) {
      showNotification(error, 'is-danger');
    }
  });
}


// HANDLE DELETE COMMENT FUNCTIONALITY
$('#comments').on('submit', '#deleteCommentForm', handleDeleteComment);

function handleDeleteComment(e) {
  e.preventDefault();
  const confirmResponse = confirm('Are you sure you want to delete this comment?');
  const $commentToDelete = $(this).parents('.media');
  if(confirmResponse) {
    const actionUrl = $(this).attr('action');
    $.ajax({
      url: actionUrl,
      type: 'DELETE',
      success: function(data) {
        $commentToDelete.remove();
      },
      error: function(xhr, status, error) {
        showNotification(error, 'is-danger');
      }
    });
  }
}


// HANDLING NOTIFICATIONS
function showNotification(message, color) {
  const nav = document.querySelector('nav.navbar');
  nav.insertAdjacentHTML('afterend', `
  <div class="container message">
      <div class="notification ${color}">
      <button class="delete deleteNotification"></button>
      ${message}
      </div>
  </div>`);

  const removeElement = document.querySelector('.message');
  setTimeout(() => removeElement.remove(),
3000);
}

$('body').on('click', '.deleteNotification', function() {
  $('.message').remove();
});
  

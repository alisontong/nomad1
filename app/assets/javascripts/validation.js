$(document).ready(function () {
  $("#new_user").validate({
      debug: true,
      rules: {
        "user[name]": {
          required: true, 
          maxlength: 255 
        },
        "user[username]": {
          required: true, 
          minlength: 2,
          maxlength: 25 
        },
        "user[email]": {
          required: true, 
          email: true
        }, 
        "user[password]": {
          required: true, 
          minlength: 6, 
          maxlength: 30 
        }
      },
      messages: {
            "user[name]": {
              required: "Please enter your name",
              maxlength: "Name must be shorter than 255 characters"
            },
            "user[username]": {
              required: "Please enter a username",
              minlength: "Username must be longer than 2 characters",
              maxlength: "Username must be shorter than 25 characters"
            },
            "user[email]": {
              required: "Please enter an email",
              email: "Please enter a valid email"
            },
            "user[password]": {
              required: "Please enter a password",
              minlength: "Your password must be at least 6 characters",
              maxlength: "Your password must be shorter than 30 characters"
            }
          }
    });

  $("#new_login").validate({
      debug: true,
      rules: {
        "user[email]": {
          required: true, 
          email: true, 
      },
        "user[password]": {
          required: true, 
          minlength: 6, 
          maxlength: 20 }
      },
      messages: {
        "user[email]": {
          required: "Please enter an email",
          email: "Please enter a valid email"
        },
        "user[password]": {
          required: "Please enter a password",
          minlength: "Your password must be at least 6 characters"
        }
      }
    });

  $("#new_post").validate({
      debug: true,
      rules: {
        "post[title]": {
          required: true,
          minlength: 2,
          maxlength: 200
        },
        "post[body]": {
          required: true,
          minlength: 2,
          maxlength: 255
        }
      },
      messages: {
        "post[title]": {
          required: "Please enter a title",
          minlength: "Your title must be at least 2 characters",
          maxlength: "Your title must be shorter than 200 characters"
        },
        "post[body]": {
          required: "Please enter a body",
          minlength: "Your body must be at least 2 characters",
          maxlength: "Your body must be shorter than 255 characters"
        }
    });
});

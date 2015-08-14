$(document).ready(function () {
  $("#new_user").validate({
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
              required: "please enter your name",
              maxlength: "name must be shorter than 255 characters"
            },
            "user[username]": {
              required: "please enter a username",
              minlength: "username must be longer than 2 characters",
              maxlength: "username must be shorter than 25 characters"
            },
            "user[email]": {
              required: "please enter an email",
              email: "please enter a valid email"
            },
            "user[password]": {
              required: "please enter a password",
              minlength: "your password must be at least 6 characters",
              maxlength: "your password must be shorter than 30 characters"
            }
          }
    });

  $("#new_login").validate({
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
          required: "please enter an email",
          email: "please enter a valid email"
        },
        "user[password]": {
          required: "please enter a password",
          minlength: "your password must be at least 6 characters"
        }
      }
    });

  $("#new_post").validate({
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
          required: "please enter a title",
          minlength: "your title must be at least 2 characters",
          maxlength: "your title must be shorter than 200 characters"
        },
        "post[body]": {
          required: "please enter a body",
          minlength: "your body must be at least 2 characters",
          maxlength: "your body must be shorter than 255 characters"
        }
      }
    });
});

// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
//

const loginButton = document.getElementById("loginButton");
const emailField = document.getElementById("email");
const passwordField = document.getElementById("password");
loginButton.addEventListener("click", function(event) {
    event.preventDefault();

    const email = getEmail();
    const password = getPassword();

    console.log(email, password);

    fetch(`/api/auth`, { email, password })
        .then(response => response.json())
        .then(function(response) {
            console.log("user details", response);
        })
        .catch(function(error) {
            console.log("there was an error...", error);
        });
});

function getEmail() {
    return emailField.value;
}

function getPassword() {
    return passwordField.value;
}

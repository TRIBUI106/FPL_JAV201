var username;
var websocket;

function init() {
    username = prompt("Enter username");

    websocket = new WebSocket(
        `ws://localhost:8080/Lab8_war_exploded/json/chat/${username}`
    );

    websocket.onopen = () => console.log("JSON connected");

    websocket.onmessage = function (resp) {
        var msg = JSON.parse(resp.data);
        var box = document.getElementById("messages");

        box.innerHTML += `<p><b>${msg.sender}</b>: ${msg.text}</p>`;
    };

    websocket.onerror = (e) => console.error(e);
    websocket.onclose = () => console.log("closed");
}

function send() {
    var input = document.getElementById("message");

    var msg = {
        sender: username,
        text: input.value,
        type: 2
    };

    websocket.send(JSON.stringify(msg));
    input.value = '';
}
var websocket;

function init() {
    websocket = new WebSocket(
        "ws://localhost:8080/Lab8_war_exploded/text/chat"
    );

    websocket.onopen = () => console.log("TEXT connected");

    websocket.onmessage = function (resp) {
        var box = document.getElementById("messages");
        box.innerHTML += `<p>${resp.data}</p>`;
    };

    websocket.onerror = (e) => console.error("WS error", e);
    websocket.onclose = () => console.log("closed");
}

function send() {
    var input = document.getElementById("message");
    websocket.send(input.value);
    input.value = '';
}
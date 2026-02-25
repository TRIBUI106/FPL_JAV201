<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bài 1 - Text Chat | Lab 8</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }
        .chat-box {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 500px;
            height: 85vh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }
        .header {
            background: #6366f1;
            color: white;
            padding: 16px 20px;
            font-size: 1.3rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .header::before { content:"💬"; font-size:1.4rem; }
        #messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            background: #f8fafc;
        }
        #messages p {
            margin: 10px 0;
            padding: 12px 18px;
            border-radius: 18px;
            max-width: 80%;
            word-wrap: break-word;
            line-height: 1.45;
            background: #e2e8f0;
        }
        #messages p.me {
            background: #6366f1;
            color: white;
            margin-left: auto;
        }
        .input-area {
            display: flex;
            padding: 16px;
            background: white;
            border-top: 1px solid #e2e8f0;
            gap: 12px;
        }
        #message {
            flex: 1;
            padding: 14px 18px;
            border: 1px solid #cbd5e1;
            border-radius: 999px;
            font-size: 1rem;
            outline: none;
        }
        #message:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.15);
        }
        button {
            background: #6366f1;
            color: white;
            border: none;
            border-radius: 999px;
            padding: 0 28px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }
        button:hover { background: #4f46e5; }
        /* Scrollbar */
        #messages::-webkit-scrollbar { width: 6px; }
        #messages::-webkit-scrollbar-thumb { background: #94a3b8; border-radius: 3px; }
    </style>
</head>
<body onload="init()">

<div class="chat-box">
    <div class="header">Text Chat (Broadcast)</div>
    <div id="messages"></div>
    <div class="input-area">
        <input id="message" placeholder="Nhập tin nhắn..." autocomplete="off">
        <button onclick="send()">Gửi</button>
    </div>
</div>

<script src="js/text-chat.js"></script>


<script>

    const originalOnMessage = websocket.onmessage;
    websocket.onmessage = function(e) {
        const box = document.getElementById("messages");
        const p = document.createElement("p");
        p.textContent = e.data;
        box.appendChild(p);
        box.scrollTop = box.scrollHeight;
    };
</script>

</body>
</html>
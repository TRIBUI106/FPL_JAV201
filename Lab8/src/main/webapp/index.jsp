<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab 8 - WebSocket Chat</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: #fff;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
            padding: 40px 50px;
            text-align: center;
            max-width: 480px;
            width: 100%;
            backdrop-filter: blur(8px);
        }
        h1 {
            font-size: 2.2rem;
            margin-bottom: 1.8rem;
            color: #1e293b;
        }
        .subtitle {
            color: #64748b;
            margin-bottom: 2.5rem;
            font-size: 1.1rem;
        }
        .btn {
            display: block;
            margin: 16px auto;
            padding: 16px 32px;
            background: #6366f1;
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.25s ease;
            box-shadow: 0 4px 15px rgba(99,102,241,0.3);
        }
        .btn:hover {
            background: #4f46e5;
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(99,102,241,0.4);
        }
        .btn:active {
            transform: translateY(0);
        }
        footer {
            margin-top: 2.5rem;
            color: #94a3b8;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>🚀 Lab 8 - WebSocket Chat</h1>
    <p class="subtitle">Thực hành WebSocket với 2 phiên bản chat đơn giản</p>

    <a href="websocket-client.jsp" class="btn">👉 Bài 1: Text Chat (Plain Text)</a>
    <a href="json-chat.jsp"     class="btn">👉 Bài 2: JSON Chat (Có username & format)</a>

</div>

</body>
</html>
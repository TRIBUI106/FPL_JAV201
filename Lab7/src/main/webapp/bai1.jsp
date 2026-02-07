<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bài 1</title>
    <style>
        body{font-family:Arial;background:#ecf0f1;}
        .box{
            width:600px;
            margin:50px auto;
            background:white;
            padding:20px;
            border-radius:8px;
        }
        button{
            padding:10px 20px;
            background:#27ae60;
            color:white;
            border:none;
            border-radius:5px;
        }
        pre{
            background:#f4f4f4;
            padding:15px;
            margin-top:15px;
        }
        a{display:block;margin-top:20px;}
    </style>
</head>
<body>
<div class="box">
    <h2>Bài 1 - Fetch JSON</h2>
    <button onclick="load()">Load JSON</button>
    <pre id="out"></pre>
    <a href="index.jsp">⬅ Quay lại</a>
</div>

<script>
    function load(){
        fetch("http://localhost:8080/Lab7_war_exploded/json")
            .then(r=>r.json())
            .then(d=>out.innerText=JSON.stringify(d,null,4));
    }
</script>
</body>
</html>

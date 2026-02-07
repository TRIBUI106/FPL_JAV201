<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bài 3</title>
    <style>
        body{font-family:Arial;background:#ecf0f1;}
        .box{
            width:700px;
            margin:40px auto;
            background:white;
            padding:20px;
            border-radius:8px;
        }
        input,button{
            padding:8px;
            margin:5px;
        }
        pre{
            background:#f4f4f4;
            padding:15px;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Bài 3 - REST API Employee</h2>

    <button onclick="getAll()">GET ALL</button>
    <input id="eid" placeholder="Nhập mã NV">
    <button onclick="getOne()">GET BY ID</button>

    <pre id="out"></pre>
    <a href="index.jsp">⬅ Quay lại</a>
</div>

<script>
    const BASE="http://localhost:8080/Lab7_war_exploded/employees";

    function getAll(){
        fetch(BASE).then(r=>r.json())
            .then(d=>out.innerText=JSON.stringify(d,null,4));
    }
    function getOne(){
        fetch(BASE+"/"+eid.value).then(r=>r.json())
            .then(d=>out.innerText=JSON.stringify(d,null,4));
    }
</script>
</body>
</html>

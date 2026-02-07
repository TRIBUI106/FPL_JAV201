<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bài 2</title>
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
            background:#e67e22;
            color:white;
            border:none;
            border-radius:5px;
        }
        pre{
            background:#f4f4f4;
            padding:15px;
            margin-top:15px;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Bài 2 - Upload File Ajax</h2>
    <input type="file" id="file">
    <button onclick="upload()">Upload</button>
    <pre id="out"></pre>
    <a href="index.jsp">⬅ Quay lại</a>
</div>

<script>
    function upload(){
        let f=document.getElementById("file").files[0];
        let fd=new FormData();
        fd.append("file",f);

        fetch("http://localhost:8080/Lab7_war_exploded/upload",{
            method:"POST",
            body:fd
        }).then(r=>r.json())
            .then(d=>out.innerText=JSON.stringify(d,null,4));
    }
</script>
</body>
</html>

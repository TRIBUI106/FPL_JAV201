<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>LAB 7 - Bài 4</title>
    <style>
        body{
            font-family: Arial;
            background:#f4f6f8;
        }
        .container{
            width:900px;
            margin:40px auto;
            background:white;
            padding:30px;
            border-radius:10px;
            box-shadow:0 0 10px #ccc;
        }
        h1{
            text-align:center;
        }
        .menu a{
            display:inline-block;
            margin:10px;
            padding:10px 16px;
            background:#3498db;
            color:white;
            text-decoration:none;
            border-radius:6px;
            font-weight:bold;
        }
        .menu a:hover{
            background:#2980b9;
        }
        .form, table{
            margin-top:20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>LAB 7 - JAVA WEB NÂNG CAO</h1>

    <!-- MENU -->
    <div class="menu">
        <a href="bai1.jsp">Bài 1</a>
        <a href="bai2.jsp">Bài 2</a>
        <a href="bai3.jsp">Bài 3</a>
        <a href="bai4.jsp">Bài 4</a>
    </div>

    <hr>

    <!-- FORM -->
    <div class="form">
        <input id="id" placeholder="Id?"><br>
        <input id="name" placeholder="Name?"><br>

        <input type="radio" id="male" name="gender" checked> Male
        <input type="radio" id="female" name="gender"> Female<br>

        <input id="salary" placeholder="Salary?"><br><br>

        <button onclick="ctrl.create()">Create</button>
        <button onclick="ctrl.update()">Update</button>
        <button onclick="ctrl.delete()">Delete</button>
        <button onclick="ctrl.reset()">Reset</button>
    </div>

    <hr>

    <!-- TABLE -->
    <table border="1" width="100%">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Salary</th>
            <th></th>
        </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>
</div>

<script>
    // context path động (chuẩn JSP)
    var BASE_URL = "<%=request.getContextPath()%>";

    var ctrl = {
        setForm(employee){
            document.getElementById("id").value = employee.id;
            document.getElementById("name").value = employee.name;
            document.getElementById("salary").value = employee.salary;
            if(employee.gender){
                document.getElementById("male").checked = true;
            } else {
                document.getElementById("female").checked = true;
            }
        },

        getForm(){
            return {
                id: document.getElementById("id").value,
                name: document.getElementById("name").value,
                gender: document.getElementById("male").checked,
                salary: parseFloat(document.getElementById("salary").value)
            }
        },

        fillToTable(employees){
            if(!employees || employees.length === 0){
                document.getElementById("list").innerHTML = "";
                return;
            }

            var rows = employees.map(e => `
        <tr>
            <td>${e.id}</td>
            <td>${e.name}</td>
            <td>${e.gender ? 'Male' : 'Female'}</td>
            <td>${e.salary}</td>
            <td>
                <a href="javascript:ctrl.edit('${e.id}')">Edit</a>
            </td>
        </tr>
    `);

            document.getElementById("list").innerHTML = rows.join("");
        },

        loadAll(){
            fetch("http://localhost:8080/Lab7_war_exploded/employees")
                .then(resp => resp.json())
                .then(data => {
                    console.log("RAW DATA:", data);

                    // ÉP VỀ ARRAY DÙ NÓ LÀ CÁI GÌ
                    var arr = Array.isArray(data) ? data : Object.values(data);
                    this.fillToTable(arr);
                });
        },
        create(){
            fetch(BASE_URL + "/employees", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(this.getForm())
            }).then(() => {
                this.loadAll();
                this.reset();
            });
        },

        update(){
            var data = this.getForm();
            fetch(BASE_URL + "/employees/" + data.id, {
                method: "PUT",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(data)
            }).then(() => this.loadAll());
        },

        delete(){
            var id = document.getElementById("id").value;
            fetch(BASE_URL + "/employees/" + id, {
                method: "DELETE"
            }).then(() => {
                this.loadAll();
                this.reset();
            });
        },

        reset(){
            this.setForm({id:"", name:"", salary:0, gender:true});
        },

        edit(id){
            fetch(BASE_URL + "/employees/" + id)
                .then(resp => resp.json())
                .then(emp => this.setForm(emp));
        }
    }

    ctrl.loadAll();
</script>

</body>
</html>

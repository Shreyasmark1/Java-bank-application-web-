<%--
    Document   : index
    Created on : 11 Oct, 2022, 3:48:51 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>Hello, world!</title>
        <style>
            .card{

                left: 48%;
                width: 48%
            }
            .button{

            }
            @media (max-width:700px){
                .card {
                    left: -3%;
                    width: 100%;

                }
            }

        </style>
    </head>
    <body>

        <nav class="navbar navbar-dark bg-primary shadow p-3 mb-5">
            <span class="navbar-brand mb-0 h1">BANK APPLICATION</span>
        </nav>
        <div class="card justify-items-center px-3 py-3 mx-3 my-3 ml-3 shadow p-3 mb-5 bg-white rounded" >
            <form action="LoginServlet" method="post">
                <div> <h1 class="text-center">USER LOGIN</h1></div>
                <br>
                <br>
                <div class="form-group">
                    <label>Enter Phone number :</label>
                    <input type="number" class="form-control"  name="phoneNumber" required min="100000000" max="999999999">
                </div>
                <div class="form-group">
                    <label >Enter your Password :</label>
                    <input type="password" class="form-control" name="password" required minlength="5">
                </div>
                <div>
                    <center> <label class="form-control-plaintext my-1 text-danger" type="text" readonly id="status">"Wrong Credentials"</label></center>
                </div>
                <input type="submit" class="btn btn-primary btn-block" role="button" value="login" id="logbutton" onclick="myfun();"><br>
            </form>
            <a href="register.jsp" class="btn btn-primary btn-block " role="button">Register</a><br>
        </div>
        <% String s = (String) request.getAttribute("state");%>
        <script>

            var value =<%=s%>
            console.log(value);

            var temp = "fail";
            if (value === temp) {
                document.getElementById("status").style.display = 'block';
            } else {
                document.getElementById("status").style.display = 'none';
            }

        </script>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


    </body>
</html>

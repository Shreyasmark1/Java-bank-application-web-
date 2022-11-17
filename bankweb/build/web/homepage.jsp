<%--
    Document   : homepage
    Created on : 12 Oct, 2022, 12:50:16 PM
    Author     : User
--%>

<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>Hello, world!</title>
        <style>
            .button{

                color: white;
                border-color: white;
                background-color: deepskyblue;
            }
            .button:hover{
                background-color: white;
                color: deepskyblue;
                border-color: black;
                text-decoration: none;


            }


            @media (max-width:900px){
                .nav .option{
                    display: none;
                }
            }
            .mybutton



        </style>

    </head>
    <body>
        <%Object ss = session.getAttribute("status");
            if (ss == null) {
                response.sendRedirect("index.jsp");
            }
        %>

        <div id="nav-placeholder">
            <script src="//code.jquery.com/jquery.min.js"></script>
            <script>
                $.get("nav.html", function (data) {
                    $("#nav-placeholder").replaceWith(data);
                });
            </script>
        </div>
        <nav class="nav col-2 flex-column d-none d-sm-block p-1 rounded mx-3 text-center shadow border border-primary ">
            <button type="button" class="button btn-lg btn-block d-none d-sm-block d-md-block border rounded-lg my-4 option" id="home" >Home</button>
            <button type="button" class="button btn-lg btn-block d-none d-sm-block d-md-block border rounded-lg my-4 option" data-toggle="modal" data-target="#deposit">Deposit</button>
            <button type="button" class="button btn-lg btn-block d-none d-sm-block d-md-block border rounded-lg my-4 option" data-toggle="modal" data-target="#withdraw">Withdraw</button>
            <button type="button" class="button btn-lg btn-block d-none d-sm-block d-md-block border rounded-lg my-4 option" data-toggle="modal" data-target="#display">Display</button>
            <a href="index.jsp"><button type="button" class="button btn-lg btn-block d-none d-sm-block d-md-block border rounded-lg my-4 option" id="exit" >Logout</button></a>
        </nav>

        <!---deposit model--->
        <div class="modal fade" id="deposit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">DEPOSITING AMOUNT</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="deposite">
                            <div class="form-group">
                                <label> Enter the amount you want to deposit</label>
                                <input type="number" class="form-control" name="depositeamount" min="1" required>
                            </div>
                            <div class="form-group">
                                <div class="dropdown form-group">
                                    <select class="btn btn-secondary dropdown-toggle" type="button" name="acc">
                                        <%ArrayList<Integer> acc = (ArrayList<Integer>) session.getAttribute("data");
                                            if (acc != null) {
                                                for (int s : acc) {%>
                                        <option class="dropdown-item" value=<%=s%>><%=s%></option>
                                        <%}
                                            }%>
                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Click to Deposit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!------------deposit modal------->
        <!------------withdraw modal------>
        <div class="modal fade" id="withdraw" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">WITHDRAWING AMOUNT</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="widthdrawservlet">
                            <div class="form-group">
                                <label> Enter the amount you want to withdraw</label>
                                <input type="number" class="form-control" name="depositeamount" min="1" required>
                            </div>
                            <div class="form-group">
                                <div class="dropdown">
                                    <select class="btn btn-secondary dropdown-toggle" type="button" name="acc">

                                        <%
                                            if (acc != null) {
                                                for (int s : acc) {%>
                                        <option class="dropdown-item" value=<%=s%>><%=s%></option>
                                        <%}
                                            }%>

                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Click to Withdraw</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!---------withdraw modal------->


        <!------------display modal------>
        <div class="modal fade" id="display" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">DISPLAY</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="display">
                            <div class="form-group">
                                <label> select account to display </label>
                            </div>
                            <div class="form-group">
                                <div class="dropdown">
                                    <select class="btn btn-secondary dropdown-toggle" type="button" name="acc">
                                        <%
                                            if (acc != null) {
                                                for (int s : acc) {%>
                                        <option class="dropdown-item" value=<%=s%>><%=s%></option>
                                        <%}
                                            }%>

                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary" id="mybtn123">Click to display</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!---------display modal------->


        <!------------- result----------------------------------->
        <div>
            <%Object amount = request.getAttribute("amount");%>
            <%Object message = request.getAttribute("message");%>

        </div>
        <script>

            var m = "<%=message%>";
            if (m != 'null') {
                window.alert(m);

            }
            var s = "<%=amount%>";
            if (s != 'null') {
                window.alert("your account balance is : " + s);
            }

        </script>




        <!------------- result----------------------------------->





        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>

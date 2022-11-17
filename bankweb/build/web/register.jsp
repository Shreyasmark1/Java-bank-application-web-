
<%@page contentType="text/html" pageEncoding="UTF-8"%><!doctype html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>Hello, world!</title>
        <style>
            .card{

                left: 48%;
                width: 48%;

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

        
 <!-------------------------------------------------modal---------------------------------------------------------->
 
 
 
 
        
        
        
        
        
        
        
        
<!------------------------------------------------------ form ----------------------------------------------->
        <form class="card justify-items-center px-3 py-3 mx-3 my-3 shadow p-3 mb-5 bg-white rounded" action="Registration" method="post" id="myForm" name="form1" >
            <div> <h1 class="text-center">CREATING ACCOUNT</h1></div>

            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" id="name" size="20" required>
            </div>
            <div class="form-group">
                <label>Phone number</label>
                <input type="number" class="form-control" min="100000000" max="999999999" name="phone" required>
            </div>
            <div class="form-group">
                <label>Create a Password</label>
                <input type="password" class="form-control" name="password" minlength="5" required size="10">
            </div>
            <div class="form-group">
                <label>Initial deposit amount</label>
                <input type="number" class="form-control" min="500" id="amount" name="initamount" size="10" required>
                <small id="emailHelp" class="form-text text-muted">Initial deposit should be more than 500 </small>
            </div> 

            <input type="submit" class="btn btn-primary btn-block " role="button" value="Register"  id="newid" onclick="return validate();"><br>
        </form>
 <!-------------------------------------------------------form------------------------------------------------------------------->
      
 
 
 
 
 
 
 <script>
            
           function validate()
  {
      var name = document.getElementById("name");
   var letters = /^[A-Za-z]+$/;
   if(!name.value.match(letters))
     {
      alert("Please enter a valid name");
      return false;
     }
     return true;
  }        
        </script>
        
        
        <script>
            
            
            
            
        </script>




        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


    </body>
</html>
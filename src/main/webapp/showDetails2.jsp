<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.Collection,
                 java.util.ArrayList"%>
  <%@ page import="com.Anurag.demo.dto.*" %>
   <%@ page import="com.Anurag.demo.dto.*,com.Anurag.demo.dao.*" %>
  <%@ page session="true" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<title>Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>
    .margin-div{
      text-align: center;
    }

    body{
     color:white;
    }




</style>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="box-shadow:  5px 5px 25px lightblue;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <h4  class="text-primary" style="margin:20px;">COMPLETE ANALYSIS</h4>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
         <!-- ---------------- -->
        </li>
      </ul>
      <form class="d-flex" action="AdminLogOut">
        <button class="btn btn-outline-primary" type="submit">Logout</button>
      </form>
    </div>
  </div>
</nav>
 <div style="width:1200px;height:500px;margin:100px auto;margin-bottom:0px;overflow: auto;box-shadow: 5px 5px 25px lightgrey;">
 
<div id="printthis" style="padding:20px;">

   <table class="table table table-bordered text-center" style="color:black;" id="myTable">
            
                 <thead>
				    <tr>
				    <th scope="col">Teller Id</th>
				      <th scope="col">Teller Name</th>
				      <th scope="col">Customers</th>
				      <th scope="col">Amount</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
					AdminMasterRepo repo=(AdminMasterRepo)session.getAttribute("repo");
				    String lid=(String)session.getAttribute("lid");
				  ArrayList<TellerPerformance> pricelist1=repo.getTellersPerformance(lid);
				  for(TellerPerformance i:pricelist1){				  
				  %>
				             <tr>
				             <td scope="row"><%=i.getTid() %></td>
				             <td><%=i.getTname() %></td>
						      <td><%=i.getCustomers()%></td>
						      <td><%=i.getAmount() %></td>
						      </tr>
				  <%} %>
				  
				  </tbody>
				  </table>


</div>

 
 </div>        
       <table class="table  table-striped table-bordered" style="color:black;width:1200px;margin:100px auto;margin-top:0px;">
    <tbody>
       <%
       String getMoney=repo.getTotalMoneyEarned(lid);
       String totalCustomers=repo.getTotalCustomers(lid);
       %>
       				        <tr>
				             <th scope="row" ><%="Total Customer Count : "+totalCustomers%></th>
				             <th><%="Total Money Earned : "+getMoney %></th>
						    </tr>
    </tbody>
   </table>
   <!--  ---------------- -->
        
              <div class="row g-3 justify-content-center">
 
 <div class="col-md-3">
 
       <form action="AdminLoginBack">
        <div class=" margin-div">
          <button type="submit" class="btn btn-primary" style="font-weight: bolder;">Back</button>
        </div>
        </form>
 </div>
 <div class="col-md-2">
         <button class="btn btn-primary" onClick="printPage('printthis')" style="text-decoration:none; cursor: pointer;font-weight: bolder;">Print</button>
 </div>
  <div class="col-md-2">
     <form action="showDetails2Excel">
         <button type="submit" id="ExcelSubmit" class="btn btn-primary"  style="text-decoration:none; cursor: pointer;font-weight: bolder;">Generate Excel Sheet</button>
 </form>
  </div>
 
 </div>
 
        <script type="text/javascript">
      function printPage(printthis){
         var backup=document.body.innerHTML;
         var divContent=document.getElementById(printthis).innerHTML;

         document.body.innerHTML=divContent;
         document.body.style.margin="100px auto";

         window.print();
         document.body.innerHTML=backup;
         document.body.style.margin="0px 0px";      
      }
      </script>
           <script type="text/javascript" src="http://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript">
      $(document).ready( function () {
    $('#myTable').DataTable({
       "bProcessing": true,
    "sAutoWidth": false,
    "bDestroy":true,
    "sPaginationType": "bootstrap", // full_numbers
    "iDisplayStart ": 10,
    "iDisplayLength": 10,
    "bPaginate": false,
    "bFilter": true, 
    "bInfo": false, 
    });
    
} );
      </script>
</body>
</html>
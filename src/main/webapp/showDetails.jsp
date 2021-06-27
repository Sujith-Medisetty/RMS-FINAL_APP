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

.modify{

width:1200px;
height:500px;
margin:100px auto;
overflow: auto;
box-shadow: 5px 5px 25px lightgrey;

}


</style>
</head>
<body>

 <div class="modify">
 
<div id="printthis" style="padding:20px;">

 <table class="table table-striped table-bordered" style="color:black;" id="myTable">
  <thead>
    <tr>
      <th scope="col">Teller Id</th>
      <th scope="col">Teller Name</th>
      <th scope="col">Teller Phno</th>
      <th scope="col">Total Customers</th>
      <th scope="col">Total Customers</th>
    </tr>
  </thead>
  <tbody>
   <% 
   ArrayList<AdminAnalysisDetails> details=(ArrayList)session.getAttribute("details");
      for(AdminAnalysisDetails i:details){
   %>
       <tr>
      <th scope="row"><%=i.getTid() %></th>
      <td><%=i.getTname() %></td>
      <td><%=i.getTphno() %></td>
      <td><%=i.getCustomers() %></td>
      <td><%=i.getAmount()%></td>
    </tr>
    <%} %>

  </tbody>
</table>

</div>
 
 </div>        
        
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
   <form action="showDetailsExcel">
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
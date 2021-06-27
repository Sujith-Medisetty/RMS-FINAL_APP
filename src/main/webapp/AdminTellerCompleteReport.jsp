<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Collection,
                 java.util.ArrayList"%>
  <%@ page import="com.Anurag.demo.dto.*" %>
  <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>A-C-Teller-Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

    body{
     color:black;
    }
    
     .margin-div{
      text-align: center;
    }

.modify{

width:95%;
height:500px;
margin:100px auto;
overflow: auto;
box-shadow: 5px 5px 25px lightgrey;
margin-bottom:20px;
}


</style>
</head>
<body>

<nav class="navbar navbar-light bg-light"  style="box-shadow:  5px 5px 25px lightblue;">
  <div class="container-fluid">
    <h4  class="text-primary" style="margin:20px;">TELLER REPORT</h4>
  </div>
</nav>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader ("Expires", "0"); //prevents caching at the proxy server

%>


 <div class="modify" >
 
 
<div id="printthis2" style="padding:20px;">

 <table class="table table-striped table-bordered " style="color:black;" id="myTable">
  <thead>
    <tr>
      <th scope="col">Teller Id</th>
      <th scope="col">Teller Name</th>
      <th scope="col">Teller Phno</th>
      <th scope="col">Customer ID</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Customer Phno</th>
      <th scope="col">Job Name</th>
      <th scope="col">Job Price</th>
      <th scope="col">Discount</th>
      <th scope="col">GST</th>
      <th scope="col">Amount</th>
      <th scope="col">Location Name</th>
      <th scope="col">Location Phno</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
   <% 
      ArrayList<AllResponse> objects=(ArrayList)session.getAttribute("allDetails");
      for(AllResponse i:objects){
   %>
      <tr style=" vertical-align: middle;">
      <td  scope="row" ><%=i.getTid() %></td>
      <td ><%=i.getTname() %></td>
      <td ><%=i.getTpno() %></td>
       <td><%=i.getCid() %></td>
      <td ><%=i.getCname() %></td>
      <td><%=i.getCpno() %></td>
      <td><% for(String j : i.getJobname().split(",")){ %>
    	      <span><%=j %></span><br>   
    	  <% }%></td>
      <td><%=i.getJobprice() %></td>
      <td><%=i.getDiscount()+"%" %></td>
      <td><%=i.getGst()+"%" %></td>
      <td><%=i.getAmount() %></td>
      <td><%=i.getLname() %></td>
      <td><%=i.getLpno() %></td>
      <td><%=i.getDate() %></td>
    </tr>
    <%} %>

  </tbody>
</table>

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
      
              <div class="row g-3 justify-content-center" style="margin-bottom:30px;">
  <div class="col-md-3"></div>
 <div class="col-md-2">
 
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
 <form action="ExcelAdminCompleteReport">
         <button type="submit" id="ExcelSubmit" class="btn btn-primary"  style="text-decoration:none; cursor: pointer;font-weight: bolder;">Generate Excel Sheet</button>
 </form>
 </div>

  <div class="col-md-3"></div>
 
 </div>
      
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
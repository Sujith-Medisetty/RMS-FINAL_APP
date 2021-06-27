<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.Collection,
                 java.util.ArrayList"%>
  <%@ page import="com.Anurag.demo.dto.*,com.Anurag.demo.dao.*" %>
  <%@ page session="true" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<title>T-Teller-Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  
        <script type="text/javascript" src="http://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
  
    <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>

.dataTables_wrapper .dataTables_filter {
    float: right;
    text-align: right;
    padding-bottom: 20px;
}

    .margin-div{
      text-align: center;
    }

    body{
     color:white;
    }

.modify{

width:95%;
height:600px;
margin:100px auto;
overflow: auto;
box-shadow: 5px 5px 25px lightgrey;
padding:40px;
margin-bottom:0px;
margin-top:5px;
}


</style>
</head>
<body>

<nav class="navbar navbar-expand-lg" style="box-shadow: 5px 5px 25px lightblue;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <h4 class="text-primary" style="margin:10px;">TELLER REPORT</h4>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
         <!-- ---------------- -->
        </li>
      </ul>
    </div>
  </div>
</nav>


 <div class="modify">
 
<div id="printthis" style="padding:10px;">

 <table class="table table-striped table-bordered" style="color:black;padding:10px;" id="myTable" >
  <thead>
    <tr>
    <th scope="col">Customer Id</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Customer Phno</th>
      <th scope="col">Job Name</th>
      <th scope="col">Job Price</th>
      <th scope="col">Payment Mode</th>
      <th scope="col">Discount</th>
      <th scope="col">GST</th>
      <th scope="col">Amount</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
   <% 
   TellerMasterRepo repo=(TellerMasterRepo)session.getAttribute("repo");
   int totalCustomers=0;
   int totalMoney=0;
      ArrayList<Teller2Response> dates=(ArrayList)session.getAttribute("TellerReportDates");
      for(Teller2Response i:dates){
    	  totalCustomers=totalCustomers+1;
    	  totalMoney=totalMoney+Integer.parseInt(i.getAmount());
   %>
       <tr style=" vertical-align: middle;">
       <td scope="row"><%=i.getCid() %></td>
      <td scope="row"><%=i.getCname() %></td>
      <td><%=i.getCpno() %></td>
      <td><% for(String j : i.getJobname().split(",")){ %>
    	      <span><%=j %></span><br>   
    	  <% }%></td>
      <td><%=i.getJobprice() %></td>
      <td><%=i.getPaymentMode() %></td>
      <td><%=i.getDiscount()+"%" %></td>
      <td><%=i.getGst()+"%" %></td>
      <td><%=i.getAmount() %></td>
      <td><%=i.getDate() %></td>
    </tr>
    <%} %>

  </tbody>
</table>

</div>
 
<%--  <table class="table table-striped table-bordered" style="color:black;padding:10px;" id="myTable21" >
     <tr style="color:black;width:95%;margin:100px auto;margin-top:0px;margin-bottom:20px;border:none;">
      <th scope="row" ><%="Total Customer Count : "+totalCustomers%></th>

      <th ><%="Total Money Earned : "+totalMoney %></th>

      
      <th></th>
   </tr>
   </table> --%>
 
 </div>
        <table class="table  table-striped table-bordered" style="color:black;width:95%;margin:100px auto;margin-top:0px;margin-bottom:20px;">
    <tbody>
       				        <tr>
				             <th scope="row" ><%="Total Customer Count : "+totalCustomers%></th>
				             <th><%="Total Money Earned : "+totalMoney %></th>
						    </tr>
    </tbody>
   </table>        
        
              <div class="row g-3 justify-content-center" style="margin-bottom:30px;">
  <div class="col-md-3"></div>
 <div class="col-md-2">
 
       <form action="GoBack">
        <div class=" margin-div">
          <button type="submit" class="btn btn-primary" style="font-weight: bolder;">Back</button>
        </div>
        </form>
 </div>
 <div class="col-md-2">
         <button class="btn btn-primary" onClick="printPage('printthis')" style="text-decoration:none; cursor: pointer;font-weight: bolder;">Print</button>
 </div>
   <div class="col-md-2">
 <form action="TellerReportExcel">
         <button type="submit" id="ExcelSubmit" class="btn btn-primary"  style="text-decoration:none; cursor: pointer;font-weight: bolder;">Generate Excel Sheet</button>
 </form>
 </div>

  <div class="col-md-3"></div>
 
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
  <script type="text/javascript">
  $(document).ready(function() {
 
    toastr.options.timeOut = 1500; // 1.5s
    toastr.info('TellerReport');
    $('#ExcelSubmit').click(function() {
       toastr.success('Excel file Created Successfully');
    },
    );
  });
  </script>
</body>
</html>
<%@page import="org.springframework.stereotype.Repository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="java.util.Collection,
                 java.util.ArrayList,
                 java.util.List"                 
                 %>
  <%@ page import="com.Anurag.demo.dto.*,com.Anurag.demo.dao.*" %>
  <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Bill-Generation</title>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

 <style>
    .margin-div{
      text-align: center;
    }
     body{
    color:black;
    }
    .one{
      width: 60%;
      height: 75%;
      margin:100px auto;
      margin-bottom:20px;
    }
    .margin-div{
      text-align: center;
    }
    button{
      color:black;
      margin:16px;
      padding: 15px;
    }
  .theme{
    color:black	;
    font-size: 25px;
  }
  .out-space{
    margin: 65px;
  }
  .in-space{
    margin:15px;
  }

  .flex-container {
    display: flex;
    justify-content:space-between;
}

.card-header{
background-color: silver;
}

.card-footer{
background-color: silver;
} 
 
 </style>

</head>
<body>
<%-- <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader ("Expires", "0"); //prevents caching at the proxy server

%> --%>

<div class="one" id="printthis">

 <div style="width:60%;margin:100px auto;margin-bottom:30px;box-shadow: 5px 5px 25px lightgray;padding:30px;padding-top:10px;">
  <ul class="nav justify-content-center" style="width:100%; margin-bottom:20px;">
    <li class="nav-item">
    <img alt="not found" src="https://tse3.mm.bing.net/th?id=OIP.ZoHdkfa27CnPxypMVfpGIQAAAA&pid=Api&P=0&w=300&h=100"/>
    </li>
    
  </ul>
    <table class="table table-borderless">
        <thead>
            <tr>
                <td scope="col">Date</td>
                <td scope="col">:</td>
                <td scope="col" ><%=session.getAttribute("date")%></td>
              </tr>
          <tr>
            <td scope="col">Customer Name</td>
            <td scope="col">:</td>
            <td scope="col" ><%=session.getAttribute("cname") %></td>
          </tr>
          <tr>
            <td scope="col">Customer Phno</td>
            <td scope="col">:</td>
            <td scope="col"><%=session.getAttribute("cpno") %></td>
          </tr>
          <tr>
            <td scope="col">Teller Name</td>
            <td scope="col">:</td>
            <td scope="col"><%=session.getAttribute("tname") %></td>
          </tr>
          <tr>
            <td scope="col">Location Name</td>
            <td scope="col">:</td>
            <td scope="col"><%=session.getAttribute("lname") %></td>
          </tr>
          <tr>
            <td scope="col">Branch Ph.no</td>
            <td scope="col">:</td>
            <td scope="col"><%=session.getAttribute("lpno") %></td>
          </tr>
         </thead>
    </table>
    <table class="table  table-border text-center">
        <thead>
          <tr>
            <td scope="col">SNO</td>
            <td scope="col">Service</td>
            <td scope="col">Job Price</td>
          </tr>
        </thead>
        <tbody>
                <%
        TellerMasterRepo repo=(TellerMasterRepo)session.getAttribute("repo");
        ArrayList<String> servicesProvided=(ArrayList)session.getAttribute("servicesProvided");
        int j=1;
        int total=0;
        int discount;
        Object disc=session.getAttribute("discount") ;
        int disk=(int)disc;
        if(disk!=0){
        	discount=disk;
        }else{
        	discount=disk;
        }
       
    	System.out.println("discount is "+discount);
    	
        for(String i:servicesProvided){
        	String jobname=repo.getJobName(i);
        	int jobprice=repo.getJobPrice(i);
        	int amount=jobprice;
        	total=total+amount;
        %>
          <tr>
            <td scope="row"><%=j %></td>
            <td style="font-weight:600;color:#FF000088;"><%=jobname%></td>
            <td><%=jobprice %></td>
          </tr>
          <%
        j=j+1;  
        }
        int amount=total-(discount*total/100);
        int gsttax=(int)session.getAttribute("gst");
        int gstamount;
        if(gsttax==0){
        	gstamount=(int)(amount);
        }else{
          gstamount=(int)(amount+((gsttax*amount)/100));	
        }
        
        %>   
        
        
         <% String u1 = request.getParameter("paymentmode").toString(); %>
             
        <tr  style="border:none;"><td></td><td>Total</td><td><%=total%></td></tr>
        <tr><td></td><td>Discount</td><td><%=discount+"%"%></td></tr>
        <tr style="border:none;"><td></td><td>Amount </td><td><%= amount%></td></tr>
         <tr><td></td><td>GST</td><td><%=gsttax+"%"%></td></tr>
         <tr><td></td><td>Payment Mode</td><td><%=u1%></td></tr>
          <tr><td></td><td>Payable Amount</td><td><%=gstamount%></td></tr>
          
        </tbody>    
      </table>
      <div>
          <div style="margin-top:40px;text-align: center;">Thank you visit again</div>
      </div>
</div>

    </div>

<div class="row g-3 justify-content-center">
<div class="col-md-4"></div>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.Collection,
                 java.util.ArrayList,
                 java.util.List"                 
                 %>
  <%@ page import="com.Anurag.demo.dto.*,com.Anurag.demo.dao.*" %>
  <%@ page session="true" %>
    
<!DOCTYPE html>
<html lang="en">
<head>  
<title>Admin-Dashboard</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  
  
  
  <style>
   .modify{
height:300px;
margin:0px auto;
overflow: auto;
color:white;
margin-top:3px;

}

         .red{
         box-shadow:  2px 2px 5px lightslategrey;
         padding:15px;
         }

    .blue{
    margin-top:15px;
    margin-bottom:15px;
    box-shadow:  2px 2px 5px lightslategrey;
    padding:15px;
    }

    body{
    color:black;
    }
    .one{
      width: 95%;
      height: 75%;
      margin:50px auto;
      box-shadow: 5px 5px 25px lightgrey;
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
    color:black;
    font-size: 25px;
  }
  .out-space{
    margin: 65px;
  }
  .in-space{
    margin:15px;
  }
  </style>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin-Login</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</head>
<body>
  
      <%
      AdminMasterRepo repo=(AdminMasterRepo)session.getAttribute("repo");
    String aid=(String)session.getAttribute("aid");
    String location_lid=(String)session.getAttribute("location_lid");
    ArrayList<AdminDetails> adminDetails=repo.getAdminDetails(aid);
    System.out.println("admin is "+aid);
    String getMoney=repo.getTotalMoneyEarned(location_lid);
    String totalCustomers=repo.getTotalCustomers(location_lid);
    ArrayList<LocationResponse> location=repo.getMapIdToLocation(adminDetails.get(0).getLocation_lid());
    String location2=location.get(0).getLname();
    
    %>
  
<nav class="navbar navbar-expand-lg" style="box-shadow:  5px 5px 25px lightblue;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" style="display:flex;justify-content:space-between;" id="navbarTogglerDemo01">
         <table  class="" style="text-align:center;vertical-align : middle;">
      <tr class="text-primary"><td  scope="col"  rowspan="2"><div class="bg-primary" style="color:white;width:50px;height:50px; padding-top:6px;border-radius:35px;vertical-align : middle;text-align:center;font-size: 25px;font-weight: bolder;"><%=adminDetails.get(0).getAname().toUpperCase().charAt(0) %></div></td><td></td><td style="font-weight: bolder;"><%=adminDetails.get(0).getAname().toUpperCase() %></td></tr>
        <tr class="text-primary"><td></td><td style="font-weight: bolder;"><%=location2.toUpperCase()%></td></tr>
      </table>
      
    <div class="nav-item" style="padding-bottom: 4px;margin-right:3	0px;">
    <img alt="not found" src="https://tse3.mm.bing.net/th?id=OIP.ZoHdkfa27CnPxypMVfpGIQAAAA&pid=Api&P=0&w=300&h=100"/>
    </div>
      
     

      <form class="d-flex" action="AdminLogOut">
        <button class="btn btn-outline-primary" type="submit">Logout</button>
      </form>
    </div>
  </div>
</nav>


 <div class="margin-div">  
  <h4  class="text-primary " style="margin:20px;">ADMIN DASHBOARD</h4>
  </div>
  
<div class="one">
  <ul class="nav nav-tabs nav-pills mb-3" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#a" type="button" role="tab" aria-controls="a" aria-selected="true">Teller Report</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#b" type="button" role="tab" aria-controls="b" aria-selected="false">Add Teller</button>
    </li>
     <li class="nav-item" role="presentation">
      <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#d" type="button" role="tab" aria-controls="d" aria-selected="false">Analysis</button>
    </li>
         <li class="nav-item" role="presentation">
      <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#c" type="button" role="tab" aria-controls="c" aria-selected="false">Login Details</button>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">

     <!-- Teller Report form -->

    <div class="tab-pane fade show active out-space" id="a" role="tabpanel" aria-labelledby="a-tab">
    
     <form class="row g-3 justify-content-center" action="AdminTellerReport" onsubmit="return validate2()">
      
               <div  class="row g-3  justify-content-center" >
                 <div class="col-md-6">
            <div class="form-check form-switch">
              <input class="form-check-input num1" type="checkbox" id="flexSwitchCheckChecked3" checked  onclick="func1()">
              <label class="form-check-label" for="flexSwitchCheckChecked3">Teller Name</label>
            </div>
          </div>
                     <div class="col-md-6">
             <select class="form-select  unique1" aria-label="Default select example" name="tellerid" required>
            <option selected disabled value="">Select Teller</option>
           <%      
          
           String lid=(String)session.getAttribute("location");
           ArrayList<DropDownTellerList> dropDownTellerList=repo.getDropDownTellerList(lid);
              for(DropDownTellerList i:dropDownTellerList){
           %>
           <option value=<%=i.getTid() %>><%=i.getTid()+" <--> "+i.getTname() %></option>
           <%} %>
          </select>
      </div>
         
         </div>
         
         
                     <div  class="row g-3  justify-content-center">
           <div class="col-md-6">
            <div class="form-check form-switch">
              <input class="form-check-input num2" type="checkbox" id="flexSwitchCheckChecked4" checked  onclick="func2()" >
              <label class="form-check-label " for="flexSwitchCheckChecked4">Select Dates</label>
            </div>
          </div>

           <div class="col-md-6"></div>

         <div class="form-group col-md-6"> <!-- Date input -->
          <label class="control-label" for="date">From</label>
          <input class="form-control target  unique2" id="date1" name="date1" placeholder="MM/DD/YYY" type="text" required/>
        </div>
       
    
       
        <div class="form-group col-md-6"> <!-- Date input -->
          <label class="control-label" for="date">To</label>
          <input class="form-control target  unique2" id="date2" name="date2" placeholder="MM/DD/YYY" type="text" required />
        </div>
            
            </div>
         
                 <div  class=" margin-div text-danger">
        <span id="displayVal"></span>
        </div>
      
      <div class=" margin-div" style="margin-bottom:30px; ">
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </div>
     </form>
     
                   <script>
                function func1(){
              if ($(".num1").is(":checked")) {
                 $(".unique1").removeAttr("disabled");
              }
              else {
                $(".unique1").attr("disabled", true);
             }}

             function func2(){
              if ($(".num2").is(":checked")) {
                 $(".unique2").removeAttr("disabled");
              }
              else {
                $(".unique2").attr("disabled", true);
             }}

 
      </script>         
            
            <hr>
       <form action="AdminTellerCompleteReport">
        <div class=" margin-div" style="margin-bottom:30px; ">
        <button type="submit" class="btn btn-primary">Generate Complete Report</button>
      </div>
      </form>

    </div>
    

<!-- Add Teller form -->

    <div class="tab-pane fade  out-space" id="b" role="tabpanel" aria-labelledby="b-tab">
    
    
    <form class="row g-3 needs-validation" action="AdminAddTeller">
  <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Id</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="ID" name="tid" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Name</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="NAME" name="tname" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Phno</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="PHONE" name="tpno" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Pass</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="PASSWORD" name="tpass" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Location</label>
            <select class="form-select second" aria-label="Default select example" id="validationCustom01" name="location_lid" required>
            <option selected disabled value="">Select Location</option>
            <%
            ArrayList<LocationResponse> objects123=repo.getLocationList();
             for(LocationResponse i:objects123){
            %>
            <option value=<%=i.getLid() %>><%=i.getLname() %></option>
            <%} %>
          </select>

  </div>
  
  
        <div class=" margin-div">
        <button type="submit" class="btn btn-primary">ADD TELLER</button>
      </div>
  </form>
  
           
    </div>
    
    <!-- --------------------------------------------------------------- -->
    <div class="tab-pane fade  out-space" id="c" role="tabpanel" aria-labelledby="c-tab">
    

    <div class="row g-3   justify-content-center" style="margin:20px;">
        <div class="col-md-4 ">
           <table class="table" style="color:black;">
           <tr><td scope="col">Admin Id </td><td><%=adminDetails.get(0).getAid() %></td></tr>
           <tr><td scope="col">Admin Name </td><td><%=adminDetails.get(0).getAname() %></td></tr>
           <tr><td scope="col">Admin Phno </td><td><%=adminDetails.get(0).getApno()%></td></tr>
           <tr><td scope="col">Admin Location </td><td><%=location2.toUpperCase()%></td></tr>
           <tr><td scope="col">Admin Password </td><td><%=adminDetails.get(0).getApass()%></td></tr> 
           </table>
        </div>
    </div>
           <div class="margin-div">
         <button id="anchor" class="btn btn-primary" style="cursor: pointer;" onclick="shifting()">UPDATE PASSWORD</button>
         </div>
        
             <form action="update1" onsubmit="return vali()">
     <div class="row g-3 justify-content-center yes" style="margin-bottom:20px; display:none;">
     
        <div class="col-md-6 form-group">
        <input class="form-control" type="password" placeholder="New Password" aria-label="default input example" name="new1" required id="new98">
        <span class="text-danger" id="new987"></span>
      </div>
      
       <div class="col-md-6 form-group">
        <input class="form-control" type="password" placeholder="Confirm Password" aria-label="default input example" name="confirm" required id="confirm98">
        <span class="text-danger" id="confirm"></span>
      </div>
      
      <div class="col-md-6 form-group">
         
      </div>
         <div class=" margin-div">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
     </div>
     </form>
    </div>
    
    <script type="text/javascript">

function vali(){

var one98=document.getElementById("new98").value;
var two98=document.getElementById("confirm98").value;
var span987=document.getElementById("new987");

if(one98!=two98){
span987.innerHTML="Both are not equal...!";
return false;
}
return true;

}
</script>
    
<script type="text/javascript">

function shifting(){
$('.yes').toggle();
}

</script>   
       <!-- -------------------------------------------------- -->
    
     <div class="tab-pane fade  out-space" id="d" role="tabpanel" aria-labelledby="d-tab" style="padding:30px; padding-top:3px;">
 
    
<!--     -------------------------------------------- -->
     
  
        <form action="showDetails" onsubmit="return validate3()">
        
        
       <!--  ------------------------------------ -->

<!--         <div  class="row g-3  justify-content-center" style="margin-top:0; margin-bottom:50px;">
         <div class="col-md-6">  
	   <div class="form-group">
	     <label for="selectBox" style="padding-bottom:10px;">Analysis</label>
	     <select required class="form-select"  id="selectBox"  aria-label="Default select example" name="serviceType"  onchange="changeFunc();" required>
		     <option selected value="totalsummary">Total Summary</option>
		     <option  value="tellerwisereport">TellerWise Report</option>
	     </select>		    
	   </div>
      </div>
        
        </div> -->

       
       
         <div  class="row g-3  justify-content-center  info-box1" >
                 <div class="col-md-6 one111">
            <div class="form-check form-switch">
              <input class="form-check-input id1 final" type="checkbox" id="flexSwitchCheckChecked1" checked  onclick="check1()">
              <label class="form-check-label " for="flexSwitchCheckChecked1">Teller Name</label>
            </div>
          </div>
                     <div class="col-md-6 one111">
             <select class="form-select first final" aria-label="Default select example" name="tid" required>
            <option selected disabled value="">Select Teller</option>
           <%      
              for(DropDownTellerList i:dropDownTellerList){
           %>
           <option value=<%=i.getTid() %>><%=i.getTid()+" <--> "+i.getTname() %></option>
           <%} %>
          </select>
      </div>
         
         </div>
         

          
         
          
            <div  class="row g-3  justify-content-center info-box2">
           <div class="col-md-6 one111">
            <div class="form-check form-switch">
              <input class="form-check-input id2 final" type="checkbox" id="flexSwitchCheckChecked2" checked  onclick="check2()" >
              <label class="form-check-label " for="flexSwitchCheckChecked2">Select Dates</label>
            </div>
          </div>

           <div class="col-md-6 one111 "></div>

         <div class="form-group col-md-6 one111"> <!-- Date input -->
          <label class="control-label" for="date">From</label>
          <input class="form-control target second final" id="date3" name="date1" placeholder="MM/DD/YYY" type="text" required/>
        </div>
       
    
       
        <div class="form-group col-md-6 one111"> <!-- Date input -->
          <label class="control-label" for="date">To</label>
          <input class="form-control target second	final" id="date4" name="date2" placeholder="MM/DD/YYY" type="text" required />
        </div>
            
            </div>
      
  
            <script>
                function check1(){
              if ($(".id1").is(":checked")) {
                 $(".first").removeAttr("disabled");
              }
              else {
                $(".first").attr("disabled", true);
             }}

             function check2(){
              if ($(".id2").is(":checked")) {
                 $(".second").removeAttr("disabled");
              }
              else {
                $(".second").attr("disabled", true);
             }}

 
      </script>
  
       <div  class=" margin-div text-danger">
        <span id="displayVal2"></span>
        </div>
  
        <div class="margin-div" style="margin-bottom:20px;">
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </div>
   
      </form>
      <hr>
      <form action="showDetails2">
       <div class="margin-div" style="margin-bottom:20px;">
        <button type="submit" class="btn btn-primary">Generate Complete Analysis</button>
      </div>
   
      </form>
      


   
   
      
        
        
       <!-- -------------------------------------------------- -->
<!--        <form action="showDetails">
         <div  class="row g-3  justify-content-center" style="margin-top:0;">
        <div class="form-group col-md-6 two223"> Date input
          <label class="control-label" for="date">From</label>
          <input class="form-control target two222" id="date" name="date1" placeholder="MM/DD/YYY" type="text" required/>
        </div>

        <div class="form-group col-md-6 two223"> Date input
          <label class="control-label" for="date">To</label>
          <input class="form-control target two222" id="date" name="date2" placeholder="MM/DD/YYY" type="text" required/>
        </div>

        <div class=" margin-div two223">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        </div>
      </form>   --> 
     
     
     
  <!--   ------------------------------------------------------ --> 
     
     
        </div>


<!-- --------------- -->



  </div>
  </div>
         
       <script type="text/javascript">
             function changeFunc(){
           var selectBox = document.getElementById("selectBox");
           var val = selectBox.options[selectBox.selectedIndex].value;
           if(val=='totalsummary'){
             console.log("entered");
             
                 $('.info-box2').removeClass('red');   
    			 $('.info-box1').removeClass('blue');  
               $('.final').attr("disabled", true);
              $(".two222").removeAttr("disabled");
                $('.one111').css('display','none');
              $('.two223').css('display','initial');  
             
           }else{
           
                $('.final').removeAttr("disabled");
                 
                 $('.info-box2').addClass('red');   
    			 $('.info-box1').addClass('blue');  
                 
                $('.one111').css('display','initial');
                $(".two222").attr("disabled", true);
                 $('.two223').css('display','none');
           }
           }
       </script>
  <script>
  $(document).ready(function(){
    var date_input=$('.target'); //our date input has the name "date"
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    var options={
      format: 'yyyy-mm-dd',
      container: container,
      todayHighlight: true,
      autoclose: true,
    };
    date_input.datepicker(options);
  })
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
       <script type="text/javascript">
       
      var date11=new Date();
      var month=date11.getMonth()+1;
      var date12=date11.getDate();
      month=month+"";
      date12=date12+"";
      while(month.length < 2){
        month = "0" + month;
      }
      while(date12.length < 2){
        date11 = "0" + date11;
      }
      console.log(month);
      var finalDate=date11.getFullYear()+'-'+(month)+'-'+date12;
       console.log(finalDate);

       
       function validate2(){
       
       console.log("entered");
              
       var date1=document.getElementById("date1").value;
       var date2=document.getElementById("date2").value;
       console.log(date1+"  "+date2);

       var displayVal=document.getElementById("displayVal");
       
       var x = new Date(date1);
       var y = new Date(date2);
       var z = new Date(finalDate);

  
       if(x>y){
       displayVal.innerHTML="From Date cannot be greater than To Date";
       return false;
       }else if(x>z || y>z){
       displayVal.innerHTML="From Date or To Date cannot be greater than Today ";
       return false;
       }else{
       displayVal.innerHTML="";
       }
       


       return true;
       }
       
       
              
       function validate3(){
       
       console.log("entered");
              
       var date1=document.getElementById("date3").value;
       var date2=document.getElementById("date4").value;
       console.log(date1+"  "+date2);

       var displayVal=document.getElementById("displayVal2");
       
       var x = new Date(date1);
       var y = new Date(date2);
       var z = new Date(finalDate);

  
       if(x>y){
       displayVal.innerHTML="From Date cannot be greater than To Date";
       return false;
       }else if(x>z || y>z){
       displayVal.innerHTML="From Date or To Date cannot be greater than Today ";
       return false;
       }else{
       displayVal.innerHTML="";
       }
       


       return true;
       }
       
       </script>

</body>
</html>
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
<title>SuperUser-Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  
 
  <style>
      .margin-div{
      text-align: center;
    }
    
    .space{
    padding:20px;
    }
    
    body{
     
     color:black;
     
    }
    .one{
      width: 90%;
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
  
  .modify{
height:280px;
margin:40px auto;
overflow: auto;
color:black;
margin-top:3px;

}

.size1{
height:250px;
overflow:auto;
color:black;
}
  </style>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</head>

<body>
         
         <%
         SuperUserRepo repo=(SuperUserRepo)session.getAttribute("repo");
         ArrayList<SuperUserDetails> superDetails1=repo.getSuperUserDetails();
         %>
         

<nav class="navbar navbar-expand-lg" style="box-shadow: 5px 5px 25px lightblue;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" style="display:flex;justify-content:space-between;" id="navbarTogglerDemo01">
    
             <table  class="" style="text-align:center;vertical-align : middle;">
      <tr class="text-primary"><td  scope="col"  rowspan="2"><div class="bg-primary" style="color:white;width:50px;height:50px; padding-top:6px;border-radius:35px;vertical-align : middle;text-align:center;font-size: 25px;font-weight: bolder;"><%=superDetails1.get(0).getSname().toUpperCase().charAt(0) %></div></td><td></td><td style="font-weight: bolder;"><%=superDetails1.get(0).getSname().toUpperCase() %></td></tr>
      <tr><td></td><td></td><td></td></tr>
      </table>
    
    <div class="nav-item" style="padding-bottom: 4px;margin-right:3	0px;">
    <img alt="not found" src="https://tse3.mm.bing.net/th?id=OIP.ZoHdkfa27CnPxypMVfpGIQAAAA&pid=Api&P=0&w=300&h=100"/>
    </div>

      <form class="d-flex" action="SuperUserLogOut">
        <button class="btn btn-outline-primary" type="submit">Logout</button>
      </form>
    </div>
  </div>
</nav>
  
  <div class="margin-div">
  <h4 class="text-primary" style="margin:20px;">SUPER-USER DASHBOARD</h4>
  </div>
  
  
  
<div class="one">
<ul class="nav nav-tabs nav-pills mb-3" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#a" type="button" role="tab" aria-controls="home" aria-selected="true">Teller Report</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#b" type="button" role="tab" aria-controls="profile" aria-selected="false">Add User</button>
    </li>

        <li class="nav-item" role="presentation">
      <button class="nav-link" id="d-tab" data-bs-toggle="tab" data-bs-target="#d" type="button" role="tab" aria-controls="d" aria-selected="false">Add Location</button>
    </li>
        <li class="nav-item" role="presentation">
      <button class="nav-link" id="h-tab" data-bs-toggle="tab" data-bs-target="#e" type="button" role="tab" aria-controls="e" aria-selected="false">Users & Location Details</button>
    </li>

                <li class="nav-item" role="presentation">
      <button class="nav-link" id="h-tab" data-bs-toggle="tab" data-bs-target="#g" type="button" role="tab" aria-controls="g" aria-selected="false">Analysis</button>
    </li>
    
            <li class="nav-item" role="presentation">
      <button class="nav-link" id="h-tab" data-bs-toggle="tab" data-bs-target="#f" type="button" role="tab" aria-controls="f" aria-selected="false">Details</button>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">

    <!-- -------------------- -->

    <div class="tab-pane fade show active out-space" id="a" role="tabpanel" aria-labelledby="home-tab">
<form action="SuperUserTellerReport" class="row g-3" onsubmit="return validate2()">

        <div class="col-md-6">
            <div class="form-check form-switch">
              <input class="form-check-input id1" type="checkbox" id="flexSwitchCheckChecked2" checked  onclick="check1()">
              <label class="form-check-label " for="flexSwitchCheckChecked2">Teller Name</label>
            </div>
          </div>

      <div class="col-md-6">
             <select class="form-select first" aria-label="Default select example" name="tellerid" required>
            <option selected disabled value="">Select Teller</option>
           <% 
           ArrayList<DropDownTellerList> dropDownTellerList=repo.getDropDownTellerList();
     
              for(DropDownTellerList i:dropDownTellerList){
           %>
           <option value=<%=i.getTid() %>><%=i.getTid()+" <--> "+i.getTname() %></option>
           <%} %>
          </select>
      </div>

      <div class="col-md-6">
        <div class="form-check form-switch">
          <input class="form-check-input id2" type="checkbox" id="flexSwitchCheckChecked1" checked  onclick="check2()">
          <label class="form-check-label" for="flexSwitchCheckChecked1">Teller Location</label>
        </div>
      </div>

      <div class="col-md-6">
        <select class="form-select second" aria-label="Default select example" name="location" required>
            <option selected disabled value="">Select Location</option>
            <%List<String> list2=(List<String>)session.getAttribute("responses3");
        	  ArrayList<LocationResponse> res=repo.getLocationList();
             for(LocationResponse i:res){
            %>
            <option value=<%=i.getLid() %>><%=i.getLname() %></option>
            <%} %>
          </select>
      </div>
      
                           <div  class="row g-3  justify-content-center">
           <div class="col-md-6">
            <div class="form-check form-switch">
              <input class="form-check-input num2" type="checkbox" id="flexSwitchCheckChecked4" checked  onclick="func1()" >
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
      
            <div class=" margin-div" style="margin-bottom:25px;">
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </div>
    </form>
    <hr>
           <form action="superuserTellerCompleteReport">
        <div class=" margin-div" style="margin-bottom:30px; ">
        <button type="submit" class="btn btn-primary">Generate Complete Report</button>
      </div>
      </form>
    
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
             
            function func1(){
              if ($(".num2").is(":checked")) {
                 $(".unique2").removeAttr("disabled");
              }
              else {
                $(".unique2").attr("disabled", true);
             }}

 
      </script>
      <!-- ----------------------------------------------------------------------------------------------------------------------------------- -->
    
    
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
    
    


<!-- -------------------- -->

    


    <div class="tab-pane fade  out-space" id="b" role="tabpanel" aria-labelledby="profile-tab">
    
    
            <div class="row g-3  justify-content-center" >
       <div class="col-md-6">
          <select class="form-select first" aria-label="Default select example" name="tellerid"  onchange="changeFunc123456();" id="box123456" required>
            <option selected value="addTeller">Add Teller</option>
            <option value="addAdmin">Add Admin</option>
          </select>
      </div>
      </div>
    
          <script type="text/javascript">
      
      function changeFunc123456(){
           var selectBox = document.getElementById("box123456");
           var val = selectBox.options[selectBox.selectedIndex].value;
           
           if(val=="addTeller"){
           
           $("#addTellerDisp").css('display','initial');
            $(".aad").attr("disabled", true);
             $(".atd").attr("disabled", false);
           $("#addAdminDisp").css('display','none');
          
           
           }else {
           
           $("#addAdminDisp").css('display','initial');
            $(".atd").attr("disabled", true);
             $(".aad").attr("disabled", false);
           $("#addTellerDisp").css('display','none');
           
           
           }      
           
      }
      
      </script>
    
    
    <form class="row g-3 needs-validation" action="SuperUserAddTeller" id="addTellerDisp">
     <div class="row g-3 " >
  <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Id</label>
    <input type="text" class="form-control atd" id="validationCustom01" placeholder="ID" name="tid" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Name</label>
    <input type="text" class="form-control atd" id="validationCustom01" placeholder="NAME" name="tname" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Phno</label>
    <input type="text" class="form-control atd" id="validationCustom01" placeholder="PHONE" name="tpno" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Teller Pass</label>
    <input type="text" class="form-control atd" id="validationCustom01" placeholder="PASSWORD" name="tpass" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Location</label>
            <select class="form-select second atd" aria-label="Default select example" id="validationCustom01" name="location_lid" required>
            <option selected disabled value="">Select Location</option>
            <%
            ArrayList<LocationResponse> objects123=(ArrayList)session.getAttribute("responses4");
             for(LocationResponse i:objects123){
            %>
            <option value=<%=i.getLid() %>><%=i.getLname() %></option>
            <%} %>
          </select>

  </div>
  
  
        <div class=" margin-div">
        <button type="submit" class="btn btn-primary">ADD TELLER</button>
      </div>
      </div>
  </form>
  
  <!-- ------------------------- -->
  
            <form class="row g-3 needs-validation" action="SuperUserAddAdmin" id="addAdminDisp" style="display:none;">
  
  <div class="row g-3 " >
  
  <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Admin Id</label>
    <input type="text" class="form-control aad" id="validationCustom01" placeholder="ID" name="aid" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Admin Name</label>
    <input type="text" class="form-control aad" id="validationCustom01" placeholder="NAME" name="aname" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Admin Phno</label>
    <input type="text" class="form-control aad" id="validationCustom01" placeholder="PHONE" name="apno" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Admin Pass</label>
    <input type="text" class="form-control aad" id="validationCustom01" placeholder="PASSWORD" name="apass" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Location</label>
            <select class="form-select second aad" aria-label="Default select example" id="validationCustom01" name="location_lid" required>
            <option selected disabled value="">Select Location</option>
            <%
             for(LocationResponse i:objects123){
            %>
            <option value=<%=i.getLid() %>><%=i.getLname() %></option>
            <%} %>
          </select>

  </div>
  

        <div class=" margin-div">
        <button type="submit" class="btn btn-primary">ADD ADMIN</button>
      </div>
      </div>
  </form>   
  
           
    </div>
   
   <!-- -----------------------------------------AddAdmin------------------------------------------------------------------ -->

    <!-- -----------------------------------------AddLocation-------------------------------------------------------- -->
    
  <div class="tab-pane fade  out-space" id="d" role="tabpanel" aria-labelledby="d-tab">  
     
   <form class="row g-3 needs-validation" action="SuperUserAddLocation">
   
     <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Location Id</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="ID" name="lid" required>
    
    </div>
    
    
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Location Name</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="NAME" name="lname" required>

  </div>
  
    <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Location Phno</label>
    <input type="text" class="form-control" id="validationCustom01" placeholder="Phno" name="lpno" required>

  </div>
  
     <div class=" margin-div">
        <button type="submit" class="btn btn-primary">ADD LOCATION</button>
      </div>
   
   </form>
  
  </div>
    
  
  <!-- ---------------------------------------------SuperUserCompleteReport--------------------------------------------------------------- -->
  
      <div class="tab-pane fade  out-space" id="e" role="tabpanel" aria-labelledby="h-tab" style="padding-bottom:30px;">
      
<!--       DropDownTellerList
      getLocationList
      getAdminList -->
      
        <div class="row g-3  justify-content-center" style="margin-bottom:70px;" >
       <div class="col-md-6">
          <select class="form-select first" aria-label="Default select example" name="tellerid"  onchange="changeFunc1234();" id="box" required>
            <option selected value="Tellers">View Tellers</option>
            <option value="Admins">View Admins</option>
            <option value="Locations">View Locations</option>
          </select>
      </div>
      </div>
      
      <script type="text/javascript">
      
      function changeFunc1234(){
           var selectBox = document.getElementById("box");
           var val = selectBox.options[selectBox.selectedIndex].value;
           
           if(val=="Tellers"){
           $("#div1").css('display','initial');
           $("#div2").css('display','none');
           $("#div3").css('display','none');
           }else if(val=="Admins"){
           $("#div2").css('display','initial');
           $("#div1").css('display','none');
           $("#div3").css('display','none');
           }else{
           $("#div3").css('display','initial');
           $("#div1").css('display','none');
           $("#div2").css('display','none');
           }      
           
      }
      
      </script>
      
    <div class="row g-3  justify-content-center">
 
         <div class="col-md-6 "    id="div3" style="display:none">
           
           <div style="height:250px;overflow: auto;">
           
            <table class="table table-bordered myTable" style="color:black;" >
  <thead>
    <tr>
      <th scope="col">Location Id</th>
      <th scope="col">Location Name</th>
      <th scope="col">Location Phno</th>
    </tr>
  </thead>
  <tbody>
  
<%
ArrayList<LocationResponse> locations=repo.getLocationList();
for(LocationResponse i:locations){
%>
       <tr>
      <th scope="row"><%=i.getLid()%></th>
      <td><%=i.getLname() %></td>
      <td><%=i.getLpno() %></td>
      </tr>
<%}%>
  </tbody>
  </table>
           
           </div>
           
           
      </div>  
    </div>
    
    
        <div class="row g-3   justify-content-center">
        
               <div class="col-md-6"  id="div2" style="display:none">
           
           <div style="height:250px;overflow: auto">
           
           <table class="table table-bordered myTable" style="color:black;">
  <thead>
    <tr>
      <th scope="col">Admin Id</th>
      <th scope="col">Admin Name</th>
      <th scope="col">Admin Phno</th>
      <th scope="col">Admin Location</th>
    </tr>
  </thead>
  <tbody>
  
<%
ArrayList<DropDownAdminList> admins=repo.getDropDownAdminList();
for(DropDownAdminList i:admins){
%>
       <tr>
      <th scope="row"><%=i.getAid()%></th>
      <td><%=i.getAname() %></td>
      <td><%=i.getApno() %></td>
      <td><%=i.getLocation_lid() %></td>
      </tr>
<%}%>
  </tbody>
  </table>
           
           </div>
      </div> 
    </div>
         

      <div class="row g-3  justify-content-center" >
         <div class="col-md-6 " id="div1">
             <div style="height:250px;overflow: auto;">
           
            <table class="table table-bordered myTable" style="color:black;">
            
                 <thead>
				    <tr>
				      <th scope="col">Teller Id</th>
				      <th scope="col">Teller Name</th>
				      <th scope="col">Teller Phno</th>
				      <th scope="col">Teller Location</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				       <%
						ArrayList<TellerAndLocationResponse> tellers=repo.getTellerAndLocation();
						for(TellerAndLocationResponse i:tellers){
						%>
						       <tr>
						      <th scope="row"><%=i.getTid()%></th>
						      <td><%=i.getTname() %></td>
						      <td><%=i.getTpno() %></td>
						      <td><%=i.getLname() %></td>
						      </tr>
						<%}%>
				  
				  </tbody>
            
            </table>
            
            </div>
          </div>
      </div>
    </div>
    
    <!-- ------------------------------------------------------------------------------------------------------------------------ -->
    
     <div class="tab-pane fade  out-space" id="f" role="tabpanel" aria-labelledby="f-tab">
          
            <div class="row g-3 justify-content-center" style="">
            
         <div class="col-md-4 ">
         
        
         
         <%
         ArrayList<SuperUserDetails> superDetails=repo.getSuperUserDetails();
         %>
        
           <table class="table table-bordered" style="color:black;">
           <tr><td scope="col">Id </td><td><%=superDetails.get(0).getSid() %></td></tr>
           <tr><td scope="col">Name </td><td><%=superDetails.get(0).getSname() %></td></tr>
           <tr><td scope="col">Phno </td><td><%=superDetails.get(0).getSpno()%></td></tr>
           <tr><td scope="col">Password </td><td><%=superDetails.get(0).getSpass()%></td></tr>
           </table>
         <div class="margin-div">
         <button id="anchor" class="btn btn-primary" style="cursor: pointer;" onclick="shifting()">UPDATE PASSWORD</button>
         </div>
         </div>           
     </div>
          <form action="update2" onsubmit="return  vali()">
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

<!-- ------------------------ -->
    
        <div class="tab-pane fade out-space" id="g" role="tabpanel" aria-labelledby="home-tab">
        
        <form action="SuperUserTellerAnalysis" class="row g-3" onsubmit="return validate3()">

        <div class="col-md-6">
            <div class="form-check form-switch">
              <input class="form-check-input u1" type="checkbox" id="flexSwitchCheckChecked22" checked  onclick="checking1()">
              <label class="form-check-label " for="flexSwitchCheckChecked22">Teller Name</label>
            </div>
          </div>

      <div class="col-md-6">
             <select class="form-select first1" aria-label="Default select example" name="tellerid" required>
            <option selected disabled value="">Select Teller</option>
           <%      
              for(DropDownTellerList i:dropDownTellerList){
           %>
           <option value=<%=i.getTid() %>><%=i.getTid()+" <--> "+i.getTname() %></option>
           <%} %>
          </select>
      </div>

      <div class="col-md-6">
        <div class="form-check form-switch">
          <input class="form-check-input u2" type="checkbox" id="flexSwitchCheckChecked11" checked  onclick="checking2()">
          <label class="form-check-label" for="flexSwitchCheckChecked11">Teller Location</label>
        </div>
      </div>

      <div class="col-md-6">
        <select class="form-select second2" aria-label="Default select example" name="location" required>
            <option selected disabled value="">Select Location</option>
            <%
            for(LocationResponse i:res){
           %>
           <option value=<%=i.getLid() %>><%=i.getLname() %></option>
           <%} %>
          </select>
      </div>
      
                           <div  class="row g-3  justify-content-center">
           <div class="col-md-6">
            <div class="form-check form-switch">
              <input class="form-check-input numval2" type="checkbox" id="flexSwitchCheckChecked444" checked  onclick="func11()" >
              <label class="form-check-label " for="flexSwitchCheckChecked444">Select Dates</label>
            </div>
          </div>

           <div class="col-md-6"></div>

         <div class="form-group col-md-6"> <!-- Date input -->
          <label class="control-label" for="date">From</label>
          <input class="form-control target  unique22" id="date3" name="date1" placeholder="MM/DD/YYY" type="text" required/>
        </div>
       
    
       
        <div class="form-group col-md-6"> <!-- Date input -->
          <label class="control-label" for="date">To</label>
          <input class="form-control target  unique22" id="date4" name="date2" placeholder="MM/DD/YYY" type="text" required />
        </div>
            
            </div>
             <div  class=" margin-div text-danger">
        <span id="displayVal2"></span>
        </div>
      
            <div class=" margin-div" style="margin-bottom:25px;">
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </div>
    </form>
    
    <hr>
        
              <form action="superuserTellerCompleteAnalysis">
       <div class="margin-div" style="margin-bottom:20px;">
        <button type="submit" class="btn btn-primary">Generate Complete Analysis</button>
      </div>
   
      </form>
        
        </div>
              <script>
                function checking1(){
              if ($(".u1").is(":checked")) {
                 $(".first1").removeAttr("disabled");
              }
              else {
                $(".first1").attr("disabled", true);
             }}

             function checking2(){
              if ($(".u2").is(":checked")) {
                 $(".second2").removeAttr("disabled");
              }
              else {
                $(".second2").attr("disabled", true);
             }}
             
            function func11(){
              if ($(".numval2").is(":checked")) {
                 $(".unique22").removeAttr("disabled");
              }
              else {
                $(".unique22").attr("disabled", true);
             }}

 
      </script>
    
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
    $('.myTable').DataTable({
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
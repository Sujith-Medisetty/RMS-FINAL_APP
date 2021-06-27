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
<title>Teller-Dashboard</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <style>
    body{
    color:black;
    }
    .one{
      width: 60%;
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
    color:liblue;
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

#one11 option{
margin:3px;
}

.disp2{
display:none;
}

#two11 option{
margin:3px;
}

  .textstyle{
  color:black;
  }
  </style>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</head>
<body>

           <%
           String tid=(String)session.getAttribute("tid");
           TellerMasterRepo repo=(TellerMasterRepo)session.getAttribute("repo");
           ArrayList<TellerDetails> tellerDetails=repo.getTellerDetails(tid);
           AdminMasterRepo repo2=(AdminMasterRepo)session.getAttribute("repo2");
           String location_lid=(String)session.getAttribute("location_lid");
           String location2=repo2.getMapIdToLocation(location_lid).get(0).getLname();
           %>


<nav class="navbar navbar-expand-lg" style="box-shadow: 5px 5px 25px lightblue;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" style="display:flex;justify-content:space-between;" id="navbarTogglerDemo01">
    
     <table  class="" style="text-align:center;vertical-align : middle;">
      <tr class="text-primary"><td  scope="col"  rowspan="2"><div class="bg-primary" style="color:white;width:50px;height:50px; padding-top:6px;border-radius:35px;vertical-align : middle;text-align:center;font-size: 25px;font-weight: bolder;"><%=tellerDetails.get(0).getTname().toUpperCase().charAt(0) %></div></td><td></td><td style="font-weight: bolder;"><%=tellerDetails.get(0).getTname().toUpperCase() %></td></tr>
        <tr class="text-primary"><td></td><td style="font-weight: bolder;"><%=location2.toUpperCase()%></td></tr>
      </table>
       
    <div class="nav-item" style="padding-bottom: 4px;margin-right:3	0px;">
    <img alt="not found" src="https://tse3.mm.bing.net/th?id=OIP.ZoHdkfa27CnPxypMVfpGIQAAAA&pid=Api&P=0&w=300&h=100"/>
    </div>
          
        <form class="d-flex" action="logout">
        <button class="btn btn-outline-primary" type="submit">Logout</button>
      </form>
    </div>
          
  </div>
</nav>

    <div class="margin-div">
    <h4  class="text-primary" style="margin:20px;">TELLER DASHBOARD</h4>
      </div>

<div class="one">
  <ul class="nav nav-tabs nav-pills mb-3" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active textstyle" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Bill</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link textstyle" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Report</button>
    </li>
        <li class="nav-item" role="presentation">
      <button class="nav-link textstyle" id="profile-tab" data-bs-toggle="tab" data-bs-target="#c" type="button" role="tab" aria-controls="profile" aria-selected="false">Login Details</button>
    </li>
  </ul>
 <div class="tab-content" id="myTabContent">

     <!------------------------------------ Bill---------------------------------------- -->

    <div class="tab-pane fade show active out-space" id="home" role="tabpanel" aria-labelledby="home-tab">
    
    <form action="TellerBill" class="row g-3" onsubmit="return validate()">
    
       <div class="col-md-6 form-group">
        <input class="form-control " type="text" placeholder="Customer Name" aria-label="default input example" name="cname" required id="name">
        <span class="text-danger" id="cname"></span>
      </div>

      <div class="col-md-6">
        <input class="form-control" type="text" placeholder="Customer Mobile Number" aria-label="default input example" name="cpno" required id="pno">
        <span class="text-danger" id="cpno"></span>
      </div>
    
     <div class="col-md-12"></div>

     <div class="col-md-6">  
	   <div class="form-group">
	     <label for="selectBox" style="padding-bottom:10px;">ServiceType</label>
	     <select required class="form-select"  id="selectBox"  aria-label="Default select example" name="serviceType"  onchange="changeFunc();" required>
		     <option selected value="package">Package</option>
		     <option value="individual">Individual Job</option>
	     </select>		    
	   </div>
     </div>


<script type="text/javascript">

function validate(){

console.log("entered");

var username=document.getElementById("name").value;
var cname=document.getElementById("cname");


var pno=document.getElementById("pno").value;
var cpno=document.getElementById("cpno");

if(username.trim()==""){
cname.innerHTML="No Blank Values Allowed";
return false;
}else if(/^[A-Za-z ]{2,20}/g.test(username.trim()) && username.trim().length<=20 ){
cname.innerHTML="";
}else{
cname.innerHTML="Invalid Name or name should be between 2 to 20 charecters";
return false;
}

if(pno.trim()==""){
cpno.innerHTML="No Blank Values Allowed";
return false;
}else if(/^[1-9][0-9]{9}/.test(pno.trim()) && pno.length==10){
cpno.innerHTML="";
}else{
cpno.innerHTML="Invalid Number";
return false;
}



return true;

}


</script>
    <script type="text/javascript">
      
      function changeFunc(){
           var selectBox = document.getElementById("selectBox");
           var val = selectBox.options[selectBox.selectedIndex].value;
           
           if(val=='package'){
                hideStudentChildren();
                $(".three").removeAttr("disabled");
                $(".four22").attr("disabled", true);
                $("#one11").attr("disabled", true);
                $("#two11").attr("disabled", true);
                $("#discount").attr("disabled", false);
                
                  $('.disp2').css('display','none');
                    $('.disp1').css('display','initial');
                $(".ind").attr("disabled",false);
           }else{
                hideStudentChildren2();
                $(".four22").removeAttr("disabled");
                $(".three").attr("disabled", true);
                $("#one").attr("disabled", true);
                $("#two").attr("disabled", true); 
                $("#discount").attr("disabled", true);  
                
                  $('.disp2').css('display','initial');
                    $('.disp1').css('display','none');
                 $(".ind").attr("disabled",false);

           }
      }
      
      
    </script>

    <div class="col-md-12"></div>
    
    <!-- --------------------------------- -->
    
    <div class="col-md-6 disp1" >
      <div class="form-check form-switch">
        <input class="form-check-input id1 three" type="checkbox" id="flexSwitchCheckChecked" checked  onclick="hideStudentChildren()">
        <label class="form-check-label" for="flexSwitchCheckChecked" >Customer Gender( MALE )</label>
      </div>
    </div>
    
    <script>
    function hideStudentChildren(){
        if ($(".id1").is(":checked")) 
        {
            $("#one").removeAttr("disabled");
            $("#two").attr("disabled", true);
        }
        else {
            $("#two").removeAttr("disabled");
            $("#one").attr("disabled", true);
        }
     }
    </script>
    
   <div class="col-md-6 disp1"></div>
  
   <div class="col-md-6 disp1" >
        <select required class="form-select" id="one" aria-label="Default select example" name="pack" required>
         <option selected disabled value="" style="font-weight:lighter;">Job Name</option>
          <option style="font-weight: bolder;" value=<%="JM01"%>>Fashion</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>

          <option style="font-weight: bolder;" value=<%="JM02"%>>Relax</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Head Massage</option>

          <option style="font-weight: bolder;" value=<%="JM03"%>>Hand Some</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Head Massage</option>

          <option style="font-weight: bolder;" value=<%="JM04"%>>Glossy Look</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Spa</option>

          <option style="font-weight: bolder;" value=<%="JM05"%>>Youth Ful</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Glowbal Hair colour</option>

          <option style="font-weight: bolder;" value=<%="JM06"%>>Natural Look</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>
          <option disabled >&nbsp;&nbsp;&nbsp;papaya Facial</option>


          <option style="font-weight: bolder;" value=<%="JM07"%>>Bridal Package</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Trimming</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Signature Facial</option>

        </select>
      </div>
    
     <div class="col-md-6 disp1">
        <select  required class="form-select" id="two" aria-label="Default select example" disabled=true name="pack" required>
          <option selected disabled value="">Job Name</option>

          <option style="font-weight: bolder;" value=<%="JF08"%>>Fashion</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threadding</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>

          <option style="font-weight: bolder;" value=<%="JF09"%>>Just Relax</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threadding</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Head Massage</option>

          <option style="font-weight: bolder;" value=<%="JF10"%>>Smooth Skin</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threadding</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Waxing Full Arms</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Waxing Half Legs</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>

          <option style="font-weight: bolder;" value=<%="JF11"%>>Silky & Shiney</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threadding</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Spa</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>



          <option style="font-weight: bolder;" value=<%="JF12"%>>Fruity Fresh</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threadding</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Color Root Touch Up</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Spa Pedicure</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Fruit Facial</option>

          <option style="font-weight: bolder;" value=<%="JF13"%>>Glow & Smooth</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair Cut</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threadding</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Waxing Full Arms</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Waxing Half Legs</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Under Arm Wax</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Signature Facial</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Face D-Tan</option>


          <option style="font-weight: bolder;" value=<%="JF14"%>>Beauty Queen</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Signature Facial</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Hair SPa</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Waxing Full Arms</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Waxing Half Legs</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Under Arm Wax</option>
          <option disabled >&nbsp;&nbsp;&nbsp;Full Face Threading</option>

        </select>
      </div>

     

    <!-- --------------------------------- -->
    
      
      <div class="col-md-6 disp2">
        <div class="form-check form-switch ">
          <input class="form-check-input id21 four22  dis2" type="checkbox" id="flexSwitchCheckChecked3" checked  onclick="hideStudentChildren2()" disabled>
          <label class="form-check-label" for="flexSwitchCheckChecked3">Customer Gender( MALE )</label>
        </div>
      </div>
      <script>
    function hideStudentChildren2(){
       if ($(".id21").is(":checked")) {
            $("#one11").removeAttr("disabled");
            $("#two11").attr("disabled", true);
       }
       else {
            $("#two11").removeAttr("disabled");
            $("#one11").attr("disabled", true);
       }
     }
      </script>
      
 
  <div class="col-md-6 disp2"></div>

  <div class="col-md-6 disp2" >
    <select required class="form-select dis2" id="one11" aria-label="Default select example" name="single" multiple required disabled>
     <option selected disabled style="font-weight:lighter; value="">Select Multiple Job Name  (MALE)</option>

        <option value="JM15">Hair Cut</option>
        <option value="JM16">Trimming</option>
        <option value="JM17">Face D-Tan</option>
        <option value="JM18">Head Massage</option>
        <option value="JM19">Hair Spa</option>
        <option value="JM20">Glowbal Hair Color</option>
        <option value="JM21">Papaya Facial</option>
        <option value="JM22">Glod Facial</option>

    </select>
  </div>
  
  <div class="col-md-6 disp2">
    <select  required class="form-select dis2" id="two11" aria-label="Default select example" disabled=true name="single" multiple required>
      <option selected disabled value="">Select Multiple Job Name  (FEMALE)</option>

      <option value="JF23">Hair Cut</option>
      <option value="JF24">Full Face Threading</option>
      <option value="JF25">Face D-Tan</option>
      <option value="JF26">Head Massage</option>
      <option value="JF27">Full Arm Waxing</option>
      <option value="JF28">Half Arm Waxing</option>
      <option value="JF29">Hair Spa</option>
      <option value="JF30">Root TouchUp Color</option>
      <option value="JF31">Under Arm Waxing</option>

      </select>
  </div>  
        
      <div class="col-md-6">
       <select class="form-select ind" id="discount" aria-label="Default select example" name="discount" required>
          <option selected disabled value="">Discount</option>
          <option value="0">0 %</option>
          <option value="5">5 %</option>
          <option value="10">10 %</option>
          <option value="15">15 %</option>
          <option value="20">20 %</option>
      </select>
      </div>
 <!-- --------------------------------- -->    
 
     <div class="col-md-6">  
	   <div class="form-group">
	     <select required class="form-select"  id="selectBox123"  aria-label="Default select example" name="gst" required>
		     <option selected value="18">GST</option>
		     <option value="0">NO GST</option>
	     </select>		    
	   </div>
     </div>
        
    <div class="col-md-6">  
	   <div class="form-group">
	     <select required class="form-select"  id="selectBox12345"  aria-label="Default select example" name="paymentmode"  onchange="changeFunc123();" required>
	     <option selected disabled value="">Payment Mode</option>
		     <option value="offline">Offline</option>
		     <option value="ppay">Online(Phone Pay)</option>
		     <option value="gpay">Online(GPay)</option>
	     </select>		    
	   </div>
     </div>
        
       <div class="col-md-6 form-group">
        <input class="form-control " id="gst123" type="text" placeholder="Enter Transaction Id" aria-label="default input example" name="transactionid" required disabled style="display:none;">
       </div>
 
<script type="text/javascript">
 
 function changeFunc123(){
            var selectBox = document.getElementById("selectBox12345");
           var val = selectBox.options[selectBox.selectedIndex].value;
           if(val=='ppay' || val=='gpay'){
           $('#gst123').attr("disabled", false);
            $('#gst123').css('display','initial');
           }else{
            $('#gst123').attr("disabled", true);
            $('#gst123').css('display','none');           
           }
 }
 
 </script> 
 
   <div class=" margin-div">
	 <button type="submit" class="btn btn-primary">Generate Bill</button>
   </div>
 
    </form>
   </div>
   
         <!-- -----------------------------------------Report------------------------------------------------------------------ -->
      
      
    <div class="tab-pane fade  out-space" id="profile" role="tabpanel" aria-labelledby="profile-tab">
      <form action="TellerReport" class="row g-3" onsubmit="return validate2()">

        <div class="form-group col-md-6"> <!-- Date input -->
          <label class="control-label" for="date">From</label>
          <input class="form-control target" name="date1" placeholder="MM/DD/YYY" type="text" required id="date1"/>
        </div>

        <div class="form-group col-md-6"> <!-- Date input -->
          <label class="control-label" for="date">To</label>
          <input class="form-control target"  name="date2" placeholder="MM/DD/YYY" type="text" required  id="date2"/>
        </div>
    
        <div  class=" margin-div text-danger">
        <span id="displayVal"></span>
        </div>
      
        <div class=" margin-div">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
    </div>
       

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
       
       </script>
       
       
       <!-- ---------------------------- -->  
       
              
           <div class="tab-pane fade out-space" id="c" role="tabpanel" aria-labelledby="home-tab">
           

     
            
           

<div style="">
	<div class="row g-3 justify-content-center" style="margin:20px;">
        <div class="col-md-8">
           <table class="table table-bordered" style="color:black;margin-bottom: 30px;">
           <tr><td scope="col">Teller Id </td><td><%=tellerDetails.get(0).getTid()%></td></tr>
           <tr><td scope="col">Teller Name </td><td><%=tellerDetails.get(0).getTname() %></td></tr>
           <tr><td scope="col">Teller Phno </td><td><%=tellerDetails.get(0).getTpno()%></td></tr>
           <tr><td scope="col">Teller Location </td><td><%=location2.toUpperCase()%></td></tr>
           <tr><td scope="col">Teller Password </td><td><%=tellerDetails.get(0).getTpass()%></td></tr>
           </table>
      
        </div>
        
         <div class="margin-div">
         <button id="anchor" class="btn btn-primary" style="cursor: pointer;" onclick="shifting()">UPDATE PASSWORD</button>
         </div>
        
    </div>				
 </div>
     
     <form action="update" onsubmit="return vali()">
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
<script>
function shifting(){
$('.yes').toggle();
}

</script>       
       
 </div>
</div>
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
</body>
</html>
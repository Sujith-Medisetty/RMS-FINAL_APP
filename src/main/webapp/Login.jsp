<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  <style>
    body{

         color:black;  
    }
    
    .one{
      width: 30%;
      height: 75%;
      margin:100px auto;
      box-shadow: 5px 5px 25px lightgrey;
    }
    .margin-div{
      text-align: center;
    }
    button{
      color:white;
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
  .textstyle{
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
  <ul class="nav justify-content-center" style="box-shadow: 5px 5px 25px lightblue;">
    <li class="nav-item" style="padding-bottom: 10px;margin-right:3	0px;">
    <img alt="not found" src="https://tse3.mm.bing.net/th?id=OIP.ZoHdkfa27CnPxypMVfpGIQAAAA&pid=Api&P=0&w=300&h=100"/>
    </li>
    
  </ul>
<div class="one" style="">

  <ul class="nav nav-tabs nav-pills mb-3" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active textstyle" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Teller</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link textstyle" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Admin</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link textstyle" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Super User</button>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">

     <!-- Teller login form -->

    <div class="tab-pane fade show active out-space" id="home" role="tabpanel" aria-labelledby="home-tab">
    <form action="TellerLogin">
      <input class="form-control in-space" type="text" placeholder="Teller Id" aria-label="default input example" name="tid" required>
      <input class="form-control in-space" type="password" placeholder="Password" aria-label="default input example" name="tpass" required>
      
      <div class=" margin-div">
        <button type="submit" class="btn btn-primary">Login</button>
      </div>
    </form>
    </div>

<!-- admin login form -->

    <div class="tab-pane fade  out-space" id="profile" role="tabpanel" aria-labelledby="profile-tab">
      <form action="AdminLogin">
        <input class="form-control in-space" type="text" placeholder="Admin Id" aria-label="default input example" name="aid" required>
        <input class="form-control in-space" type="password" placeholder="Password" aria-label="default input example" name="apass" required>
        <div class=" margin-div">
          <button type="submit" class="btn btn-primary">Login</button>
        </div>
      </form>
    </div>

<!-- super-user login form -->

    <div class="tab-pane fade out-space" id="contact" role="tabpanel" aria-labelledby="contact-tab">
      <form action="SuperUserLogin">
        <input class="form-control in-space" type="text" placeholder="super-user Id" aria-label="default input example" name="sid" required>
        <input class="form-control in-space" type="password" placeholder="Password" aria-label="default input example" name="spass" required>
        <div class=" margin-div">
          <button type="submit" class="btn btn-primary">Login</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
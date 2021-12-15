<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
<div class="mainContent">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home.do"><img src="logosAndGraphics/monkeyVector.png" class="img-fluid" alt="..." width="24" height="30"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Profile</a></li>
        <li><a href="#">Trending</a></li>
        <li><a href="#">Recent Messages</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><form class="form-inline my-2 my-lg-0">
      	<div class="search-design">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      	</div>
    </li>
    <li>
    <div class="select-padder">
    <select class="form-select form-select-sm" aria-label=".form-select-sm example">
  <option selected>Search by:</option>
    </div>
   <option value="All">All</option>
  <option value="Album">Album</option>
  <option value="Artist">Artist</option>
  <option value="Genre">Genre</option>
  <option value="Song">Song</option>
</select></li>
    </form>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Top Albums</a></p>
      <div class="spacer">
      <li><a href="#">Album 1</a></li>
      <li><a href="#">Album 2</a></li>
      <li><a href="#">Album 3</a></li>
      </div>
      <p><a href="#">Top Artists</a></p>
      <div class="spacer">
      <li><a href="#">Artist 1</a></li>
      <li><a href="#">Artist 2</a></li>
      <li><a href="#">Artist 3</a></li>
      </div>
      <p><a href="#">Top Songs</a></p>
      <li><a href="#">Song 1</a></li>
      <li><a href="#">Song 2</a></li>
      <li><a href="#">Song 3</a></li>
    </div>
    <div class="col-sm-8 text-left text-manipulator"> 
      <p>Music</p>
      <p>Just</p>
      <p>Got</p>
      <p>Better</p>
  <!--   </div>
  </div>
</div>
</div>

<footer class="container-fluid text-center page-footer">
  <div class="footer-contents"><a href="#">Subscribe</a></div>
</footer>

</body>
</html>
 -->
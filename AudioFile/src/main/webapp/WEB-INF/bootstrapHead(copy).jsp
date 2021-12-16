<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="css/main.css" />
</head>
<body>
	<div class="mainContent">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home.do"><img
						src="logosAndGraphics/monkeyVector.png" class="img-fluid"
						alt="..." width="24" height="30"></a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="profile">Profile</a></li>
						<li><a href="#">Trending</a></li>
						<li><a href="#">Recent Messages</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><form class="form-inline my-2 my-lg-0">
								<div class="search-design">
									<input class="form-control mr-sm-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-success my-2 my-sm-0"
										type="submit">Search</button>
								</div>
							</form></li>
						<c:choose>
							<c:when test="${ empty user}">
								<li><a href="login"><span
										class="glyphicon glyphicon-log-in"></span> Login</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="logout"><span
										class="glyphicon glyphicon-log-out"></span> Logout</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-2 sidenav">
					<p>
						<a href="#">Top Albums</a>
					</p>
					<div class="spacer">
						<li>Album 1</li>
						<li>Album 2</li>
						<li>Album 3</li>
					</div>
					<p>
						<a href="#">Top Artists</a>
					</p>
					<div class="spacer">
						<li>Artist 1</li>
						<li>Artist 2</li>
						<li>Artist 3</li>
					</div>
					<p>
						<a href="#">Top Songs</a>
					</p>
					<li>Song 1</li>
					<li>Song 2</li>
					<li>Song 3</li>
				</div>
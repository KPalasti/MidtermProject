<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<jsp:include page="bootstrapHead.jsp" />
<div class="row">
	<div class="container">

		<c:if test="${not empty artist.imageUrl}">
			<div class="col-xs-6 col-sm-7 col-md-6 col-lg-5 albumImage-div">

				<img class="artistImage-md" src="${artist.imageUrl}"
					alt="image of artist">
			</div>
		</c:if>

		<div class="col-xs-10 col-sm-6 col-md-4 col-lg-5 albumText">
			<h1 class="albumText-title">${artist.name }</h1>
			<br>
			<p>${artist.description }</p>
		</div>
	</div>
</div>

<div class="container-fluid">
	<%-- ------------------------------------------------
		Edit Button
	------------------------------------------------ --%>
	<div class="edit-entity-button">
		<c:if
			test="${not empty sessionScope.user && artist.user == sessionScope.user}">
			<form action="editArtist" method="GET">
				<input type="hidden" name="artistId" value="${artist.id}">
				<button type="submit" class="btn btn-warning table-btn">Edit
					Artist</button>
			</form>
		</c:if>
	</div>
</div>

<div class="table-responsive">
	<div class="table-wrapper table-body">
		<div class="table-title">
			<div class="row">
				<h2>Albums</h2>
			</div>
		</div>
		<table class="music-table table-hover">
			<c:forEach items="${artist.albums }" var="album">
				<tr>
					<td><a href="album.do?albumId=${album.id}"><img
							class="albumImage-sm" src="${album.imageURL }"
							alt="image of album"></a></td>
					<td><a href="album.do?albumId=${album.id}">${album.title }</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<div class="table-responsive">
	<div class="table-wrapper table-body">
		<div class="table-title">
			<div class="row">
				<h2>Songs</h2>
			</div>
		</div>
		<table class="music-table table-hover">
			<c:choose>
				<c:when test="${not empty artist.songs}">
					<thead>
						<tr>
							<th class="albumTable-songNumber">#</th>
							<th class="albumTable-songName">SONG</th>
							<th class="albumTable-artists">ARTIST(s)</th>
							<th class="albumTable-duration">LENGTH (seconds)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${artist.songs}" var="song" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td><a href="getSongId.do?songId=${song.id}">${song.name}</a>
								</td>
								<td><c:forEach items="${song.artists}" var="artist"
										varStatus="j">
										<c:choose>
											<c:when test="${j.index == 0}">
												<a class="albumTable-artistText"
													href="artistProfile?id=${artist.id}">${artist.name}</a>
											</c:when>
											<c:otherwise>
												<a class="albumTable-artistText"
													href="artistProfile?id=${artist.id}">,
													${artist.name}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach></td>
								<td>${song.durationInSeconds}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<td>No songs...</td>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>

<!-- need to add another table for albums in average ranking order
also may need to shrink the table to not take up the whole page
 !!!!!!BE SURE TO CHANGE THE CLASS NAME IN CSS AND COPY THIS ONE AND ALTER IT
      BECAUSE IF YOU CHANGE THIS CLASS IN CSS IT WILL AFFECT THE ALBUM PAGE!!!!!!!
-->
<jsp:include page="bootstrapFooter.jsp" />

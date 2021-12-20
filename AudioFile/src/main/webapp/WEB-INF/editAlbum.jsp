<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="fncust" %>


<jsp:include page="bootstrapHead.jsp" />

<jsp:include page="musicBetterHeader.jsp" />



<div class="container-fluid">
	<div class="table-responsive">
		<div class="table-wrapper table-body editing-table">

            <div class="table-title">
				<div class="row">
					<div>
						<c:choose>
							<c:when test="${editing}">
								<h2>
									Edit <b>Album</b>
								</h2>
							</c:when>
							<c:otherwise>
								<h2>
									Add <b>Album</b>
								</h2>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>


			<form action="editAlbum" method="POST">
				<c:if test="${editing}">
					<input type="hidden" name="albumId" value="${album.id}">
				</c:if>

				<table class="music-table table-hover">
					<tbody>

						<%-- ------------------------------------------------
							Album Title
						------------------------------------------------ --%>
						<tr>
							<td>
								<label for="name">Title:</label>
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-pencil"></i>
									</span>
                                    <c:choose>
                                        <c:when test="${editing}">
                                            <input type="text" value="${album.title}" class="form-control" name="title" placeholder="Title" value=""/>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control" name="title" placeholder="Title" value=""/>
                                        </c:otherwise>
                                    </c:choose>

								</div>
							</td>
						</tr>

						<%-- ------------------------------------------------
							Album Description
						------------------------------------------------ --%>
						<tr>
							<td>
								<label for="lyrics">Description:</label>
								<div class="input-group editing-table-textarea">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-pencil"></i>
									</span>
                                    <c:choose>
                                        <c:when test="${editing}">
                                            <textarea class="form-control" name="description" placeholder="Description...">${album.description}</textarea>
                                        </c:when>
                                        <c:otherwise>
                                            <textarea class="form-control" name="description" placeholder="Description..."></textarea>
                                        </c:otherwise>
                                    </c:choose>

								</div>
							</td>
						</tr>

						<%-- ------------------------------------------------
							Album Primary Artist
						------------------------------------------------ --%>
						<tr>
							<td>
								<label for="artist">Primary Artist:</label>

								<div class="input-group">
									<span class="input-group-addon">
								    	<i class="glyphicon glyphicon-user"></i>
								    </span>

									<select class="form-control" name="priamryArtistId">

										<c:forEach items="${artists }" var="artist">
											<c:choose>
												<c:when test="${editing && artist.id == album.artist.id}">
													<option value="${artist.id}" selected>${artist.name}</option>
												</c:when>
												<c:otherwise>
													<option value="${artist.id}">${artist.name}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>

									</select>
								</div>

							</td>
						</tr>

						<%-- ------------------------------------------------
							Album imageURL
						------------------------------------------------ --%>
						<tr>
							<td>
								<label for="image">Link To Image:</label>
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-pencil"></i>
									</span>
                                    <c:choose>
                                        <c:when test="${editing}">
                                            <input type="text" value="${album.imageURL}" class="form-control" name="imageURL" placeholder="Link..."/>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control" name="imageURL" placeholder="Link..."/>
                                        </c:otherwise>
                                    </c:choose>
								</div>
							</td>
						</tr>

						<%-- ------------------------------------------------
							Album Release Date
						------------------------------------------------ --%>
						<tr>
							<td>
								<label for="releaseDate">Release Date:</label>
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-calendar"></i>
									</span>
                                    <c:choose>
                                        <c:when test="${editing}">
                                            <input type="date" value="${album.releaseDate}" class="form-control" name="releaseDate" placeholder="MM/DD/YYYY"/>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="date" class="form-control" name="releaseDate" placeholder="MM/DD/YYYY"/>
                                        </c:otherwise>
                                    </c:choose>
								</div>
							</td>
						</tr>

						<%-- ------------------------------------------------
							Album Songs List
						------------------------------------------------ --%>
						<tr>
							<td>
                                <label for="songs">Songs:</label>
								<div class="editing-table-checkboxes">

                                    <c:forEach items="${songs }" var="song">
                                        <div>
                                            <c:choose>
                                                <c:when test="${not empty song && fncust:contains( album.songs, song)}">
                                                    <input type="checkbox" checked id="${song}" name="songIds" value="${song.id}">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="checkbox" id="${song}" name="songIds" value="${song.id}">
                                                </c:otherwise>
                                            </c:choose>
                                            <label for="${song}">${song.name}</label>
                                        </div>
                                    </c:forEach>

								</div>

							</td>
						</tr>

						<%-- ------------------------------------------------
							Album Genres List
						------------------------------------------------ --%>
						<tr>
							<td>
                                <label for="genres">Genres:</label>
								<div class="editing-table-checkboxes">

                                    <c:forEach items="${genres }" var="genre">
                                        <div>
                                            <c:choose>
                                                <c:when test="${editing && fncust:contains( album.genres, genre)}">
                                                    <input type="checkbox" checked id="${genre}" name="genreIds" value="${genre.id}">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="checkbox" id="${genre}" name="genreIds" value="${genre.id}">
                                                </c:otherwise>
                                            </c:choose>
                                            <label for="${genre}">${genre.name}</label>
                                        </div>
                                    </c:forEach>

								</div>

							</td>
						</tr>

						<%-- ------------------------------------------------
							Update/Add Button
						------------------------------------------------ --%>
						<tr>
							<td>
								<div>
                                    <c:choose>
                                        <c:when test="${editing}">
                                            <button type="submit" class="btn btn-warning table-btn">Update Album</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit" class="btn btn-warning table-btn">Add Album</button>
                                        </c:otherwise>
                                    </c:choose>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</form>

		</div>
	</div>
</div>



<jsp:include page="bootstrapFooter.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../../bootstrapHead.jsp" />

<c:choose>
	<c:when test="${empty album}">
		<h1>Could Not Locate Album, Sorry</h1>
	</c:when>
	<c:otherwise>

		<%-- picture, album, artist, and description --%>
		<div class="container-fluid">

			<jsp:include page="../includes/albumHeader.jsp" />

			<%-- ------------------------------------------------
                Add Comment
            ------------------------------------------------ --%>
			<c:if test="${sessionScope.user != null}">
				<%-- testing code --%>
				<%-- <c:if test="${true}"> --%>
				<div class="table-responsive">
					<div class="table-wrapper table-body">
						<div class="table-title">
							<div class="row">
								<h2>Leave A Comment</h2>
							</div>
						</div>
						<form action="albumComments.do" id="addAlbumComment" method="POST">
							<input type="hidden" name="albumId" value="${album.id }">
							<table class="music-table table-hover album-comment-box">
								<tbody>
									<tr>
										<td><textarea class="form-control" rows="5" id="comment"
												name="commentText" placeholder="Add Comment..."></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<button type="submit" class="btn btn-warning table-btn">Post
								Comment</button>
						</form>
					</div>
				</div>
			</c:if>


			<%-- ------------------------------------------------
                Show Lastest Comments
            ------------------------------------------------ --%>
			<div class="table-responsive">
				<div class="table-wrapper table-body">
					<div class="table-title">
						<div class="row">
							<h2>Latest Comments</h2>
						</div>
					</div>
					<table class="music-table table-hover">

						<thead>
							<tr>
								<th class="commentTable-userImage"></th>
								<th class="commentTable-comment"></th>
								<th class="commentTable-icons"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty albumComments}">
									<c:if test="${ empty sessionScope.user }">
										<tr>
											<h4>
												<a href="login">To leave a comment please login or
													create an account</a>
											</h4>
										</tr>
									</c:if>
									<c:forEach items="${albumComments}" var="comment">

										<tr>
											<td><a href="profile?id=${comment.user.id}">
													<img class="user-image-md" src="${comment.user.imageURL}"
													alt="Profile Image">
											</a></td>
											<td class="commentTable-commentText">
												<p class="commentTable-dateText">
													Posted by: ${comment.user.username} <br> On:
													${comment.commentDate.year} ${comment.commentDate.month}
													${comment.commentDate.dayOfMonth}

													<c:if
														test="${comment.updateDateTime != null && comment.updateDateTime != comment.commentDate}">
                                                        (Edited On:
                                                        ${comment.updateDateTime.year}
                                                        ${comment.updateDateTime.month}
                                                        ${comment.updateDateTime.dayOfMonth})
                                                    </c:if>
												</p>

												<p>${comment.comment}</p> <c:if
													test="${not empty comment.replies}">
													<a class="commentTable-dateText"
														href="commentThread.do?commentId=${comment.id}"> View
														Replies (${fn:length(comment.replies)}) </a>
													<br>
												</c:if> <c:if test="${not empty comment.inReplyTo}">
													<a class="commentTable-dateText"
														href="commentThread.do?commentId=${comment.inReplyTo}">
														View Replied To Comment </a>
												</c:if>
											</td>
											<td><c:choose>
													<c:when test="${comment.user.id == sessionScope.user.id}">
														<form action="commentThread.do" method="GET">
															<input type="hidden" name="commentId"
																value="${comment.id }">
															<button type="submit"
																class="btn btn-warning btn-sm comment-icon-button">
																<i class="glyphicon glyphicon-edit"
																	data-toggle="tooltip" title="Edit Comment"></i>
															</button>
														</form>
													</c:when>
													<c:otherwise>
														<c:if test="${sessionScope.user != null}">
															<form action="commentThread.do" method="GET">
																<input type="hidden" name="commentId"
																	value="${comment.id }">
																<button type="submit"
																	class="btn btn-warning btn-sm comment-icon-button">
																	<i class="glyphicon glyphicon-share"
																		data-toggle="tooltip" title="Reply To Comment"></i>
																</button>
															</form>
														</c:if>
													</c:otherwise>
												</c:choose></td>
										</tr>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										No Comments...
										<br>
										<h4>
											<a href="login">To leave a comment please login or create
												an account</a>
										</h4>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>

					</table>
				</div>
			</div>

		</div>

	</c:otherwise>
</c:choose>

<jsp:include page="../../scripts/tooltipScript.jsp" />


<jsp:include page="../../bootstrapFooter.jsp" />

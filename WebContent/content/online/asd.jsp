<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/modern-business.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/css/usercurr_detail.min.css"
	rel="stylesheet" type="text/css">
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<%-- <c:set var="memberDTO" value="${sessionScope.memberDTO }" /> --%>
<title>재능 교육 사이트 - WhyNot?</title>
</head>
<!-- flowplayer depends on jQuery 1.7.1+ (for now) -->
<script src="${pageContext.request.contextPath}/dist/jquery.js"></script>
<!-- include flowplayer -->
<script src="${pageContext.request.contextPath}/dist/flowplayer.js?i"></script>
<body >
	<c:forEach var="curr" items="${currData }">
		<div>
			<div class="panel panel-default"
				style="width: 80%; position: fixed;">
				<div class="panel-heading" style="height: 3em">${curr.TITLE }</div>
				<!-- 영상 영역 -->
					<div id="h-div" class="flowplayer play-button" data-engine="flash"
						data-swf="${pageContext.request.contextPath}/dist/flowplayer.swf"
						data-rtmp="rtmp://s3b78u0kbtx79q.cloudfront.net/cfx/st"
						data-ratio=".4167" style="height: 30em;">
						<video autoplay preload="none">
							<!-- <source type="video/mp4" src="movie/test.mp4"> -->
							<source type="video/mp4" src="WhyNot/video/${videoDTO.filename }">
						</video>
					</div>
				</div>

				<!-- 게시판 글 영역 -->

				<div style="background-color: black;">
					<!-- 댓글 시작~ -->
					<div class="well"
						style="position: fixed; width: 80%; margin-bottom: 1px; height: 10em;">
						<h4>Q&A</h4>
						<c:if test="${memberDTO.id != writer}">
							<form action="qna_insert.curr" method="post" role="form"
								style="height: 56px;">
								<input type="hidden" name="lsnum" value="${curr.LSNUM }">
								<input type="hidden" name="clnum" value="${curr.CLNUM }">
								<input type="hidden" name="ttnum" value="${curr.TTNUM }">
								<input type="hidden" name="mnum" value="${memberDTO.mnum }">
								<div style="float: left; width: 80%;">
									<textarea rows="2" class="form-control"
										style="display: inline;" name="content"></textarea>
								</div>

								<input type="hidden" name="mnum" value="${memberDTO.mnum }">
								<div
									style="float: left; width: 19%; height: 80%; margin-left: 8px;">
									<button type="submit" class="btn"
										style="width: 99%; height: 99%; margin: 8px; background-color: #6799FF;">Submit</button>
								</div>

							</form>
						</c:if>
					</div>
				</div>
				<%-- <c:choose>
					<c:when test="${memberDTO.id != writer}"> --%>
				<div
					style="display: block; overflow: scroll; height: 275px; margin-top: 123px;">
					<%-- 	</c:when>
					<c:otherwise>
						<div
							style="display: block; overflow: auto; height: 275px; margin-top: 64px;">
					</c:otherwise>
				</c:choose> --%>
					<!-- 질답 리스트님 와주세욥 -->
					<c:set var="collNum" value="1" />
					<c:choose>
						<c:when test="${qnaList.size()==0 }">
						질문이 없습니다.
					</c:when>
						<c:otherwise>
							<c:forEach var="qnaDTO" items="${qnaList }">
								<fmt:parseNumber var="i" integerOnly="true" type="number"
									value="${qnaDTO.qanum%2 }" />
								<c:choose>
									<c:when test="${i!=0 }">
										<c:set var="collNum" value="${collNum+1 }" />
										<hr style="margin: 16px 8px;">
										<div class="media" style="margin-top: 20px;">
											<a class="pull-left" href="#"> <img class="media-object"
												src="http://placehold.it/64x64" alt="">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													${qnaDTO.mnum } <small>${qnaDTO.createddate }</small>
												</h4>
												${qnaDTO.content } <br>
												<c:if test="${qnaDTO.mnum != memberDTO.mnum}"> <a data-toggle="collapse"
													href="#collapseExample${collNum }" aria-expanded="false"
													aria-controls="collapseExample"> [답변달기] </a></c:if>
												<c:if test="${qnaDTO.mnum == memberDTO.mnum}">
													<a
														href="qna_delete.curr?qanum=${qnaDTO.qanum }&mnum=${memberDTO.mnum }&lsnum=${curr.LSNUM }&clnum=${qnaDTO.clnum}&ttnum=${curr.TTNUM }">[삭제]</a>
												</c:if>
												<div class="collapse" id="collapseExample${collNum }">
													<div class="well" style="margin: 8px;">

														<!-- 댓글 답글 -->
														<form action="qna_answer.curr?lsnum=${qnaDTO.lsnum }"
															method="post" role="form" style="height: 96px;">
															<div style="float: left; width: 80%;">
																<textarea rows="4" class="form-control"
																	style="display: inline;" name="content"></textarea>
															</div>

															<input type="hidden" name="mnum"
																value="${memberDTO.mnum }"> <input type="hidden"
																name="qanum" value="${qnaDTO.qanum-1 }"> <input
																type="hidden" name="clnum" value="${curr.CLNUM }">
															<input type="hidden" name="ttnum" value="${curr.TTNUM }">

															<div
																style="float: left; width: 19%; height: 80%; margin-left: 8px;">
																<button type="submit" class="btn"
																	style="width: 99%; height: 99%; margin: 8px; background-color: #6799FF;">Submit</button>
															</div>
														</form>
														<!-- 댓글 답글 끝 -->
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="media">
											<div class="media-body">
												<h4 class="media-heading"></h4>
												<!-- Nested Comment -->
												<div class="media" style="margin-top: 0px;">

													<div class="media-body">
														<img class="pull-left"
															src="${pageContext.request.contextPath}/img/ask.png"
															alt="" style="width: 64px; float: left;"> <a
															href="#"> <img src="http://placehold.it/64x64" alt=""
															style="float: left;">
														</a>
														<div style="float: left; margin-left: 8px;">
															<h4 class="media-heading">
																${qnaDTO.mnum } <small>${qnaDTO.createddate }</small>
															</h4>
															${qnaDTO.content }
															<c:if test="${qnaDTO.mnum == memberDTO.mnum}">
																<a
																	href="qna_delete.curr?qanum=${qnaDTO.qanum }&mnum=${memberDTO.mnum }&lsnum=${curr.LSNUM }&clnum=${qnaDTO.clnum}&ttnum=${curr.TTNUM }">[삭제]</a>
															</c:if>
														</div>
													</div>
												</div>
												<!-- End Nested Comment -->
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<hr style="margin: 16px 8px;">
						</c:otherwise>
					</c:choose>
					<!-- 댓글 끝 -->
				</div>
				<!-- List group -->

			</div>

			<!-- <!-- 우측 커리큘럼 목록 -->
			<div class="panel panel-default" style="width: 20%; float: right;">
				<div class="panel-heading">커리큘럼 명</div>
				<ul class="list-group">
					<c:choose>
						<c:when test="${currList.size() == 0 || currList == null }">
							<li class="list-group-item">등록된 커리큘럼이 없습니다.</li>
						</c:when>
						<c:otherwise>
							<c:forEach var="currDto" items="${currList }">
								<li class="list-group-item "><a class="btn"
									href="curri_detail.curr?lsnum=${currDto.LSNUM }&clnum=${currDto.CLNUM}&ttnum=${currDto.TTNUM}"><c:out
											value="${currDto.TITLE}" /> 
											
											<c:out value="${currDto.TTNUM }${currDto.LSNUM }${currDto.CLNUM }"></c:out></a>
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</c:forEach>
	<!-- jQuery -->
	<script src="../../js/jquery.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../../js/bootstrap.min.js"></script>

	<!-- new-age Core JavaScript -->
	<script src="../../js/new-age.min.js"></script>

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
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
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../../css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>재능 교육 사이트 - WhyNot?</title>
</head>
<body style="overflow: hidden;">
	<div>
		<div class="panel panel-default"
			style="float: left; height: 59em; width: 80%;">
			<div class="panel-heading">커리큘럼 명</div>
			<!-- 영상 영역 -->
			<div class="panel-body">
				<div style="height: 30em;">영상위치</div>
			</div>
			
			<!-- Q&A게시판 영역 -->
			<div class="panel-heading" style="vertical-align: middle;">
				<font style="float: left;">Q&A 게시판</font>
				<form class="navbar-form" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			
			<!-- 게시판 글 영역 -->
			<div style="overflow:;">
				<ul class="list-group" style="width: 100%; margin: 0; padding: 0;">
					<li class="list-group-item">Cras justo odio</li>
				</ul>
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
							<li class="list-group-item"><a
								href="content/online/curr_detailForm.jsp">커리큘럼 목록</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<!-- jQuery -->
	<script src="../../js/jquery.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../../js/bootstrap.min.js"></script>

	<!-- new-age Core JavaScript -->
	<script src="../../js/new-age.min.js"></script>
</body>
</html>
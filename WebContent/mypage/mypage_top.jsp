<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.img-circle1 {
	width: 180px;
	height: 180px;
	border-radius: 150px;
	-webkit-border-radius: 150px;
	-moz-border-radius: 150px;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.namefont {
	display: table;
	margin-left: auto;
	margin-right: auto;
	font-size: 3em;
	color: white;
}
</style>
<!-- 상단 그림 영역 -->
<c:set var="memberDTO" value="${sessionScope.memberDTO}" />
<c:set var="proData" value="${sessionScope.proDto}"/>
<div>
	<div
		style="width: 100%; height: 30em; background-color: gray; padding-top: 6em;">
		<div style="vertical-align: middle;">
			<c:choose>
				<c:when test="${proData.imgdir == null }">
					<img class="img-circle1" src="img/defaultpro.png">
				</c:when>
				<c:otherwise>
					<img class="img-circle1" src="${pageContext.request.contextPath}/images/${proDto.imgname}">
				</c:otherwise>
			</c:choose>
			<font class="namefont"><c:out value="${memberDTO.name }" /></font>
		</div>
	</div>
</div>
<!-- 메뉴 텝 -->
<c:set var="readUrl" value="${pageContext.request.requestURL}" /> <!-- 실제 경로 페이지(.jsp)를 불러온다 -->
<%-- <c:out value="${readUrl }"></c:out> --%>
<div>
	<ul class="nav nav-tabs nav-justified">
		<c:choose>
			<c:when test="${fn:contains(readUrl,'purchase')}">
				<li role="presentation" class="active"><a 
					href="purchase.mypage?mnum=${memberDTO.mnum }" style="color: black;"><strong>구매목록</strong></a></li>
			</c:when>
			<c:otherwise>
				<li role="presentation"><a href="purchase.mypage?mnum=${memberDTO.mnum }">구매목록</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(readUrl,'sale')}">
				<li role="presentation" class="active"><a
					href="sale.mypage?mnum=${memberDTO.mnum }" style="color: black;"><strong>판매목록</strong></a></li>
			</c:when>
			<c:otherwise>
				<li role="presentation"><a href="sale.mypage?mnum=${memberDTO.mnum }">판매목록</a></li>
			</c:otherwise>                                                                                                                                                                                                                    
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(readUrl,'profile')}">
				<li role="presentation" class="active" style="color: black;"><a
					href="profile.mypage?mnum=${memberDTO.mnum }"><strong>프로필</strong></a></li>
			</c:when>
			<c:otherwise>
				<li role="presentation"><a href="profile.mypage?mnum=${memberDTO.mnum }">프로필</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(readUrl,'setting')}">
				<li role="presentation" class="active" style="color: black;"><a
					href="setting.mypage"><strong>설정</strong></a></li>
			</c:when>
			<c:otherwise>
				<li role="presentation"><a href="setting.mypage">설정</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(readUrl,'???')}">
				<li role="presentation" class="active" style="color: black;"><a
					href="#"><strong>???</strong></a></li>
			</c:when>
			<c:otherwise>
				<li role="presentation"><a href="#">???</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>

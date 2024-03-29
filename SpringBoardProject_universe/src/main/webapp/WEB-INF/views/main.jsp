<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style type="text/css">
section {
	width: 1200px;
	margin: 0 auto;
	padding : 50px 0;
}

table {
	width: 1000px;
	margin: 0 auto;
	border-collapse: collapse;
}

td, th {
	padding: 8px 15px;
	border-top: 1px solid #b7b7b7;
	border-bottom: 1px solid #b7b7b7;
}

td>a {
	text-decoration: none;
	color: black;
}

td>a:hover {
	color: red;
}

.bno {
	text-align: center;
}

.table_footer{
	width : 100%;
	position : relative;
}

.table_footer a {
	font-size: 18px;
}

.table_footer a:visited, .table_footer a:link {
	text-decoration: none;
	color: black;
}

.table_footer a:hover {
	color: red;
}

#table_footer_write{
	font-size : 16px;
	color : black;
	position : absolute;
	right : 10px;
}

#table_footer_write:hover{
	font-weight : bold;
}

.paging_normal {
	font-size: 18px;
	font-weight: bold;
}

.before-arrow , .next-arrow{
	width : 15px;
}

th:nth-child(n+4){
	width : 120px;
	text-align : center;
}

td:nth-child(n+4) {
	text-align : center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<section>
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th class="th_wDate">작성일</th>
				<th class="th_wCount">조회수</th>
				<th class="th_wLike">좋아요</th>
				<th class="th_wHate">싫어요</th>
			</tr>
			<c:forEach var="b" items="${requestScope.board}">
				<tr>
					<td class="bno">${b.bno}</td>
					<td><a href="boardView.do?bno=${b.bno }">${b.title}</a></td>
					<td>${b.writer}</td>
					<td>${b.bDate}</td>
					<td>${b.bCount}</td>
					<td>${b.bLike}</td>
					<td>${b.bHate}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7" class="table_footer"><c:if
						test="${requestScope.paging.previousPageGroup}">
						<a href="/?pageNo=${paging.startPageOfPageGroup - 1 }"> <img src="img/back-button.png" class="before-arrow"> </a>
					</c:if> <c:forEach var="m"
						begin="${requestScope.paging.startPageOfPageGroup}"
						end="${requestScope.paging.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${m == paging.currentPageNo }">
								<span class="paging_normal">${m }</span>
							</c:when>
							<c:otherwise>
								<a href="/?pageNo=${m }">${m }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${requestScope.paging.nextPageGroup}">
						<a href="/?pageNo=${paging.endPageOfPageGroup + 1 }"> <img src="img/fast-forward.png" class="next-arrow"> </a>
					</c:if>
					<c:if test="${sessionScope.login != null && sessionScope.id != null }">
						<a href="boardWriteView.do" id="table_footer_write">글쓰기</a>
					</c:if>
					</td>
			</tr>
		</table>
	</section>
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>








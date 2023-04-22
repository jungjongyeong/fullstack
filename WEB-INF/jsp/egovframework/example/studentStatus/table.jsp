<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
	$(function(){
		$("tbody > tr").click(function(){
			
			$("#studentName").val($(this).children().eq(2).text());
			
			leftInit.leftClickA("table");
		});

	});
		
</script>
<!-- contents -->
<div id="contents">
		<!-- 컨텐츠 -->
		<div class="content_wrap">			
			
		<h2 class="fs-18 fw-b">수강생 테이블</h2><br>

		<table class="tbl type02">
			<thead>
				<tr>
					<th scope="row">순번</th>
					<th scope="row">아이디</th>
					<th scope="row">이름</th>
					<th scope="row">나이</th>
					<th scope="row">닉네임</th>
					<th scope="row">수업과정</th>
					<th scope="row">기수</th>
					<th scope="row">주차</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${studentList}" var="studentInfo">
				<tr>
					<td><c:out value="${studentInfo.num}"></c:out></td>
					<td><c:out value="${studentInfo.userId}"></c:out></td>
					<td><c:out value="${studentInfo.userNm}"></c:out></td>
					<td><c:out value="${studentInfo.age}"></c:out></td>
					<td><c:out value="${studentInfo.cafeNick}"></c:out></td>
					<td><c:out value="${studentInfo.classNm}"></c:out></td>
					<td><c:out value="${studentInfo.gisuNo}"></c:out></td>
					<td><c:out value="${studentInfo.juchaNm}"></c:out></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--// contents -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="/chkBox.do">
<input type="hidden"  name="pageHeadName" value="chkBox">
	<div id="contents">
		<div class="content_wrap">
			<h2 class="fs-18 fw-b">수강생 필터</h2>
			<br>
			<div class="innerTop">
				<table class="tbl type01">
					<tbody>
				        <tr>
				            <th scope="row">수업명 </th>
				            <td>
				                <ul class="ui-chk">
				                	<c:forEach items="${studentParamNm}" var="studentInfo" varStatus="status">
					                    <li>
					                        <input type="checkbox" id="chkNum${studentInfo.classNm}" name="chkArr"
				                        	   value="${studentInfo.classNm}" class="type01"
				                        	   <c:forEach items="${asdeqw}" var="chk">
					                        	   <c:if test="${studentInfo.classNm eq chk}">
					                        	   		checked
					                        	   </c:if>	
				                        	   </c:forEach>
				                        	   >				                       	
					                        <label for="chkNum${studentInfo.classNm}">
					                        	<span><c:out value='${studentInfo.classNm}'/></span>
					                        </label>
					                    </li>
				                    </c:forEach>
				                </ul>
				            </td>
				        </tr>
					</tbody>
				</table>
			</div>
			<br>
			<div class="btn-wrap mgt-20">
			  <div class="f-r">
			    <ul>
			      <li>
			      	<button id="srchBtn" type="submit" class="btn type03 f-r">검색</button>
			      </li>
			    </ul>
			  </div>
			</div>
			<br>
			<h2 class="fs-18 fw-b">수강생 테이블</h2><br>
			<table class="tbl type02">
				<thead>
					<tr>
						<th scope="row">순번</th>
						<th scope="row">아이디</th>
						<th scope="row">이름</th>
						<th scope="row">나이</th>
						<th scope="row">닉네임</th>
						<th scope="row">핸드폰번호</th>
						<th scope="row">수업과정</th>
						<th scope="row">기수</th>
						<th scope="row">주차</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${studentStatusList}" var="studentInfo">
						<c:forEach items="${asdeqw}" var="chk">	
						<c:if test="${studentInfo.classNm eq chk}">
							<tr>
								<td><c:out value="${studentInfo.num}"/></td>
				                <td><c:out value="${studentInfo.userId}"/></td>
				                <td><c:out value="${studentInfo.userNm}"/></td>
				                <td><c:out value="${studentInfo.age}"/></td>
				                <td><c:out value="${studentInfo.cafeNick}"/></td>
				                <td><c:out value="${studentInfo.phone}"/></td>
				                <td><c:out value="${studentInfo.classNm}"/></td>
				                <td><c:out value="${studentInfo.gisuNo}"/></td>
				                <td><c:out value="${studentInfo.juchaNm}"/></td>
							</tr>
						</c:if>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</form>	

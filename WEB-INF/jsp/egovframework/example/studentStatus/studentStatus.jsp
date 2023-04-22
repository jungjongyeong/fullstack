<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

$(function(){
	var labelsArr 	= [],
		dataArr 	= [];
	
	<c:forEach items="${studentClass}" var="classInfo" varStatus="status">
		labelsArr[${status.index}] 	= "${classInfo.classNm}";
		dataArr[${status.index}]	= "${classInfo.cnt}";
	</c:forEach>
	
	var config = {
			type: 'pie',
			data: { 
				datasets: [{
					data: dataArr,
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: labelsArr
			},
			options: {
				responsive: true
			}
		};
	
	var ctx = document.getElementById('chart-area').getContext('2d');
	var mypie = new Chart(ctx, config);
	
	$("#chart-area").click(function(e){
	    var firstpoint = mypie.getElementsAtEvent(e)[0];
	    
	    $("tbody > tr > td").remove();
	    
	    if (firstpoint) {
	    	
	        var label = mypie.data.labels[firstpoint._index];
	        
			$.ajax({
				
				url  : "/chartPartsDtl.do",
				data : {"param":  label},
				
				success : function(data) {
						data.forEach(function(obj, idx){
						var tr = document.createElement("tr");
						
						for (var key in obj){
							var td = document.createElement("td");
							
						$(td).text(obj[key]);
						
						$(tr).append(td);
						
						}
						$("tbody").append(tr);
					})
					
				}
			})
	    }
	})
})
		
</script>
<!-- contents -->
<div id="contents">
	<!-- 컨텐츠 -->
	<div class="content_wrap">			
		<h2 class="fs-18 fw-b">수강생 현황 차트</h2>
		<div id=" canvas-holder" style="width:40%">
			<div class="chartjs-size-monitor">
				<div class="chartjs-size-monitor-expand">
					<div class="">
					</div>
				</div>
				<div class="chartjs-size-monitor-shrink">
					<div class="">
					</div>
				</div>
			</div>
			<canvas id="chart-area" style="display: block; cursor:pointer; height: 242px; width: 484px;" width="605"
				height="302" class="chartjs-render-monitor"></canvas>
		</div>
		<h2 class="fs-18 fw-b">수강생 테이블</h2><br>
		<table class="tbl type02">
			<tbody>
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
				<c:forEach items="${chartPartsList}" var="studentInfo">
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
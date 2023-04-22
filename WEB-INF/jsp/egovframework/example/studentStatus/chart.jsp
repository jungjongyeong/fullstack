<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

var fieldC = {
		
	labelsArr 	: [],
	dataArr 	: [],
	mypieA  	: null,
	
	configA : function() {
		<c:forEach items="${studentClass}" 	var	="classInfo" varStatus="status">
			this.labelsArr[${status.index}] = "${classInfo.classNm}";
			this.dataArr[${status.index}]	= "${classInfo.cnt}";
		</c:forEach>
	
		var config = {
				type: 'pie',
				data: { 
					datasets: [{
						data:this.dataArr,
						backgroundColor: [
							window.chartColors.red,
							window.chartColors.yellow,
							window.chartColors.green,
							window.chartColors.blue,
						],
						label: 'Dataset 1'
					}],
					labels:this.labelsArr
					
				},
				options: {
					responsive: true
				}
			};
		
		return config;
		},
		
	createA : function(){ 
		var ctx = document.getElementById("chart-area").getContext('2d');
		this.mypieA = new Chart(ctx, this.configA());
	}
}	

var eventC = {
		
	clickA : function() {
		var that = this;
		
		$("#chart-area").click(function(e){
		    var firstpoint = that.mypieA.getElementsAtEvent(e)[0];
		    
		    $("tbody > tr > td").remove();
		    
		    if (firstpoint) {
		    	
		        var label = that.mypieA.data.labels[firstpoint._index];
		        
				$.ajax({
					
					url  : "/chartPartsDtl.do",
					type : "post",
					data : {"param":  label},
					
					success : function(data) {
						data.forEach(function(obj, idx){
						var tr = document.createElement("tr");
						
						for (var key in obj){
							
							var td = document.createElement("td");
							
							$(td).text(obj[key]);
							console.log(td);
							$(tr).append(td);
						
						};
						
						$("tbody").append(tr);
						});
					}
				});
		    }
		});
	}
}

$(function(){

	// 차트를 생성
	fieldC.createA();
	
	// 클릭이벤트 부여
	eventC.clickA.call(fieldC);
	

})
</script>
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
			<canvas id="chart-area" style="cursor:pointer; display: block; height: 242px; width: 484px;" width="605"
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

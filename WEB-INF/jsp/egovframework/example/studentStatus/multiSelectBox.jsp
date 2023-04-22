<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

function createOptions(data) {
	var partsDtlArr = JSON.parse(data);
	
	var optionStr = "";
	
	$("#partsDtl > option").remove();
	
	if(partsDtlArr.length > 0){
		partsDtlArr.forEach(function(item, index){
			optionStr = "<option value=" + item.optCd + ">"
							+ item.optNm
							+ "</option>";
							
			$("#partsDtl").append(optionStr);	
		 console.log(item)})
	}else{
		optionStr = "<option>없음<option>";
		
		$("#partsDtl").append(optionStr);
	}
	
	$("#partsDtl").selectric("refresh");

}

$(function() {
	
	$(".sel").selectric();
	
	$("#partsMst").change(function(){
		
		$.ajax({
			
			url  : "/selectPartsDtl.do",
			data : {partsCd : $("#partsMst").val()},
			
			success : function(data) {
				createOptions(data)
			}
		})
	})
})

</script>

<div id="contents">
	<table class="tbl type02">	
		<tbody> 
			<tr>
				<th scope="row">컴퓨터 부품 선택</th>
				<td class="ta-l">
						<select id="partsMst" name="partsMst" class="sel short">
							<option>없음</option>
							<c:forEach items="${mainPartList}" var="studentInfo">
									<option value="${studentInfo.partsCd}">
										<c:out value="${studentInfo.partsNm}"/>
									</option>
							</c:forEach>
						</select>
					<select id="partsDtl" name="partsDtl" class="sel middle">
						<option>없음</option>
					</select>        
				</td>   
			</tr>
		</tbody>
	</table>
</div>


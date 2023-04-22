<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function createOptions(data) {
	var partsDtlArr = JSON.parse(data);
	
	var optionStr = "";
	
	$("#menuDst > option").remove();
	
	if(partsDtlArr.length > 0){
		partsDtlArr.forEach(function(item, index){
			optionStr = "<option value=" + item.menuCd + ">"
							+ item.menuNm + " " +item.menuPrc
							+ "</option>";
							
			$("#menuDst").append(optionStr);	
			
		})
	}else{
		optionStr = "<option>없음<option>";
		
		$("#menuDst").append(optionStr);
	}
	
	$("#menuDst").selectric("refresh");
	
}
	
$(function() {
	$(".sel").selectric();
	
	$("#menuMst").change(function(){
			
			$.ajax({
				
				url  : "/menuPartsDtl.do",
				data : {catCd :  $("#menuMst").val()},
				
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
				<th scope="row">메뉴 분류</th>
				<td class="ta-l">
					<select id="menuMst" name="menuMst" class="sel short">
						<option value="">없음</option>
							<c:forEach items="${menuSelectList}" var="menuSelectInfo">
										<option value="${menuSelectInfo.menuCatCd}">
											<c:out value="${menuSelectInfo.menuCatNm}"/>
										</option>
							</c:forEach>
					</select>
					<select id="menuDst" name="menuDst" class="sel middle">
						<option value="">없음</option>
					</select>        
				</td>   
			</tr>
		</tbody>
	</table>
</div>


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script>
var leftInit = {
		
		leftClickA : function(liInit){
			
			$("#leftFrm").attr("action", "/" + liInit + ".do");
			
			$("#pageHeadName").val(liInit);
			
			$("#leftFrm").submit();
			
		}
	}
</script>
<form id="leftFrm">
	<input type="hidden" id="pageHeadName" 	name="pageHeadName">
	<input type="hidden" id="studentName" 	name="studentName">
</form>

<!-- header -->
<header id="header" class="main">
    <h1 class="logo"><a href="/main.do"><img src="images/common/img_logo02.png" alt="Hanqea logo image" /></a></h1>
    <div class="dib fs-12 va-m"><i class="ico-user"></i>안녕하세요 관리자님</div>
    <div class="btn_wrap dib va-m">
        <button type="button" class="btn type01 bookmark">즐겨찾기</button>
        <button type="button" class="btn type01 logout">로그아웃</button>
        <button type="button" class="btn type01 store"><span><a href="https://cafe.naver.com/amunamuna" target="_blank">한큐에자바 바로가기</a></span></button>
    </div>

    <!-- gnb -->
    <ul id="gnb" class="clearfix">
        <li><a href="/studentStatus.do">수강생 수료 현황</a></li>
    </ul>
    <!--// gnb -->
</header>
<!--// header -->
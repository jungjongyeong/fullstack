<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles" %>

<script type="text/javascript">

$(function() {
	var pageName = "";
	
	$("#leftUl > li").click(function() {
		leftInit.leftClickA($(this).attr("id"));
	});
	
	$("#leftUl > li").removeClass("on");
	
	pageName = "${param.pageHeadName}";
	
	$("#" + pageName).addClass("on");
	
})

</script>

<form id="leftFm" method="post">
	<input type="hidden" id="pageName" name="pageName">
</form>

<nav id="lnb">
	<button type="button" class="btn btn-lnb"><i class="ico-arr-left01"></i><span
			class="hidden"></span></button>
	<div class="scrollbar-inner">
		<ul class="depth1">
			<li class="on">
				<div>
					<a href="javascript:;">수강생 수료 현황</a>
				</div>
				<ul class="depth2" id="leftUl">
					<li id="studentStatus">
						<div>
							<a href="#">메뉴</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="chart">
						<div>
							<a href="#">차트</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="table">
						<div>
							<a href="#">table</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="stringParam">
						<div>
							<a href="#">문자열보내기</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="paramVO">
						<div>
							<a href="#">paramVO</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="RequestParam">
						<div>
							<a href="#">RequestParam</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="chkBox">
						<div>
							<a href="#">chkBox</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="multiSelectBox">
						<div>
							<a href="#">multiSelectBox</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
					<li id="menuSelectBox">
						<div>
							<a href="#">menuSelectBox</a>
							<button type="button" class="btn-bookmark"><span
									class="hidden">즐겨찾기</span></button>
						</div>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
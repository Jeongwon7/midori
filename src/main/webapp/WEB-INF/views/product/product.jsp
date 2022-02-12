<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp"%>
	
	<!-- contents -->
	<section class="product">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h2>CATEGORY</h2>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab">
						      <h4 class="panel-title">
						        <a href="productall.do" >
						          PRODUCTS
						        </a>
						      </h4>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-9 newitem">
					<h2>ALL ITEM</h2>
						<div class="row">
							<c:forEach items="${allList}" var="list">
							  <div class="col-sm-6 col-md-4">
							    <div class="thumbnail">
							      <a href="productdetail.do?pseq=${list.pseq}"><img src="${pageContext.request.contextPath}/product_images/${list.image}" alt="신상품  사진"></a>
							      <div class="caption">
							        <h3>${list.name }</h3>
							        <p>
							        	<span style="color:#f00; font-size:22px;"><fmt:formatNumber value="${list.price2}"/></span>
							        	<span>원</span>
							        </p>
							      </div>
							    </div>
							  </div>
						  </c:forEach>
						</div>  
				</div><!-- 9 end -->
			</div>
		</div>
	</section>
	<!-- contents end-->
	
	<script>
		$(function() {
			
			var actionForm = $("#actionForm");
			
			$(".paging > a").on("click", function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));//현재 페이지 번호의 값을 구해서 전송해라
				actionForm.submit();
			})
		});
	</script>
<%@ include file = "../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
	<!-- contents -->
	<section class="product">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h2>CATEGORY</h2>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          Side Menu
						          <span class="badge pull-right"><i class="fa fa-plus"></i></span>
						        </a>
						      </h4>
						    </div>
						    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						      <div class="panel-body">
								<ul>
									<li><a href="cartlist.do">장바구니 내역</a></li>
									<li><a href="mypage.do">진행중인 주문내역</a></li>
									<li><a href="orderAll.do">총 주문내역</a></li>
								</ul>
						      </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="col-md-9 newitem">
					<h2>MyPage (주문상세 정보)</h2>
					<form method="post" name="formm">
					<h3>주문자 정보</h3>
						<table class="table">
							<tr>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문자</th>
								<th>주문총액</th>
							</tr>
							<tr>
								<td>2022-02-09</td>
								<td>12</td>
								<td>권정원</td>
								<td>28764</td>
							</tr>
						</table>
						<h3>주문 상품 정보</h3>
						<table class="table">
							<tr>
								<th>상품명</th>
								<th>상품별주문번호</th>
								<th>수량</th>
								<th>가격</th>
								<th>처리상태</th>
							</tr>
								<tr>
									<td>테스트다요</td>
									<td>1</td>
									<td>1</td>
									<td>23456</td>
									<td>
												<span style="color:#f00;">처리 완료</span>
												<span> / <a href="/review/reviewwrite.do?pseq=1">리뷰 작성</a></span>
									</td>
								</tr>
						</table>
						<div class="col-md-12">
							<input type="button" class="btn btn-default" value="쇼핑계속하기" onclick="location.href='main.do'">
						</div>
					</form>
						
				</div><!-- 9 end -->
			</div><!-- row end -->
		</div>
	</section>
	<!-- contents end-->
<%@ include file = "../footer.jsp" %>
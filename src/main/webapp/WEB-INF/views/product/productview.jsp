<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
	<!-- contents -->
	<section class="product">
		<div class="container">
			<div class="row">
				<div class="col-md-9 newitem">
					<form method="post" name="formm">
						<input type="hidden" name="pseq" value="${pvo.pseq}">
						<div class="details">
							<div class="col-md-5">
								<img src="${pageContext.request.contextPath}/product_images/${pvo.image}" alt=""> 
							</div>
							<div class="col-md-7">
								<div class="information">
									<h2>${pvo.name}</h2>
									<p>배송비 2,500원 (40,000원 이상 무료) </p>
									<p>선물하기로 1만원 이상 구매 시, 300P 최대 10회 적립</p>
									<p>11번가 신한카드 첫 결제할인 + 최대 2% 적립</p>
									<p>최대 22개월 카드무이자 할부</p>
									<p style="color:#f00; font-size:22px;">
									<span class="${pvo.price2}"></span><fmt:formatNumber value="${pvo.price2}"/>원</p>
								</div>
								<div class="" style="padding:20px 0;" >
									<button class="minus" type="button">-</button>
									<input type="text" name="quantity" class="quantity" value="1" readonly>
									<button class="plus" type="button">+</button>
								</div>
								<div style="padding:30px 0;" >
									<strong>총 합계금액 : </strong>
									<span class="total"></span>
								</div>
								<div class="" style="padding:30px 0;">
											<!-- <button type="button" class="btn btn-default" onclick="alert('로그인이 필요한 기능입니다');">장바구니</button>
											<button type="button" class="btn btn-danger" onclick="alert('로그인이 필요한 기능입니다');">구매하기</button> -->
											<button type="button" class="btn btn-default" onclick="go_cart()">장바구니</button>
											<button type="button" class="btn btn-danger" id="check_module" >구매하기</button><!-- onclick="goOrderOneInsert()"-->
								</div>
							</div>
						</div><!-- details end -->
					</form>
						<div role="tabpanel" class="category-tab">

							  <!-- Nav tabs -->
							  <ul class="nav nav-tabs" role="tablist"><!-- a태그와 밑에 id 이름이 같게 -->
							    <li role="presentation" class="active"><a href="#productview" aria-controls="productview" role="tab" data-toggle="tab">상품설명</a></li>
							    <li role="presentation"><a href="#review" aria-controls="review" role="tab" data-toggle="tab">사용후기</a></li>
							    <li role="presentation"><a href="#qna" aria-controls="qna" role="tab" data-toggle="tab">상품문의</a></li>
							  </ul>
							
							  <!-- Tab panes -->
							  <div class="tab-content">
							    <div role="tabpanel" class="tab-pane active" id="productview">
							    	<div>
							    		${pvo.content}
							    	</div>
							    </div>
							    <div role="tabpanel" class="tab-pane" id="review">
							     	<div class="my_review">
							     		<table class="table table-hover my_reviewtbl">
							     		<colgroup>
							     			<col width="*">
							     			<col width="40%">
							     			<col width="*">
							     			<col width="*">
							     			<col width="*">
							     		</colgroup>
								     		<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">제목</th>
													<th scope="col">평점</th>
													<th scope="col">작성자</th>
													<th scope="col">작성일</th>
												</tr>
											</thead>
											<tbody class="review_box">
											
											<c:set var="num" value="${rlist.size()}"/>
												<c:forEach var="rlist" items="${rlist}">
													
														<c:if test ="${not empty rlist}">
														
															<tr class="item">
																<td>${num}</td>
																<td>${rlist.title}</td>
																<td>
																	<div class="star-ratings">
																		<div 
																	    class="star-ratings-fill space-x-2 text-lg"
																	    style="{ width: ratingToPercent + '%' }"
																		>
																		<c:choose>
																			<c:when test="${rlist.star == 5}">
																				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																			</c:when>
																			<c:when test="${rlist.star == 4}">
																				<span>★</span><span>★</span><span>★</span><span>★</span>
																			</c:when>
																			<c:when test="${rlist.star == 3}">
																				<span>★</span><span>★</span><span>★</span>
																			</c:when>
																			<c:when test="${rlist.star == 2}">
																				<span>★</span><span>★</span>
																			</c:when>
																			<c:when test="${rlist.star == 1}">
																				<span>★</span>
																			</c:when>
																		</c:choose>
																			
																		</div>
																		<div class="star-ratings-base space-x-2 text-lg">
																			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																		</div>
																	</div>
																</td>
																<td>${rlist.writer}</td>
																<td><fmt:parseDate var="regdate" value="${rlist.regdate }" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
																	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/><!-- 날짜 형식을 출력 --></td>
															</tr>
															<tr class="hide">
																<td colspan="5">
																	<div class="review_content_wrap">
																		<div class="review_content">
																			${rlist.content}
																		</div>
																		<sec:authorize access="isAuthenticated()">
																		<sec:authentication property="principal.member.id" var="pinfo"/>
																			<c:if test="${rlist.writer eq pinfo || principal.member.authorities eq '[ROLE_ADMIN, ROLE_USER]'}">
																				<div class="review_btn">
																					<span><input type="button" onclick="location.href='/review/reviewmodify.do?rbno=${rlist.rbno}'" value="수정"></span>
																					<span><input type="button" onclick="review_delete(${rlist.rbno}, ${pseq}, '${pinfo}' );" value="삭제"></span>
																				</div>
																			</c:if>
																		</sec:authorize>
																			<%-- <sec:authorize access="isAnonymous()">
																				<div class="review_btn">
																					<span><input type="button" onclick="alert('로그인이 필요한 기능입니다');" value="수정"></span>
																					<span><input type="button" onclick="alert('로그인이 필요한 기능입니다');" value="삭제"></span>
																				</div>
																			</sec:authorize> --%>
																				
																				
																	</div>
																</td>
															</tr>
														</c:if>
													<c:set var="num" value="${num-1}" />
												</c:forEach>
												<c:if test="${empty rlist }">
														<tr><td colspan="5">상품 후기가 없습니다</td></tr>
												</c:if>
											</tbody>
										</table>
							     	</div>
							    </div>
							    <div role="tabpanel" class="tab-pane" id="qna">
							     	<div class="my_qna">
							     		<table class="table table-hover my_qnatbl">
							     		<colgroup>
							     			<col width="*">
							     			<col width="*">
							     			<col width="40%">
							     			<col width="*">
							     			<col width="*">
							     		</colgroup>
								     		<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">카테고리</th>
													<th scope="col">제목</th>
													<th scope="col">작성자</th>
													<th scope="col">작성일</th>
												</tr>
											</thead>
											<tbody class="qna_box">
												<c:set var="num" value="${qnalist.size()}"/>
													<c:forEach var="list" items="${qnalist}">
														<c:if test="${list.secret == true }">
															<c:choose>
																<c:when test="${list.qwriter == pinfo || pinfo == 'admin'}">
																	<tr class="item">
																	<td>${num}</td>
																	<c:choose>
																		<c:when test="${list.category == 1}">
																			<td>상품문의</td>
																		</c:when>
																		<c:when test="${list.category == 2}">
																			<td>배송문의</td>
																		</c:when>
																		<c:when test="${list.category == 3}">
																			<td>기타문의</td>
																		</c:when>
																	</c:choose>
																	<td>
																		${list.qtitle}
																	</td>
																	<td>${list.qwriter}</td>
																	<td><fmt:parseDate var="regdate" value="${list.qregdate }" pattern="yyyy-MM-dd"/>
																		<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
																</tr>
																	<tr class="hide">
																		<td colspan="5">
																			<div class="review_content_wrap">
																				<div class="review_content">
																					${list.qcontent }
																				</div>
																					<sec:authorize access="isAuthenticated()">
																						<sec:authentication property="principal.member.id" var="pinfo"/>
																						<c:if test="${list.qwriter eq pinfo || principal.member.authorities eq '[ROLE_ADMIN, ROLE_USER]'}">
																							<span><input type="button" onclick="location.href='/qna/questionmodify.do?qbno=${list.qbno}'" value="수정"></span>
																							<span><input type="button" onclick="question_deleteOpen(${list.qbno}, ${pseq}, '${pinfo}');" value="삭제"></span>
																						</c:if>
																					</sec:authorize>
																						<div class="review_btn">
																								<span><input type="button" onclick="location.href='/adm/answerwrite.do?qbno=${list.qbno}&pseq=${pseq}&ref=${list.ref}'" value="답글작성"></span>
																						</div>
																				
																			</div>
																		</td>
																	</tr>
															
																<c:choose>
																	<c:when test="${list.abno eq 0}">
																			
																		
																	</c:when>
																	<c:otherwise>
																		<tr class="item">
																			<td></td>
																			<td></td>
																			<td style="padding-left:100px">
																				  <img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">
																				${list.atitle}
																			</td>
																			<td>${list.awriter}</td>
																			<td><fmt:parseDate var="regdate" value="${list.aregdate }" pattern="yyyy-MM-dd"/>
																				<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/> </td>
																		</tr>
																		<tr class="hide">
																			<td colspan="5">
																				<div class="review_content_wrap">
																					<div class="review_content">
																						${list.acontent}
																					</div>
																							<div class="review_btn">
																									<span><input type="button" onclick="location.href='answermodifyform.do?abno=${list.abno}&pseq=${pvo.pseq}'" value="수정"></span>
																									<span><input type="button" onclick="answer_deleteOpen(${list.abno}, ${pvo.pseq}, '${loginUser.id}', '${adminid}');" value="삭제"></span>
																							</div>
																					
																				</div>
																			</td>
																		</tr>
																	</c:otherwise>
																</c:choose>
																
																
																<c:set var="num" value="${num-1}" />
																</c:when>
																<c:otherwise>
																	<tr>
																	<td>${num}</td>
																	<c:choose>
																		<c:when test="${list.category == 1}">
																			<td>상품문의</td>
																		</c:when>
																		<c:when test="${list.category == 2}">
																			<td>배송문의</td>
																		</c:when>
																		<c:when test="${list.category == 3}">
																			<td>기타문의</td>
																		</c:when>
																	</c:choose>
																	<td>
																		<img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif" alt="비밀글" class="ec-common-rwd-image">
																		${list.qtitle }
																	</td>
																	<td>${list.qwriter}</td>
																	<td><fmt:parseDate var="regdate" value="${list.qregdate }" pattern="yyyy-MM-dd"/>
																		<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
																</tr>
																<c:choose>
																	<c:when test="${list.abno eq 0}">
																			
																		
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td></td>
																			<td></td>
																			<td style="padding-left:100px">
																				  <img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">
																				<img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif" alt="비밀글" class="ec-common-rwd-image">
																				${list.atitle }
																			</td>
																			<td>${list.awriter}</td>
																			<td><fmt:parseDate var="regdate" value="${list.aregdate }" pattern="yyyy-MM-dd"/>
																				<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/> </td>
																		</tr>
																	</c:otherwise>
																</c:choose>
																
																
																<c:set var="num" value="${num-1}" />
																</c:otherwise>
															</c:choose>
														</c:if>
														<c:if test="${list.secret == false }">
																	<tr class="item">
																	<td>${num}</td>
																	<c:choose>
																		<c:when test="${list.category == 1}">
																			<td>상품문의</td>
																		</c:when>
																		<c:when test="${list.category == 2}">
																			<td>배송문의</td>
																		</c:when>
																		<c:when test="${list.category == 3}">
																			<td>기타문의</td>
																		</c:when>
																	</c:choose>
																	<td>
																		${list.qtitle}
																	</td>
																	<td>${list.qwriter}</td>
																	<td><fmt:parseDate var="regdate" value="${list.qregdate }" pattern="yyyy-MM-dd"/>
																		<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/></td>
																</tr>
																	<tr class="hide">
																		<td colspan="5">
																			<div class="review_content_wrap">
																				<div class="review_content">
																					${list.qcontent }
																				</div>
																					<sec:authorize access="isAuthenticated()">
																						<sec:authentication property="principal.member.id" var="pinfo"/>
																						<c:if test="${list.qwriter eq pinfo || principal.member.authorities eq '[ROLE_ADMIN, ROLE_USER]'}">
																							<span><input type="button" onclick="location.href='/qna/questionmodify.do?qbno=${list.qbno}'" value="수정"></span>
																							<span><input type="button" onclick="question_deleteOpen(${list.qbno}, ${pseq}, '${pinfo}');" value="삭제"></span>
																						</c:if>
																					</sec:authorize>
																						<div class="review_btn">
																								<span><input type="button" onclick="location.href='/adm/answerwrite.do?qbno=${list.qbno}&pseq=${pseq}&ref=${list.ref}'" value="답글작성"></span>
																						</div>
																				
																			</div>
																		</td>
																	</tr>
															
																<c:choose>
																	<c:when test="${list.abno eq 0}">
																			
																		
																	</c:when>
																	<c:otherwise>
																		<tr class="item">
																			<td></td>
																			<td></td>
																			<td style="padding-left:100px">
																				  <img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">
																				${list.atitle}
																			</td>
																			<td>${list.awriter}</td>
																			<td><fmt:parseDate var="regdate" value="${list.aregdate }" pattern="yyyy-MM-dd"/>
																				<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/> </td>
																		</tr>
																		<tr class="hide">
																			<td colspan="5">
																				<div class="review_content_wrap">
																					<div class="review_content">
																						${list.acontent}
																					</div>
																							<div class="review_btn">
																									<span><input type="button" onclick="location.href='answermodifyform.do?abno=${list.abno}&pseq=${pvo.pseq}'" value="수정"></span>
																									<span><input type="button" onclick="answer_deleteOpen(${list.abno}, ${pvo.pseq}, '${loginUser.id}', '${adminid}');" value="삭제"></span>
																							</div>
																					
																				</div>
																			</td>
																		</tr>
																	</c:otherwise>
																</c:choose>
																
																
																<c:set var="num" value="${num-1}" />
														</c:if>
													</c:forEach>
															
														<c:if test="${empty qnalist }">
														<tr><td colspan="5">상품 문의가 없습니다</td></tr>
												</c:if>
											</tbody>
										</table>
										<sec:authorize access="isAnonymous()">
											<div class="review_btn pull-right">
													<span><input type="button" onclick="alert('로그인이 필요한 기능입니다');" value="글쓰기"></span>
											</div>
										</sec:authorize>
												
											<sec:authorize access="isAuthenticated()">
												<div class="review_btn pull-right">
													<span><input type="button" onclick="location.href='/qna/questionwrite.do?pseq=1'" value="글쓰기"></span>
												</div>
											</sec:authorize>
							     	</div>
							    </div>
							  </div>
							</div>
				</div><!-- 9 end -->
			</div>
		</div>
	</section>
	<!-- contents end-->
	<script>
	$(function(){ 

        var article = (".my_reviewtbl .my_show");  
        
        $(document).on('click', '.my_reviewtbl .item  td', function() { 

            var myArticle =$(this).parents().next("tr");  

            if($(myArticle).hasClass('hide')) {

                $(article).removeClass('my_show').addClass('hide');  

                $(myArticle).removeClass('hide').addClass('my_show');  

            }  

            else {  

                $(myArticle).addClass('hide').removeClass('my_show');  

            }  

        });
        
        
 		var article = (".my_qnatbl .my_show");  
        
        $(document).on('click', '.my_qnatbl .item  td', function() { 

            var myArticle =$(this).parents().next("tr");  

            if($(myArticle).hasClass('hide')) {

               

                $(myArticle).removeClass('hide').addClass('my_show');  

            }  

            else {  

                $(myArticle).addClass('hide').removeClass('my_show');  

            }  

        });
        
        
        $("#check_module").click(function () {
        	var IMP = window.IMP; // 생략가능
        	IMP.init('imp78738453');
        	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        	IMP.request_pay({
        	pg: 'inicis', // version 1.1.0부터 지원.
        	/*
        	'kakao':카카오페이,
        	html5_inicis':이니시스(웹표준결제)
        	'nice':나이스페이
        	'jtnet':제이티넷
        	'uplus':LG유플러스
        	'danal':다날
        	'payco':페이코
        	'syrup':시럽페이
        	'paypal':페이팔
        	*/
        	pay_method: 'card',
        	/*
        	'samsung':삼성페이,
        	'card':신용카드,
        	'trans':실시간계좌이체,
        	'vbank':가상계좌,
        	'phone':휴대폰소액결제
        	*/
        	merchant_uid: 'merchant_' + new Date().getTime(),
        	/*
        	merchant_uid에 경우
        	https://docs.iamport.kr/implementation/payment
        	위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
        	참고하세요.
        	나중에 포스팅 해볼게요.
        	*/
        	name: "${pvo.name}",
        	//결제창에서 보여질 이름
        	amount: "${pvo.price2}",
        	//가격
        	buyer_email: '${sessionScope.loginUser.email}',
        	buyer_name: '${sessionScope.loginUser.name}',
        	buyer_tel: '${sessionScope.loginUser.phone}',
        	buyer_addr: '${sessionScope.loginUser.address1}',
        	buyer_postcode: '${sessionScope.loginUser.zip_num}',
        	m_redirect_url: 'main.do'
        	/*
        	모바일 결제시,
        	결제가 끝나고 랜딩되는 URL을 지정
        	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
        	*/
        	}, function (rsp) {
        	console.log(rsp);
        	if (rsp.success) {
        	var msg = '결제가 완료되었습니다.';
        	msg += '고유ID : ' + rsp.imp_uid;
        	msg += '상점 거래ID : ' + rsp.merchant_uid;
        	msg += '결제 금액 : ' + rsp.paid_amount;
        	msg += '카드 승인번호 : ' + rsp.apply_num;
        	goOrderOneInsert();
        	} else {
        	var msg = '결제에 실패하였습니다.';
        	msg += '에러내용 : ' + rsp.error_msg;
        	}
        	alert(msg);
        	});
        	});
});  

	</script>
<%@ include file = "../footer.jsp" %>
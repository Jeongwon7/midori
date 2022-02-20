<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
	<!-- contents -->
	<section class="product">
		<div class="container">
			<div class="row">
				<div class="col-md-9 newitem">
					<form method="post" name="formm" action="/order/orderinfo.do">
						<input type="hidden" name="pseq" value="1">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
											<button type="submit" class="btn btn-danger">구매하기</button><!-- onclick="goOrderOneInsert()"-->
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
																			<c:if test="${rlist.writer eq pinfo}">
																				<div class="review_btn">
																					<span><input type="button" onclick="location.href='/review/reviewmodify.do?rbno=${rlist.rbno}'" value="수정"></span>
																				</div>
																			</c:if>
																			<c:if test="${rlist.writer eq pinfo || pinfo eq 'admin'}">
																				<div class="review_btn">
																					<span><input type="button" onclick="review_delete(${rlist.rbno}, ${pseq}, '${pinfo}');" value="삭제"></span>
																				</div>
																			</c:if>
																		</sec:authorize>
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
											<sec:authentication property="principal.member.id" var="pinfo"/>
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
																						<c:if test="${list.qwriter eq pinfo}">
																							<span><input type="button" onclick="location.href='/qna/questionmodify.do?qbno=${list.qbno}'" value="수정"></span>
																						</c:if>
																						<c:if test="${list.qwriter eq pinfo || pinfo eq 'admin'}">
																							<span><input type="button" onclick="question_deleteOpen(${list.qbno}, ${pseq}, '${pinfo}');" value="삭제"></span>
																						</c:if>
																					</sec:authorize>
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
																						<c:if test="${pinfo eq 'admin'}">
																							<div class="review_btn">
																									<span><input type="button" onclick="location.href='/adm/answermodify.do?abno=${list.abno}'" value="수정"></span>
																									<span><input type="button" onclick="answer_delete(${list.abno}, ${list.qbno})" value="삭제"></span>
																							</div>
																						</c:if>
																				</div>
																			</td>
																		</tr>
																	</c:otherwise>
																</c:choose>
																
																
																<c:set var="num" value="${num-1}" />
																</c:when>
																<c:otherwise>
																	<tr class="lock">
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
																						<c:if test="${list.qwriter eq pinfo}">
																							<span><input type="button" onclick="location.href='/qna/questionmodify.do?qbno=${list.qbno}'" value="수정"></span>
																							
																						</c:if>
																						<c:if test="${list.qwriter eq pinfo || pinfo eq 'admin'}">
																							<span><input type="button" onclick="question_deleteOpen(${list.qbno}, ${pseq}, '${pinfo}');" value="삭제"></span>
																						</c:if>
																					</sec:authorize>
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
																						<c:if test="${pinfo eq 'admin'}">
																							<div class="review_btn">
																									<span><input type="button" onclick="location.href='/adm/answermodify.do?abno=${list.abno}'" value="수정"></span>
																									<span><input type="button" onclick="answer_delete(${list.abno}, ${list.qbno})" value="삭제"></span>
																							</div>
																						</c:if>
																					
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
        
        $(document).on('click', '.lock td', function() { 
        	alert("비밀글은 작성자만 읽을 수 있습니다");
        	
        });
        
        
     
});  

	function answer_delete(abno, qbno){
		var msg = confirm("답변을 삭제하시겠습니까?");
		if(msg){
			alert("삭제되었습니다");
			location.href="/adm/answerdelete.do?qbno="+qbno+"&abno="+abno;
		}
	}
	</script>
<%@ include file = "../footer.jsp" %>
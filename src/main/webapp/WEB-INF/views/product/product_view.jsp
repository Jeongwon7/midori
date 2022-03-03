<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../header.jsp" %>
	
   <link rel="stylesheet" href="../resources/assets/css/product.css">


   <!-- single product -->
         <div class="col-md-9 newitem" >
          <form id="ofrm" method="post" name="formm" >
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input type="hidden" name="pseq" value="${plist.pseq}">
            <sec:authorize access="isAuthenticated()">
                  <sec:authentication property="principal.member.id" var="pinfo"/>
               </sec:authorize>
               <input type="hidden" name="id" value="${pinfo}">
             <div class="container">
                <div class="row">
                   <div class="col-md-5">
                    <img src="${pageContext.request.contextPath}/upload/${plist.image}" alt="">
                   </div>
                   <div class="col-md-5" style="padding-left:40px;">
                      <div class="goods_name">
                         <strong class="name">${plist.name}</strong>
                        <!-- <span class="short_desc">${plist.content}</span> -->
                      </div>
                      <p class="goods_dcinfo">판매가격</p>
                       <span class="position">
                         <span class="dc">
                            <span class="dc_price information">
                              <span class="${plist.price2}"></span>  
                              <fmt:formatNumber value="${plist.price2}"/>
                              <span class="won">원</span>
                            </span>
                         </span>   
                       </span>
                      <div class="good_info">
                       <dl class="list fst">
                         <dt class="tit">판매 단위</dt>
                         <dd class="desc">1팩</dd>
                       </dl>
                       <dl class="list">
                         <dt class="tit">중량/용량</dt>
                         <dd class="desc">1,022g</dd>
                       </dl>
                       <dl class="list">
                         <dt class="tit">배송구분</dt>
                         <dd class="desc">택배배송</dd>
                       </dl>
                       <dl class="list">
                         <dt class="tit">포장타입</dt>
                         <dd class="desc">냉동/스티로폼</dd>
                       </dl>
                       <dl class="list">
                         <dt class="tit">유통기한</dt>
                         <dd class="desc">출고일 기준,유통기한 만기 185일 이상 남은 상품을 보내드립니다.</dd>
                       </dl>
                      </div>
                      <div class="cart_type2">
                        <span class="tit_item">
                            구매수량
                        </span>
                         <span class="count">
                             <button class="btn7 down on minus" type="button">-</button>
                            <input type="text" name="quantity" class="quantity" value="1" readonly>
                            <button class="btn7 up on plus" type="button">+</button>

                         </span>
                      </div>
                      <div class="total1">
                       <div class="price">
                         <strong class="tit">총 상품금액 : </strong>
                         <span class="sum">
                          <span class="num">
                           <span class="total"></span>
                          </span>
                          <span class="won">원</span>
                         </span>
                        </div>
                        <span class="not_login">
                        <span>비회원인 경우, 회원가입후 구매해주시기 바랍니다.</span>
                      </span>
                       </div>
                       <div class="cart_footer">
                        <div class="button_wrap">
                         <p class="buy">
                           <a href="#" class="first" onclick="return chk_formm()">구매하기</a>
                         </p>
                         <p class="cart">
                          <a href="#" class="first" onclick="goCart()">장바구니</a>
                          </p>
                        </div>
                       </div>
                   </div>
                </div>
                  </div>
                 </form>
                 </div>

    			 <div class="goods-view-area">
    			  <div class="goods-view-infomation">
    			   <div class="goods-view-tab" role="tabpanel">
    			    <ul class="nav nav-tabs infomation-tab-group" role="tablist">
    			     <li class="infomation-tab actice" role="presentation">
    			      <a href="#productview" class="infomation-tab-anchor" aria-controls="productview" role="tab" data-toggle="tab">상품 설명</a>
    			     </li>
    			     <li class="infomation-tab" role="presentation">
    			      <a href="#kcal" class="infomation-tab-anchor" aria-controls="kacl" role="tab" data-toggle="tab">상세 정보</a>
    			     </li>
    			      <li class="infomation-tab" role="presentation">
    			      <a href="#review" class="infomation-tab-anchor" aria-controls="review" role="tab" data-toggle="tab">후기</a>
    			     </li>
    			      <li class="infomation-tab" role="presentation">
    			      <a href="#qna" class="infomation-tab-anchor" aria-controls="qna" role="tab" data-toggle="tab">문의</a>
    			     </li>
    			    </ul>
    			    <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="productview">
					    	<div>
					                   ${plist.content}
					    	</div>
					    </div>
					    <div role="tabpanel" class="tab-pane" id="kcal">
						    <div>
						          칼로리
						    </div>	 
					    </div>
					    <div role="tabpanel" class="tab-pane" id="review">
						   <div class="board">
							<div class="title_txt">
							  <h2>상품 후기</h2>
							  <div class="sort-wrap">
							   <ul class="list_type1 old">
							    <li>
							     <p class="txt">상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 삭제처리 될 수 있습니다.</p>
							    </li>
							    <li>
							      <p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 
							       <a href="/sub/read.do#qna" onclick=""class="emph">문의게시판</a>에 남겨주시기 바랍니다.</p> 
							    </li>
							   </ul> 
							  </div>
							</div>
							<div class="review-list">
							  <table class="board-listheader" style="width:100%;">
							   <colgroup>
								 <col style="width:70px;">
								 <col style="width:auto;">
								 <col style="width:60px;">
							     <col style="width:120px;">
								 <col style="width:100px;">
							  </colgroup>
							  <thead class="review-thead">
								<tr>
								 <th scope="col" class="input_txt">번호</th>
								 <th scope="col" class="input_txt">제목</th>
								 <th scope="col" class="input_txt">평점</th>
							     <th scope="col" class="input_txt">작성자</th>
							     <th scope="col" class="input_txt">작성일</th>
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
																			<span><input type="button" onclick="review_delete(${rlist.rbno}, ${plist.pseq}, '${pinfo}');" value="삭제"></span>
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
					    </div>
					    <div role="tabpanel" class="tab-pane" id="qna">
						 <div class="board">
						  <div class="title_txt">
							  <h2>상품 문의</h2>
							  <div class="sort-wrap">
							   <ul class="list_type1 old">
							    <li>
							     <p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 삭제처리 될 수 있습니다.</p>
							    </li>
							   </ul>
							  </div>
							</div>
							<div class="qna-list">
							 <table class="qna-listheader" style="width:100%;">
						      <colgroup>
						       <col style="width:110px;">
						       <col style="width:100px;">
						       <col style="width:auto;">
						       <col style="width:140px;">
						       <col style="width:100px;">
						      </colgroup>
						     <thead class="qna-thead">
						       <tr>
						        <th scope="col" class="input_txt">번호</th>
						        <th scope="col" class="input_txt">카테고리</th>
						        <th scope="col" class="input_txt">제목</th>
						        <th scope="col" class="input_txt">작성자</th>
						        <th scope="col" class="input_txt">작성일</th>
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
																						<c:if test="${list.qwriter eq pinfo}">
																							<span><input type="button" onclick="location.href='/qna/questionmodify.do?qbno=${list.qbno}'" value="수정"></span>
																						</c:if>
																						<c:if test="${list.qwriter eq pinfo || pinfo eq 'admin'}">
																							<span><input type="button" onclick="question_deleteOpen(${list.qbno}, ${plist.pseq}, '${pinfo}');" value="삭제"></span>
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
																									<span><input type="button" onclick="location.href='/adm/answermodify.do?abno=${list.abno}&qbno=${list.qbno}'" value="수정"></span>
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
																							<span><input type="button" onclick="question_deleteOpen(${list.qbno}, ${plist.pseq}, '${pinfo}');" value="삭제"></span>
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
																									<span><input type="button" onclick="location.href='/adm/answermodify.do?abno=${list.abno}&qbno=${list.qbno}'" value="수정"></span>
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
											<div class="review_btn float-right">
													<span><input type="button" onclick="alert('로그인이 필요한 기능입니다');" value="글쓰기"></span>
											</div>
										</sec:authorize>
												
											<sec:authorize access="isAuthenticated()">
												<div class="review_btn float-right">
													<span><input type="button" onclick="location.href='/qna/questionwrite.do?pseq=${plist.pseq}'" value="글쓰기"></span>
												</div>
											</sec:authorize>
							</div>
						 </div>
					   </div>
					  </div>
    			   </div>
    			  </div>
    			 </div>
    		  </div><!-- 9 end -->
			</div>
		</div>
	
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<p>Copyrights &copy; 2019 - <a href="https://imransdesign.com/">Imran Hossain</a>,  All Rights Reserved.<br>
						Distributed By - <a href="https://themewagon.com/">Themewagon</a>
					</p>
				</div>
				<div class="col-lg-6 text-right col-md-12">
					<div class="social-icons">
						<ul>
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end copyright -->
	<script>
	$(function(){ 

		//board-listheader 테이블 태그에
        var article = (".board-listheader .my_show");  
        
        $(document).on('click', '.board-listheader .item  td', function() { 

            var myArticle =$(this).parents().next("tr");  

            if($(myArticle).hasClass('hide')) {

                $(article).removeClass('my_show').addClass('hide');  

                $(myArticle).removeClass('hide').addClass('my_show');  

            }  

            else {  

                $(myArticle).addClass('hide').removeClass('my_show');  

            }  

        });
        
        
 		var article = (".qna-listheader .my_show");  
        
        $(document).on('click', '.qna-listheader .item  td', function() { 

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
	
	function chk_formm() {
		var form = document.getElementById('ofrm');
		form.action = "/order/orderinfo.do";
		form.submit();
	}
	
	function goCart(){
		var form = document.getElementById('ofrm');
		form.action = "/mypage/cartInsert.do";
		form.submit();
	}
	</script>

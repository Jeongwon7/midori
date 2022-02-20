function question_save() {
	var theForm = document.qafrm;
	
	if(!theForm.qtitle.value){
		alert("제목 입력하세요");
		theForm.qtitle.focus();
	}else if(theForm.category.value == 0){
		alert("문의 분류를 선택해주세요");
	}else if(!theForm.qcontent.value){
		alert("내용 입력하세요");
		theForm.qcontent.focus();
	}else{
		//theForm.encoding = "multipart/form-data";
		
		theForm.action = "/qna/questionwritepro.do";
		theForm.submit();
	}
}

function question_modify(){
	var theForm = document.qfrm;
	
	if(!theForm.qtitle.value){
		alert("제목 입력하세요");
		theForm.qtitle.focus();
	}else if(theForm.category.value == 0){
		alert("문의 분류를 선택해주세요");
	}else if(!theForm.qcontent.value){
		alert("내용 입력하세요");
		theForm.qcontent.focus();
	}else{
		//theForm.encoding = "multipart/form-data";
		theForm.action = "/qna/questionmodifypro.do";
		theForm.submit();
	}
}

function answer_save(){
	var theForm = document.qafrm;
	
	if(!theForm.atitle.value){
		alert("제목 입력하세요");
		theForm.atitle.focus();
	}else if(!theForm.awriter.value){
		alert("작성자 입력하세요");
		theForm.awriter.focus();
	}else if(!theForm.acontent.value){
		alert("내용 입력하세요");
		theForm.acontent.focus();
	}else{
		//theForm.encoding = "multipart/form-data";
		theForm.action = "/adm/answerwritepro.do";
		theForm.submit();
	}
}




function question_deleteOpen(qbno, pseq, logId){
	var msg = confirm("삭제하시겠습니까?");
	if(msg == true){
		question_delete(qbno, pseq, logId);
	}
}
function question_delete(qbno, pseq, logId){
	$.ajax({
		url:"/qna/questiondelete.do",
		type:"get",
		data:{"qbno":qbno},
		success:function(){
			alert("삭제되었습니다");
			getQnaList(pseq, logId);
		},
		error:function(error){
			alert("통신실패");
		}
	});
}


function answer_deleteOpen(abno, pseq, logId, adminId){
	var msg = confirm("삭제하시겠습니까?");
	if(msg == true){
		answer_delete(abno, pseq, logId, adminId);
	}
}


function answer_delete(abno, pseq, logId, adminId){
	$.ajax({
		url:"answerdelete.do",
		type:"post",
		data:{abno:abno},
		success:function(result){
			alert("삭제되었습니다");
			getQnaList(pseq, logId, adminId);
		},
		error:function(error){
			alert("통신실패");
		}
	});
}

function getQnaList(pseq, logId){
	
	var output="";
	
	$.ajax({
		type:'get',
		url:'/product/getQnaAjax.do?pseq='+pseq,
		dataType:'json',
		success:function(result){
			var num = result.length;
			if(result.length == 0){
				output += '<tr><td colspan="5">상품 문의가 없습니다</td></tr>';
			}else{
				for(var i in result){
					if(result[i].secret == true){
						if(result[i].qwriter == logId || logId == 'admin'){
								output += '<tr class="item">';
								output += '<td>'+num+'</td>';
								if(result[i].category == 1 ){
									output += '<td>상품문의</td>';
								}else if(result[i].category == 2){
									output += '<td>배송문의</td>';
								}else{
									output += '<td>기타문의</td>';
								}
								output += '<td>'+result[i].qtitle+'</td>';
								output += '<td>'+result[i].qwriter+'</td>';
								output += '<td>'+result[i].qregdate.substring(0,10)+'</td>';
								output += '</tr>';
								output += '<tr class="hide">';
								output += '<td colspan="5">';
								output += '<div class="review_content_wrap">';
								output += '<div class="review_content">'+result[i].qcontent+'</div>';
								output += '<div class="review_btn">';
								if(result[i].qwriter == logId ){
									output += '<span><input type="button" '+'onclick='+'"'+'location.href='+"'"+'/qna/questionmodify.do?qbno='+result[i].qbno+"'"+'"'+' value="수정"></span>';
								}
								if(result[i].qwriter == logId || logId == 'admin'){
									output += '<span><input type="button" '+'onclick='+'"'+'question_deleteOpen('+result[i].qbno+', '+result[i].pseq+', '+"'"+logId+"'"+');'+ '"'+'value="삭제"></span>';
								}
								output += '</div>';
								output += '</div>';
								output += '</td>';
								output += '</tr>';
									if(result[i].abno == 0){
										
									}else{
									output +=' <tr class="item">';
									output += '<td></td>';
									output += '<td></td>';
									output += '<td style="padding-left:100px">';
									output += '<img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">';
									output += result[i].atitle+'</td>';
									output += '<td>'+result[i].awriter+'</td>';
									output += '<td>'+result[i].aregdate.substring(0,10)+'</td>';
									output += '</tr>';
									output += '<tr class="hide">';
									output += '<td colspan="5">';
									output += '<div class="review_content_wrap">';
									output += '<div class="review_content">'+result[i].acontent+'<div>';
									output += '<div class="review_btn">';
									if(logId == 'admin'){
										output += '<span><input type="button" '+'onclick='+'" '+'location.href='+"'"+'/adm/answermodify.do?abno='+result[i].abno+"'"+'"'+' value="수정"></span>';
										output += '<span><input type="button" '+'onclick='+'" '+'answer_delete('+result[i].abno+', '+ result[i].qbno+');" value="삭제"></span>';
									}
									
									output += '</div>';
									output += '</div>';
									output += '</td>';
									output += '</tr>';
									
								
									output += '<c:set var="num" value="${num-1}" />';
									}//답변 존재하지 않을 경우 if end
									num = num -1;
						
						}else{
								output += '<tr>';
								output += '<td>'+num+'</td>';
								if(result[i].category == 1 ){
									output += '<td>상품문의</td>';
								}else if(result[i].category == 2){
									output += '<td>배송문의</td>';
								}else{
									output += '<td>기타문의</td>';
								}
								output += '<td> <img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif" alt="비밀글" class="ec-common-rwd-image">'+result[i].qtitle+'</td>';
								output += '<td>'+result[i].qwriter+'</td>';
								output += '<td>'+result[i].qregdate.substring(0,10)+'</td>';
								output += '</tr>';
									if(result[i].abno == 0){
										
									}else{
									output +=' <tr>';
									output += '<td></td>';
									output += '<td></td>';
									output += '<td style="padding-left:100px">';
									output += '<img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">';
									output += '<img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif" alt="비밀글" class="ec-common-rwd-image">';
									output += result[i].atitle+'</td>';
									output += '<td>'+result[i].awriter+'</td>';
									output += '<td>'+result[i].aregdate.substring(0,10)+'</td>';
									output += '</tr>';
								
									}//답변 존재하지 않을 경우 if end
									num = num -1;
						}					
					}else{//공개글
							output += '<tr class="item">';
							output += '<td>'+num+'</td>';
							if(result[i].category == 1 ){
								output += '<td>상품문의</td>';
							}else if(result[i].category == 2){
								output += '<td>배송문의</td>';
							}else{
								output += '<td>기타문의</td>';
							}
							output += '<td>'+result[i].qtitle+'</td>';
							output += '<td>'+result[i].qwriter+'</td>';
							output += '<td>'+result[i].qregdate.substring(0,10)+'</td>';
							output += '</tr>';
							output += '<tr class="hide">';
							output += '<td colspan="5">';
							output += '<div class="review_content_wrap">';
							output += '<div class="review_content">'+result[i].qcontent+'</div>';
							output += '<div class="review_btn">';
							if(result[i].qwriter == logId ){
								output += '<span><input type="button" '+'onclick='+'"'+'location.href='+"'"+'/qna/questionmodify.do?qbno='+result[i].qbno+"'"+'"'+' value="수정"></span>';
							}
							if(result[i].qwriter == logId || logId == 'admin'){
								output += '<span><input type="button" '+'onclick='+'"'+'question_deleteOpen('+result[i].qbno+', '+result[i].pseq+', '+"'"+logId+"'"+');'+ '"'+'value="삭제"></span>';
							}
							output += '</div>';
							output += '</div>';
							output += '</td>';
							output += '</tr>';
								if(result[i].abno == 0){
									
								}else{
								output +=' <tr class="item">';
								output += '<td></td>';
								output += '<td></td>';
								output += '<td style="padding-left:100px">';
								output += '<img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">';
								output += result[i].atitle+'</td>';
								output += '<td>'+result[i].awriter+'</td>';
								output += '<td>'+result[i].aregdate.substring(0,10)+'</td>';
								output += '</tr>';
								output += '<tr class="hide">';
								output += '<td colspan="5">';
								output += '<div class="review_content_wrap">';
								output += '<div class="review_content">'+result[i].acontent+'<div>';
								output += '<div class="review_btn">';
								if(logId == 'admin'){
										output += '<span><input type="button" '+'onclick='+'" '+'location.href='+"'"+'/adm/answermodify.do?abno='+result[i].abno+"'"+'"'+' value="수정"></span>';
										output += '<span><input type="button" '+'onclick='+'" '+'answer_delete('+result[i].abno+', '+ result[i].qbno+');" value="삭제"></span>';
								}
								
								output += '</div>';
								output += '</div>';
								output += '</td>';
								output += '</tr>';
								
							}//else 
							num = num -1;
					}				
				
				}//for
			
			}//else
			
			$(".qna_box").html(output);
		},
		error:function(error){
			alert("통신에러");
		}
	})
}









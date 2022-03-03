function review_modify(){
	var theForm = document.rvfrm;
	
	if(!theForm.title.value){
		alert("제목 입력하세요");
		theForm.title.focus();
	}else if(!theForm.star.value){
		alert("별점을 매겨주세요");
	}else if(!theForm.content.value){
		alert("내용 입력하세요");
		theForm.content.focus();
	}else{
		//theForm.encoding = "multipart/form-data";
		theForm.action = "/review/reviewmodifypro.do";
		theForm.submit();
	}
}

function review_modifyOpen(rbno){
	location.href="/review/reviewmodify.do?rbno="+rbno;
}

function review_delete(rbno, pseq, logId){
	var msg = confirm("삭제하시겠습니까?");
	if(msg == true){
		review_deletePro(rbno, pseq, logId);
	}
}

function review_deletePro(rbno, pseq, logId){
		 var sendData = {"rbno":rbno};
		 $.ajax({
             url: "/review/reviewdelete.do",
             type: "get",
             data:sendData,
             success:function(){
                 alert("삭제되었습니다");
				 getReview(pseq, logId);
             },
             error:function(error){
                 alert("통신실패");
             }
             
         });
	}
	
function getReview(pseq, logId){
	
	var output="";
	
	$.ajax({
		type:'get',
		url:'/product/getReviewAjax.do',
		data: {"pseq":pseq},
		dataType:"json",
		success:function(result){
			//alert("성공");
			var num = result.length;
			if(result.length == 0){
			 	output += '<tr><td colspan="5">리뷰가 없습니다</td></tr>';
			}else{
					for(var i in result){
			
						output += '<tr class="item">';
						output += '<td>'+num+'</td>';
						output += '<td>'+result[i].title+'</td>';
						output += '<td>';
						output += '<div class="star-ratings">';
						output += '<div class="star-ratings-fill space-x-2 text-lg">';
						if(result[i].star == 5 ){
							output += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
						}else if(result[i].star == 4){
							output += '<span>★</span><span>★</span><span>★</span><span>★</span>';
						}else if(result[i].star == 3){
							output += '<span>★</span><span>★</span><span>★</span>';
						}else if(result[i].star == 2){
							output += '<span>★</span><span>★</span>';
						}else {
							output += '<span>★</span>';
						}
						output += '</div>';
						output += '<div class="star-ratings-base space-x-2 text-lg">';
						output += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>';
						output += '</div>';
						output += '</div>';
						output += '</td>';
						output += '<td>'+result[i].writer+'</td>';
						output += '<td>'+result[i].regdate.substring(0,10)+'</td>';
						output += '</tr>';
						output += '<tr class="hide">';
						output += '<td colspan="5">';
						output += '<div class="review_content_wrap">';
						output += '<div class="review_content">'+result[i].content+'</div>';
						output += '<div class="review_btn">';
						if(result[i].writer == logId){
							output += '<span>';
							output += '<input type="button" value="수정" onclick="review_modifyOpen('+result[i].rbno+');">';
							output += '</span>';
						}
						if(result[i].writer == logId || logId == 'admin'){
							output += '<span>';
							output += '<input type="button" value="삭제" onclick="review_delete('+result[i].rbno +','+ result[i].pseq +', '+"'"+logId+"'"+');" >';
							output += '</span>';
						}
						output += '</div>';
						output += '</div>';
						output += '</td>';
						output += '</tr>'
						output += '</div>';
						num = num -1;
				}
					$(".review_box").html(output);
			}//else
			
		},error:function(error){
			alert("통신에러");
		}
	})
	
}

function review_save(){
	var theForm = document.rvfrm;
	
	if(!theForm.title.value){
		alert("제목 입력하세요");
		theForm.title.focus();
	}else if(!theForm.star.value){
		alert("별점을 매겨주세요");
	}else if(!theForm.content.value){
		alert("내용 입력하세요");
		theForm.content.focus();
	}else{
	//theForm.encoding = "multipart/form-data";
	//	theForm.method = "post";
		theForm.action = "/review/reviewwritepro.do";
	//	alert("먹음");
		theForm.submit();
	}
}

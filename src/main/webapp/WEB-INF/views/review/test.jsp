<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div class="col-md-9 newitem">
				  <h2>Review Writing (후기 작성)</h2>
					<form class="form-horizontal" name="rvfrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="pseq" value="${pseq}">
					 <div class="form-group">
					    <label for="title" class="col-sm-2 control-label">제목</label>
					    <div class="col-sm-10">
					      <input type="text" name="title" class="form-control" id="title" placeholder="제목 입력">
					    </div>
					 </div>
					 <div class="form-group">
					    <label for="writer" class="col-sm-2 control-label">글쓴이</label>
					    <div class="col-sm-10">
					      <input type="text" name="writer" class="form-control" id="writer" placeholder="글쓴이 입력">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="rating" class="col-sm-2 control-label">별점</label>
						  <div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars" name="star" value="5" />
							<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="star" value="4"/>
							<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="star" value="3"/>
							<label for="3-stars" class="star">★</label>
							<input type="radio" id="2-stars" name="star" value="2"/>
							<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star" name="star" value="1" />
							<label for="1-star" class="star">★</label>
						</div>
					</div>
					   <div class="form-group">
					    <label for="content" class="col-sm-2 control-label">내용</label>
					    <div class="col-sm-10">
					      <textarea name="content" class="form-control" rows="10"></textarea><!-- id="summernote" -->
					    </div>
					  </div>
					    <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="button" class="btn btn-default" onclick="review_save()">리뷰등록</button>
					       <button type="button" class="btn btn-default" onclick="history.back();">목록으로</button>
					    </div>
					  </div>
					</form>
				</div>
</body>
</html>
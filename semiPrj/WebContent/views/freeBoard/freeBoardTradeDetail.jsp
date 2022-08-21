<%@page import="com.kh.freeboard.vo.FreeBoardTradeRepleVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.freeboard.vo.FreeBoardTradeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FreeBoardTradeVo fbvo = (FreeBoardTradeVo)request.getAttribute("fbvo");
	List<FreeBoardTradeRepleVo> fbrvoList = (List<FreeBoardTradeRepleVo>)request.getAttribute("fbrvoList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	/* 제일큰틀 */
	#freeboard-trade-detail-outer{
		border: 1px solid red;
        height: auto;
	}

	
	#fb_img{
        display: flex;
        height: 28%;
        margin: 0 auto;
		padding: 0px;
        border: 1px solid red;
    }


	#fb_info{
		display: flex;
        height: 5%;
        border: 1px solid red;
    }


	#fb_section{
        height: auto;
        margin: 0 auto;
		padding: 0px;
        border: 1px solid red;
		vertical-align: baseline;
    }

	#fb_reple{
		display: flex;
		flex-direction: column;
		flex-wrap: nowrap;
        height: auto;
        border: 3px solid blue;
    }
    
    #fb_my_reple{
    	display: flex;
		flex-direction: column;
    	height:100px;
    	width:100%;
    	border: 1px solid red;
    }

	/* 2차 틀 */
	#fb_img>div{
		margin: 0 auto;
		padding: 0px;
        height: 100%;
        border: 2px solid darkred;
    }

	/* 꾸미기 */

	#fbt-div-outer{
		margin: 0 auto;
		height: 100%;
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: space-between;
		border: 1px solid brown;
	}


	#fbt-left-div{
		display: flex;
		margin-left: 8px;
		border: 1px solid blue;
		flex-direction: column;
	}


	#fbt-right-div{
		display: flex;
		margin-right: 8px;
		border: 1px solid blue;
		flex-direction: column;
	}



	/* 보더라인 */
	.fbt-top-line{
		width: 100%;
        height: 1%;
		background-color: rgb(240, 225, 203);
        margin-bottom: 1%;
        margin-top: 1%;
	}


	/*  */

		
	.fb2-story-date{
		font-size: 2rem;
		margin-top: 6px;
		color: darkgray;
		height: 8%;
		border: 1px solid red;
	}

	#fb2-story-content{
		font-size :1.5rem;
		height: auto;
		width: 100%;
	}

	/* 리플창 */
	.select-reple{
		width: 100%;
		height: 100px;
		border: 1px solid pink;
	}


		
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>	
	
	<h1> 여기는 중고거래게시판 상세보기 게시판</h1>
	<div id="freeboard-trade-detail-outer" class="container">


		<div id="fb_img" class="container">
			<!-- Carousel -->
			<div id="demo" class="carousel container " data-bs-ride="carousel">
	
				<!-- Indicators/dots -->
				<div class="carousel-indicators container">
					<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
					<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
					<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
				</div>
					
				<!-- The slideshow/carousel -->
				<div class="carousel-inner container" style="width: 100%; height:600px;">
					<div class="carousel-item active">
							<img  src="<%=contextPath %>/resource/img/gsTest1.jpg" class="img-thumbnail" alt="Los Angeles" class="d-block" style="width:100%;">
					</div>
					<div class="carousel-item">
							<img  src="<%=contextPath %>/resource/img/gsTest2.jpg" class="img-thumbnail" alt="Chicago" class="d-block" style="width:100%; ">
					</div>
					<div class="carousel-item">
							<img  src="<%=contextPath %>/resource/img/gsTest3.jpg" class="img-thumbnail" alt="New York" class="d-block" style="width:100%; ">
					</div>
				</div>
					
				<!-- Left and right controls/icons -->
				<button class="carousel-control-prev container" type="button" data-bs-target="#demo" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>

				<button class="carousel-control-next container" type="button" data-bs-target="#demo" data-bs-slide="next">
					<span class="carousel-control-next-icon"></span>
				</button>
			</div>

		</div>

		<!-- 선추가 -->
		<div class="fbt-top-line"></div>


		<div id="fb_info" class="container">

			<div id="fbt-div-outer">

				<div id="fbt-left-div">
					<div id="userId" >작성자 :<%= fbvo.getWriter() %></div>
					<div id="userGrade">회원등급 : <%= fbvo.getCnt() %></div>
				</div>



				<div id="fbt-right-div">
					<div id="count">조회수 : <%= fbvo.getCnt() %></div>
					<div id="update_date"> 작성일자 : <%= fbvo.getEnrollDate() %></div>
				</div>

			</div>

		</div>

		<!-- 선추가 -->
		<div class="fbt-top-line"></div>

		<div id="fb_section" class="container">


					<p style="font-size: 3rem;">제목 : <%= fbvo.getTitle() %></p>
					<textarea cols="50" rows="15" name="" id="fb2-story-content" >내용 :<%= fbvo.getContent() %> 
					</textarea>
					<p class="fb2-story-date">작성시간 : <%= fbvo.getEnrollDate() %></p>
					<p class="fb2-story-date">조회 수 : <%= fbvo.getCnt() %></p>
					
					
					
					<!-- 로그인한 사람과 현재 보는 글 보는 사람이 같으면 수정 / 삭제 버튼 보이도록 해주기  -->
					<%-- <%if( loginMember != null && fvo.getWriter().equals(loginMember.getName()) ){ %> --%>
						<a href="<%= contextPath %>/freeBoard/trade/edit?num=<%=fbvo.getNo()%>"  class="btn btn-warning">수정하기</a>
						<a href="<%= contextPath %>/freeBoard/trade/delete?num=<%=fbvo.getNo()%>"  class="btn btn-warning">삭제하기</a>
					<%-- <%} %> --%>
			
			

		</div>


		<!-- 선추가 -->
		<div class="fbt-top-line"></div>

		<div id="fb_reple" class="container">

			<!-- 작성된 댓글 가져와서 보여주기 -->
			<div class="select-reple">

				<div class="reple-id"><p >작성자 id</p></div>
				<div class="reple-comment"><p >작성내용 </p></div>
				<div class="reple-sub"><span>작성일자</span> <a>답글쓰기</a></div>

			</div>
	
	
			<%for( FreeBoardTradeRepleVo fbr : fbrvoList ) {%>			
				<div class="select-reple">
	
					<div class="reple-id"><p ><%= fbr.getWriter() %></p></div>
					<div class="reple-comment"><p ><%= fbr.getContent() %> </p></div>
					<div class="reple-sub"><span><%= fbr.getEnrollDate() %></span> <a>답글쓰기</a></div>
	
				</div>
			<%} %>

			
		</div>
		
		
		<!-- 선추가 -->
		<div class="fbt-top-line"></div>
		<!-- 내가 댓글작성하기 -->
		<div class="container mt-3">
			<h2>댓글 작성하기</h2>
			<p>로그인안햇으면 오류남 - 있을때 없을때 구분해야할 듯 밑에 HIDDEN 벨류도 조절 필요<%-- <%=loginMember.getName() %> --%> </p>
			<form action="<%=contextPath%>/freeBoard/trade/reple/insert" method="post">
				<div class="mb-3 mt-3">
						<input type="hidden" name="num" value="<%= fbvo.getNo() %>" >
							<input type="hidden" name="loginName" value="admin<%-- <%=loginMember.getName()%> --%>">
						<label for="comment">Comments:</label>
						<textarea class="form-control" rows="5" id="comment" name="content"></textarea>
				</div>
			<button type="submit" class="btn btn-primary">댓글등록하기</button>
			</form>
	</div>


		
	</div>

	<%@ include file="/views/common/footer.jsp" %>


</body>
</html>
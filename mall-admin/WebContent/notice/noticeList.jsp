<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

<%
	if (session.getAttribute("loginAdminId") == null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noticeList.jsp</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%
			// 요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			int currentPage = 1;	// 기본적으로 1페이지 표시하기 위함 (현재 페이지)
			
			if (request.getParameter("currentPage") != null) { // null인지 아닌지 체크
				currentPage = Integer.parseInt(request.getParameter("currentPage"));	// currentPage를 파라미터 값으로 변경
			}
			
			int rowPerPage = 10; // 한 페이지당 데이터를 표시할 개수
		
			int limit1 = (currentPage - 1) * rowPerPage;
	        int limit2 = rowPerPage;
		
			// 공지사항 객체 생성
			NoticeDao noticeDao = new NoticeDao();
	        
	        // Index 공지사항 리스트
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList(limit1, limit2);
		%>
	
		<div class="container">
			
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>공지사항 목록</h1>
				<p>공지사항을 관리하는 페이지입니다. 공지사항 조회, 등록, 수정, 삭제가 가능합니다.</p>
			</div>
			
			<div>
				<button type="button" class="btn btn-dark" style="float: right;" onclick="location.href='<%=request.getContextPath() %>/notice/addNoticeForm.jsp'">글쓰기</button>
			</div>
			
			<br><br>
			
			<table class="table table-hover" style="text-align: center">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>게시일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice  n : noticeList) {						
							int noticeId = n.getNoticeId();
							String noticeTitle = n.getNoticeTitle();
							String noticeDate = n.getNoticeDate();
					%>
							<tr>
								<td><%=noticeId %></td>
								<td>
									<a style="color: black;" href="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=noticeId %>">
									<%=noticeTitle %></a>
								</td>
								<td><%=noticeDate %></td>
								<td>
									<button type="button" class="btn btn-info btn-sm" onclick="location.href='<%=request.getContextPath() %>/notice/noticeUpdateForm.jsp?noticeId=<%=noticeId %>'">수정</button>
								</td>
								<td>
									<button type="button" class="btn btn-danger btn-sm" onclick="location.href='<%=request.getContextPath() %>/notice/noticeDeleteAction.jsp?noticeId=<%=noticeId %>'">삭제</button>
								</td>
							</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			
			<br>
			
			<!-- 페이지 네비게이션 -->
			<ul class="pagination justify-content-center">
				<!-- 처음으로 버튼 -->
					<%
						if (currentPage > 1) { // currentPage가 1보다 클 때만 처음으로 갈 수 있음
							%>
								<li class="page-item">
								<a class="page-link" href="./noticeList.jsp?currentPage=1">처음으로</a>
							<%
						} else { // 첫 페이지 일 때 처음으로 버튼 표시 안 함
							%>
								<li class="page-item disabled">
								<a class="page-link" href="#">처음으로</a>
							<%
						}
					%>
				</li>
				<!-- 이전 버튼 -->
				
					<%
						if (currentPage > 1) { // currentPage가 1보다 클 때만 이전으로 갈 수 있음
							%>
								<li class="page-item">
								<a class="page-link" href="./noticeList.jsp?currentPage=<%=currentPage - 1 %>">이전</a>
							<%
						} else { // 1이거나 그 이하면 버튼 표시 안 함
							%>
								<li class="page-item disabled">
								<a class="page-link" href="#">이전</a>
							<%
						}
					%>
				</li>
				<!-- 현재 페이지 표시 -->
				<%
					int totalCount = 0;	// 전체 데이터 수
					totalCount = noticeDao.countAllData();					
					
					int lastPage = totalCount / rowPerPage;
					if (totalCount % rowPerPage != 0) {	// 10 미만의 개수의 데이터가 있는 페이지를 표시
						lastPage += 1;
					}
					
					if (lastPage == 0) { // 전체 페이지가 0개이면 현재 페이지도 0으로 표시
						currentPage = 0;
					}
				
					int navPerPage = 10;	// 네비게이션에 표시할 페이지 수
					int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	// 네비게이션 첫번째 페이지
					int navLastPage = navFirstPage + navPerPage - 1;	// 네비게이션 마지막 페이지
					
					if (currentPage % navPerPage == 0 && currentPage != 0) {	// 10으로 나누어 떨어지는 경우 처리하는 코드
						navFirstPage = navFirstPage - navPerPage;
						navLastPage = navLastPage - navPerPage;
					}
				
					for(int i = navFirstPage; i <= navLastPage; i++) {
						if (i <= lastPage) {
							if (i == currentPage) {	// 현재 페이지
								%>
									<li class="page-item disabled">
										<a class="page-link" href="#"><%=i %></a>
									</li>
								<%
							} else {	// 다음 페이지
								%>
									<li class="page-item">
										<a class="page-link" href="./noticeList.jsp?currentPage=<%=i %>"><%=i %></a>
									</li>
								<%
							}
						}
					}
				%>
				<!-- 다음 버튼 -->
					<%
						if (currentPage < lastPage) { // currentPage가 lastPage보다 작을 때만 다음으로 갈 수 있음
							%>
								<li class="page-item">
								<a class="page-link" href="./noticeList.jsp?currentPage=<%=currentPage + 1 %>">다음</a>
							<%
						} else { // 마지막 페이지 일 때 다음 버튼 표시 안 함
							%>
								<li class="page-item disabled">
								<a class="page-link" href="#">다음</a>
							<%
						}
					%>
				</li>
				<!-- 마지막으로 버튼 -->
					<%
						if (currentPage < lastPage) { // currentPage가 lastPage보다 작을 때만 마지막으로 갈 수 있음
							%>
								<li class="page-item">
								<a class="page-link" href="./noticeList.jsp?currentPage=<%=lastPage %>">마지막으로</a>
							<%
						} else { // 마지막 페이지 일 때 마지막으로 버튼 표시 안 함
							%>
								<li class="page-item disabled">
								<a class="page-link" href="#">마지막으로</a>
							<%
						}
					%>
				</li>
			</ul>
			
			<!-- 총 페이지 수 출력 -->
			<table style="margin: auto;">
				<tr>
					<td>
						<button type="button" class="btn btn-outline-dark btn-sm">
							<%=currentPage %> / <%=lastPage %> 페이지
						</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

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
		<title>index.jsp</title>
		
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
	
		<div class="container">
			<div>
				<!-- menu 항목을 include한다 -->
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>HOME</h1>
				<p>관리자 홈 페이지입니다. 메뉴를 선택해주세요.</p>
			</div>
			
			<br>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>프로젝트 소개</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<ul>
								<li>제작자: 한재용</li>
								<%
									String begin = "2020.09.16";
									String end = "2020.09.17";
									
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy.mm.dd");
									Date beginDate = formatter.parse(begin);
									Date endDate = formatter.parse(end);
									
									long diff = endDate.getTime() - beginDate.getTime();
									long diffDays = diff / (24 * 60 * 60 * 1000) + 1; // 날짜 차이 + 시작일을 1일로 기준잡음
								%>
								<li>제작기간: <%=begin %>~<%=end %> (총 <%=diffDays %>일간 작업)</li>
								<li>목표: 쇼핑몰 페이지 및 쇼핑몰 관리 페이지 제작방법 습득</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
							<ul>
								<li>ServerInfo</li>
								<ul>
									<li>Operating System: Microsoft Windows 10 x64 Pro 1903 [18362.1016]</li>
									<li>WebServer: Apache Tomcat 8.5.57</li>
									<li>DataBase: MariaDB 10.5.5</li>
									<li>Java: 1.8.0_261</li>
								</ul>
							</ul>
							
							<ul>
								<li>DevelopedEnvironment</li>
								<ul>
									<li>IDE: Eclipse IDE for Enterprise Java Developers [2020-06 (4.16.0)]</li>
									<li>Language: English, Korean(UTF-8), HTML, JSP, Javascript</li>
								</ul>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			
			<br>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">구현된 기능</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							2020.09.16
						</td>
						<td>
							<ol type="1">
								<li>관리자 페이지 구현</a></li>
								<ul>
									<li>로그인 기능 구현  <a href="<%=request.getContextPath() %>/login.jsp"><button type="button" class="btn btn-success btn-sm">바로가기</button></a></li>
									<li>메인 페이지 구현  <a href="<%=request.getContextPath() %>/index.jsp"><button type="button" class="btn btn-success btn-sm">바로가기</button></a></li>
								</ul>
								<li>관리자 카테고리 페이지 구현</li>
								<ul>
									<li>카테고리 목록 <a href="<%=request.getContextPath() %>/category/categoryList.jsp"><button type="button" class="btn btn-success btn-sm">바로가기</button></a></li>
									<ul>
										<li>카테고리가 많아질 것을 대비해 페이징 기능 추가</li>
									</ul>
									<li>카테고리 추가 <a href="<%=request.getContextPath() %>/category/addCategory.jsp"><button type="button" class="btn btn-success btn-sm">바로가기</button></a></li>
									<li>카테고리 수정</li>
									<li>카테고리 삭제</li>
								</ul>
							</ol>
						</td>
					</tr>
					<tr>
						<td>
							2020.09.17
						</td>
						<td>
							<ol type="1">
								<li>관리자 상품 페이지 구현</li>
								<ul>
									<li>상품 목록  <a href="<%=request.getContextPath() %>/product/productList.jsp"><button type="button" class="btn btn-success btn-sm btn-sm">바로가기</button></a></li>
									<ul>
										<li>상품 목록을 가로로 나열하는 기능 추가</li>
										<li>상품 목록이 많아질 것을 대비해 페이징 기능 추가</li>
										<li>상품을 카테고리별로 확인하는 기능 추가</li>
									</ul>
									<li>상품 추가  <a href="<%=request.getContextPath() %>/product/addProduct.jsp"><button type="button" class="btn btn-success btn-sm">바로가기</button></a></li>
									<li><del>상품 수정</del></li>
									<li><del>상품 삭제</del></li>
								</ul>
								<li>관리자 메인 페이지 설명 추가 <a href="<%=request.getContextPath() %>/index.jsp"><button type="button" class="btn btn-success btn-sm">바로가기</button></a></li>
							</ol>
						</td>
					</tr>
					<tr>
						<td>
							2020.09.18
						</td>
						<td>
							<ol type="1">
								<li>Bootstrap Framework 적용 (index / login / 카테고리 관리, 추가, 삭제 / 상품 관리)</li>
							</ol>
						</td>
					</tr>
					<tr>
						<td>
							2020.09.19
						</td>
						<td>
							<ol type="1">
								<li>Bootstrap Framework 적용 (상품 추가)</li>
							</ol>
						</td>
					</tr>
					<tr>
						<td>
							2020.09.21
						</td>
						<td>
							<ol type="1">
								<li>주문 관리 페이지 구현</li>
								<ul>
									<li>주문 목록  <a href="<%=request.getContextPath() %>/orders/ordersList.jsp"><button type="button" class="btn btn-success btn-sm btn-sm">바로가기</button></a></li>
									<li>주문상태 수정기능 추가</li>
								</ul>
							</ol>
						</td>
					</tr>
					<tr>
						<td>
							2020.09.22
						</td>
						<td>
							<ol type="1">
								<li>로그인 페이지 수정</li>
								<ul>
									<li>데이터베이스에 계정정보를 저장하고 웹 페이지와 연동하여 로그인</li>
									<li>로그인 세션 기능 추가</li>
								</ul>
								<li>데이터베이스 객체 생성</li>
							</ol>
						</td>
					</tr>
				</tbody>
			</table>
			
			<br>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Known Issue/Error</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<ul>
								<li>(현재까지 Known Issue/Error이(가) 없습니다)</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			
			<br>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Bug Report</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<ul>
								<li>한재용&nbsp;
									<a href="mailto:maru_i@kakao.com?Subject=ShoppingMallProject%20BugReport">
										<button type="button" class="btn btn-warning btn-sm" style="color: white;">maru_i@kakao.com</button>
									</a>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br><br>
	</body>
</html>
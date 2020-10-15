<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("loginAdminId") != null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/index.jsp");	// 로그인이 되어있으면 index.jsp로 이동
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login.jsp</title>
		
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
		
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="navbar-brand" href="#">Goodee Shop&nbsp;<font size="2">[관리자]</font></a>
					</li>
				</ul>
			</nav>
		
			<div class="jumbotron">
				<h1>관리자 로그인</h1>
				<p>관리자 아이디와 비밀번호를 입력해주세요.</p>
			</div>
		
			<form method="post" action="<%=request.getContextPath() %>/loginAction.jsp">
				<table class="table table-striped" style="text-align: center">
					<tr>
						<td>관리자 ID: </td>
						<td>
							<input type="text" class="form-control" name="adminId" placeholder="아이디" onclick="this.value='admin'">
						</td>
					</tr>
					<tr>
						<td>관리자 PW: </td>
						<td>
							<input type="password" class="form-control" name="adminPw" placeholder="비밀번호" onclick="this.value='1234'">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary">로그인</button>
						</td>
					</tr>
				</table>
			</form>
			
			<br><br>
		</div>
	</body>
</html>
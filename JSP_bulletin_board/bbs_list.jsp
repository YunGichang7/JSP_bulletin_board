<%@ page language = "java" import="java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
if (session.getAttribute("login") != "ok")		// 로그인 상태 체크
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ 로그아웃 상태 ]</b><br><br><a href=\"./\">로그인 페이지로 이동</a></center>");
	return;
}

String dbFile = request.getRealPath("/")+"\\project\\board.txt";

BufferedReader txt = new BufferedReader(new FileReader(dbFile));
String info = "";
%>

<html>
<head>
<title>게시판</title>
</head>

<body>

<hr>
<h2 align="center">파일 시스템을 이용한 게시판</h2>
<hr><br>
<table width="700" border="1" align="center">
   <tr>
    <td width="50" align="center"><b>번호</b></td>
    <td width="400" align="center"><b>제목</b></td>
    <td width="100" align="center"><b>글쓴이</b></td>
    <td width="150" align="center"><b>작성일</b></td>
  </tr>
<%

	while ((info = txt.readLine()) != null)
	{
		String [] bbs_info = info.split("/,");   // '/,'를 기준으로 문자열 분리 후 배열로 저장
%>
  
  <tr>
    <td align="center"><%=bbs_info[0]%></td>
    <td><a href="bbs_view.jsp?txt_num=<%=bbs_info[0]%>"><%=bbs_info[1]%></a></td>
    <td align="center"><%=bbs_info[2]%></td>
    <td align="center"><%=bbs_info[3]%></td>
  </tr>

<% } %>
</table>
<br><hr>
<a href="bbs_write.jsp">글쓰기</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="logout.jsp">로그아웃</a>
</body>
</html>

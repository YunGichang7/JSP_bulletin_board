<%@ page language = "java" import="java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

if (session.getAttribute("login") != "ok")		// 로그인 상태 체크
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ 로그아웃 상태 ]</b><br><br><a href=\"./\">로그인 페이지로 이동</a></center>");
	return;
}
%>
<html>
<head>
<title>게시물 작성</title>
</head>

<body>
<h1 align=center>게시물 작성</h1>
<form method="post" action="bbs_write_ok.jsp">
  <table width="700" border="0" align="center" cellpadding="5">
    <tr> 
      <td colspan="2"><hr></td>
    </tr>
    <tr> 
      <td width="70" align="right">이름 : </td>
      <td><%=(String)session.getAttribute("name")+"("+session.getAttribute("id")+")"%></td>		           <!-- 이름과 아이디 출력 -->
    </tr>
    <tr> 
      <td align="right">e-Mail : </td>
      <td><input name="email" type="text" value="<%=session.getAttribute("email")%>" size="30"></td>
    </tr>
    <tr> 
      <td align="right">제목 : </td>
      <td><input name="title" type="text" size="70"></td>
    </tr>
    <tr> 
      <td align="right">내용 : </td>
      <td><textarea name="text" cols="70" rows="20"></textarea></td>
    </tr>
    <tr> 
      <td colspan="2"><hr></td>
    </tr>
    <tr> 
      <td colspan="2" align="center"> 
          <input type="submit" name="Submit" value="작성">
          &nbsp; 
          <input type="button" name="back" value="취소" onClick="history.back()">
      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%@ page language = "java" import="java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

if (session.getAttribute("login") != "ok")		// 로그인 상태 체크
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ 로그아웃 상태 ]</b><br><br><a href=\"login.html\">로그인 페이지로 이동</a></center>");
	return;
}

String dbFile = request.getRealPath("/")+"\\project\\bbs_data\\";

String txt_num = request.getParameter("txt_num");

FileReader fr = new FileReader(dbFile+txt_num+".txt");

StringBuffer sb = new StringBuffer("");
int ch = 0;

while ((ch = fr.read()) != -1)
{
	sb.append((char)ch);
}
String [] txt = sb.toString().split("/,");		// '/,'를 기준으로 문자열 분리 후 배열로 저장

%>
<html>
<head>
<title>글보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body>
<br><hr><br>
<table width="500" border="0" align="center" cellpadding="3">
  <tr> 
    <td height="30" colspan="4" align="center" bgcolor="#CCCCFF"><b><%=txt[0]%></b></td>
  </tr>
  <tr> 
    <td width="70" height="25" align="center" bgcolor="#CCCCCC"><font size=-1>작성자</font></td>
    <td width="180" bgcolor="#DFDFDF"><font size=-1><%=txt[1]%>(<%=txt[2]%>) <a href="mailto:<%=txt[3]%>">메일</a></font></td>
    <td width="70" align="center" bgcolor="#CCCCCC"><font size=-1>작성일</font></td>
    <td width="180" bgcolor="#DFDFDF"><font size=-1><%=txt[4]%></font></td>
  </tr>
  <tr> 
    <td colspan="4">
<textarea name="textarea" cols="75" rows="20" readonly><%=txt[5]%></textarea></td>
  </tr>
</table>
<br><hr>
<center><a href="bbs_list.jsp">목록으로</a></center>
</body>
</html>
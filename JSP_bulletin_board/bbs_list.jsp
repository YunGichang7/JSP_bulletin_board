<%@ page language = "java" import="java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
if (session.getAttribute("login") != "ok")		// �α��� ���� üũ
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ �α׾ƿ� ���� ]</b><br><br><a href=\"./\">�α��� �������� �̵�</a></center>");
	return;
}

String dbFile = request.getRealPath("/")+"\\project\\board.txt";

BufferedReader txt = new BufferedReader(new FileReader(dbFile));
String info = "";
%>

<html>
<head>
<title>�Խ���</title>
</head>

<body>

<hr>
<h2 align="center">���� �ý����� �̿��� �Խ���</h2>
<hr><br>
<table width="700" border="1" align="center">
   <tr>
    <td width="50" align="center"><b>��ȣ</b></td>
    <td width="400" align="center"><b>����</b></td>
    <td width="100" align="center"><b>�۾���</b></td>
    <td width="150" align="center"><b>�ۼ���</b></td>
  </tr>
<%

	while ((info = txt.readLine()) != null)
	{
		String [] bbs_info = info.split("/,");   // '/,'�� �������� ���ڿ� �и� �� �迭�� ����
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
<a href="bbs_write.jsp">�۾���</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="logout.jsp">�α׾ƿ�</a>
</body>
</html>

<%@ page language = "java" import="java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

if (session.getAttribute("login") != "ok")		// �α��� ���� üũ
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ �α׾ƿ� ���� ]</b><br><br><a href=\"login.html\">�α��� �������� �̵�</a></center>");
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
String [] txt = sb.toString().split("/,");		// '/,'�� �������� ���ڿ� �и� �� �迭�� ����

%>
<html>
<head>
<title>�ۺ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body>
<br><hr><br>
<table width="500" border="0" align="center" cellpadding="3">
  <tr> 
    <td height="30" colspan="4" align="center" bgcolor="#CCCCFF"><b><%=txt[0]%></b></td>
  </tr>
  <tr> 
    <td width="70" height="25" align="center" bgcolor="#CCCCCC"><font size=-1>�ۼ���</font></td>
    <td width="180" bgcolor="#DFDFDF"><font size=-1><%=txt[1]%>(<%=txt[2]%>) <a href="mailto:<%=txt[3]%>">����</a></font></td>
    <td width="70" align="center" bgcolor="#CCCCCC"><font size=-1>�ۼ���</font></td>
    <td width="180" bgcolor="#DFDFDF"><font size=-1><%=txt[4]%></font></td>
  </tr>
  <tr> 
    <td colspan="4">
<textarea name="textarea" cols="75" rows="20" readonly><%=txt[5]%></textarea></td>
  </tr>
</table>
<br><hr>
<center><a href="bbs_list.jsp">�������</a></center>
</body>
</html>
<%@ page language = "java" import="java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

if (session.getAttribute("login") != "ok")		// �α��� ���� üũ
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ �α׾ƿ� ���� ]</b><br><br><a href=\"./\">�α��� �������� �̵�</a></center>");
	return;
}
%>
<html>
<head>
<title>�Խù� �ۼ�</title>
</head>

<body>
<h1 align=center>�Խù� �ۼ�</h1>
<form method="post" action="bbs_write_ok.jsp">
  <table width="700" border="0" align="center" cellpadding="5">
    <tr> 
      <td colspan="2"><hr></td>
    </tr>
    <tr> 
      <td width="70" align="right">�̸� : </td>
      <td><%=(String)session.getAttribute("name")+"("+session.getAttribute("id")+")"%></td>		           <!-- �̸��� ���̵� ��� -->
    </tr>
    <tr> 
      <td align="right">e-Mail : </td>
      <td><input name="email" type="text" value="<%=session.getAttribute("email")%>" size="30"></td>
    </tr>
    <tr> 
      <td align="right">���� : </td>
      <td><input name="title" type="text" size="70"></td>
    </tr>
    <tr> 
      <td align="right">���� : </td>
      <td><textarea name="text" cols="70" rows="20"></textarea></td>
    </tr>
    <tr> 
      <td colspan="2"><hr></td>
    </tr>
    <tr> 
      <td colspan="2" align="center"> 
          <input type="submit" name="Submit" value="�ۼ�">
          &nbsp; 
          <input type="button" name="back" value="���" onClick="history.back()">
      </td>
    </tr>
  </table>
</form>
</body>
</html>


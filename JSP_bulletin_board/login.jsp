<%@ page language = "java" import = "java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

String dbFile = request.getRealPath("/")+"\\project\\member.txt";

BufferedReader txt = new BufferedReader(new FileReader(dbFile));
String info = "";
String name = "";
String date = "";
String email = "";
boolean flag = false;		// ���̵� ���翩�� �˻�

try {
while ((info = txt.readLine()) != null)		// ���δ����� �о����
{
	String [] mem_info = info.split("/");	// '/'�� �������� ���ڿ� �и� �� �迭�� ����

	if(id.equals(mem_info[2]))
	{
		if(pw.equals(mem_info[3]))
		{
			name = mem_info[0];
			date = mem_info[6];
			email = mem_info[4];
			flag = true;		// ���̵� ����� flag�� true�� ����
			break;
		}
		out.print("<script>alert(\"��й�ȣ�� ��ġ���� �ʽ��ϴ�.\"); history.back();</script>");
		return;
	}
}
}
catch (Exception e)	  // �ԷµǴ� ���� ���� ��� ����ó��
{
	out.print("�������� ���ٹ���� �ƴմϴ�.");
	return;
}
txt.close();

if (!flag)		// flag���� false�� ��� ����
{
	out.print("<script>alert(\"�������� �ʴ� ���̵� �Դϴ�.\"); history.back();</script>");
	return;
}

session.setMaxInactiveInterval(10 * 60);	// ���� ���� �ð� 10��
session.setAttribute("login", "ok");		// �α��� ���� üũ�� ���� ���� ����
session.setAttribute("id", id);				// id ���� ����
session.setAttribute("name", name);			// �̸� ���� ����
session.setAttribute("email", email);			// �̸��� ���� ����

%>

<html>
<head>
<title>ȯ���մϴ�</title>
</head>

<body>
<hr>
<h2 align="center">���� �ý����� �̿��� �Խ���</h2>
<hr><br><br>
<table width="300" border="0" align="center" cellpadding="7" bgcolor="#CCCCCC">
  <tr>
    <td align="center"><%=name%>�� ȯ���մϴ�.<br><br>
      ������ : <%=date%></td>
  </tr>
  <tr>
	<td align="center"><a href="bbs_list.jsp">�Խ������� �̵�</a></td>
<tr>
</table>
</body>
</html>

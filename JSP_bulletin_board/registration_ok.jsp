<%@ page language = "java" import = "java.io.*,java.text.SimpleDateFormat,java.util.Date" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

String name = request.getParameter("name");
String number = request.getParameter("number");
String id = request.getParameter("id");

String dbFile = request.getRealPath("/")+"\\project\\member.txt";

BufferedReader txt = new BufferedReader(new FileReader(dbFile));
String m_info = "";

while ((m_info = txt.readLine()) != null)
{
	String [] mem_info = m_info.split("/");	// '/'�� �������� ���ڿ� �и� �� �迭�� ����

	if(number.equals(mem_info[1]))
	{
		out.print("<script>alert(\"�̹� �����ϴ� �й� �Դϴ�.\"); history.back();</script>");
		return;
	}      

	if(id.equals(mem_info[2]))
	{
		out.print("<script>alert(\"�̹� �����ϴ� ���̵� �Դϴ�.\"); history.back();</script>");
		return;
	}
}
txt.close();

String pw = request.getParameter("pw");
String email = request.getParameter("email");
String cp1 = request.getParameter("cpNum1");
String cp2 = request.getParameter("cpNum2");
String cp3 = request.getParameter("cpNum3");
String cpNum = cp1 + "-" + cp2 + "-" + cp3;

String date;
Date currentDate = new Date();		// ���� �ð��� ����
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy�� MM�� dd��");   // �ð� ������� ����
date = dateFormat.format(currentDate);		// ���� �ð��� ������ ����������� ����

String info = name + "/" + number + "/" + id + "/" + pw + "/" + email + "/" + cpNum + "/" + date + "\n";

FileWriter fw = new FileWriter(dbFile, true);

for (int i = 0; i < info.length(); i++)		// �ѹ��ھ� ���Ͽ� ����
	fw.write (info.charAt(i));
fw.close();
%>

<html>
<head>
<title>ȸ������ ��û</title>
</head>

<body>
  <table width="383" border="0" align="center" cellpadding="3">
    <tr> 
      <td height="50" colspan="2" align="center" bgcolor="#0099CC"><b>�����մϴ�! 
        ȸ�������� �Ϸ�Ǿ����ϴ�.</b></td>
    </tr>
    <tr> 
      <td width="124" bgcolor="#99CCFF">�̸�</td>
      <td width="242" bgcolor="#E0DFF9"><%=name%></td>
    </tr>
    <tr> 
      <td bgcolor="#99CCFF">�й�</td>
      <td bgcolor="#E0DFF9"><%=number%></td>
    </tr>
    <tr>                                              
      <td bgcolor="#99CCFF">���̵�</td>
      <td bgcolor="#E0DFF9"><%=id%></td>
    </tr>
    <tr> 
      <td bgcolor="#99CCFF">�̸��� �ּ�</td>
      <td bgcolor="#E0DFF9"><%=email%></td>
    </tr>
    <tr> 
      <td bgcolor="#99CCFF">C��P ��ȣ</td>
      <td bgcolor="#E0DFF9"><%=cpNum%></td>
    </tr>
    <tr>      
    <td bgcolor="#99CCFF">���Գ�¥</td>
      <td bgcolor="#E0DFF9"><%=date%></td>
    </tr>
    <tr> 
      <td height="50" colspan="2" align="center"><input name="login" type="button" value="�α���" onClick="location.href='index.html'">
      </td>
    </tr>
  </table>
</body>
</html>

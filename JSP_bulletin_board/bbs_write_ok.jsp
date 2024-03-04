<%@ page language = "java" import = "java.io.*,java.text.SimpleDateFormat,java.util.Date" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

if (session.getAttribute("login") != "ok")	// �α��� ���� üũ
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ �α׾ƿ� ���� ]</b><br><br><a href=\"./\">�α��� �������� �̵�</a></center>");
	return;
}


String dbFile = request.getRealPath("/")+"\\project\\";

DataInputStream dis;
dis = new DataInputStream(new FileInputStream(dbFile+"board_count.txt"));

String txt_num = dis.readLine();
int txt_count = Integer.parseInt(txt_num);

dis.close();

DataOutputStream dos;
dos = new DataOutputStream(new FileOutputStream(dbFile+"board_count.txt"));

txt_count++;
String txt_count2 = Integer.toString(txt_count);
dos.writeBytes(txt_count2);		// �Խù� ���� ����

dos.close();

String name = (String)session.getAttribute("name");
String id = (String)session.getAttribute("id");
String email = request.getParameter("email");
String title = request.getParameter("title");
String text = request.getParameter("text");

String date;
Date currentDate = new Date();		// ���� �ð��� ����
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");		// �ð� ������� ����
date = dateFormat.format(currentDate);		// ���� �ð��� ������ ����������� ����

String bbs_list = txt_num + "/," + title + "/," + name + "/," + date + "\n";

FileWriter fw = new FileWriter(dbFile+"board.txt", true);	// �Խ��� ��� �߰�

for (int i = 0; i < bbs_list.length(); i++)		// �ѹ��ھ� ���Ͽ� ����
	fw.write (bbs_list.charAt(i));

fw.close();

String bbs_txt = title + "/," + name + "/," + id + "/," + email + "/," + date + "/," + text;

FileWriter fw2 = new FileWriter(dbFile+"bbs_data\\" + txt_num + ".txt", true);	
                                                            // �Խù� ��ȣ�� ���� ����

for (int i = 0; i < bbs_txt.length(); i++)		// �ѹ��ھ� ���Ͽ� ����
	fw2.write (bbs_txt.charAt(i));

fw2.close();


%>
<br><br><br>
<table width="350" height="150" border="0" align="center">
  <tr> 
    <td bgcolor="#CCCCCC" align="center"><b>���������� ���� ��ϵǾ����ϴ�.</b><br><br><a href="bbs_list.jsp">�Խ��� ������� �̵�</a></td>
  </tr>
</table>

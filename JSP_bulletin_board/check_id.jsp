<%@ page language = "java" import = "java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

String id = request.getParameter("id");
String dbFile = request.getRealPath("/")+"\\project\\member.txt";
BufferedReader txt = new BufferedReader(new FileReader(dbFile));
String m_info = "";

while ((m_info = txt.readLine()) != null)
{
	String [] mem_info = m_info.split("/");	// '/'�� �������� ���ڿ� �и� �� �迭�� ����

	if(id.equals(mem_info[2]))
	{
	      out.print("<div align=center><br><b>"+id+"</b>�� �̹� �����ϴ� ���̵� �Դϴ�.</div>");
	      return;
	}
}
txt.close();

out.print("<div align=center><br><b>"+id+"</b>�� ��� ������ ���̵� �Դϴ�.</div>");
%>

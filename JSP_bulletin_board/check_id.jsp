<%@ page language = "java" import = "java.io.*" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

String id = request.getParameter("id");
String dbFile = request.getRealPath("/")+"\\project\\member.txt";
BufferedReader txt = new BufferedReader(new FileReader(dbFile));
String m_info = "";

while ((m_info = txt.readLine()) != null)
{
	String [] mem_info = m_info.split("/");	// '/'를 기준으로 문자열 분리 후 배열로 저장

	if(id.equals(mem_info[2]))
	{
	      out.print("<div align=center><br><b>"+id+"</b>는 이미 존재하는 아이디 입니다.</div>");
	      return;
	}
}
txt.close();

out.print("<div align=center><br><b>"+id+"</b>는 사용 가능한 아이디 입니다.</div>");
%>

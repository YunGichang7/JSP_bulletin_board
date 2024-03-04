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
	String [] mem_info = m_info.split("/");	// '/'를 기준으로 문자열 분리 후 배열로 저장

	if(number.equals(mem_info[1]))
	{
		out.print("<script>alert(\"이미 존재하는 학번 입니다.\"); history.back();</script>");
		return;
	}      

	if(id.equals(mem_info[2]))
	{
		out.print("<script>alert(\"이미 존재하는 아이디 입니다.\"); history.back();</script>");
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
Date currentDate = new Date();		// 현재 시간을 저장
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");   // 시간 출력형식 지정
date = dateFormat.format(currentDate);		// 현재 시간을 정해진 출력형식으로 저장

String info = name + "/" + number + "/" + id + "/" + pw + "/" + email + "/" + cpNum + "/" + date + "\n";

FileWriter fw = new FileWriter(dbFile, true);

for (int i = 0; i < info.length(); i++)		// 한문자씩 파일에 저장
	fw.write (info.charAt(i));
fw.close();
%>

<html>
<head>
<title>회원가입 신청</title>
</head>

<body>
  <table width="383" border="0" align="center" cellpadding="3">
    <tr> 
      <td height="50" colspan="2" align="center" bgcolor="#0099CC"><b>축하합니다! 
        회원가입이 완료되었습니다.</b></td>
    </tr>
    <tr> 
      <td width="124" bgcolor="#99CCFF">이름</td>
      <td width="242" bgcolor="#E0DFF9"><%=name%></td>
    </tr>
    <tr> 
      <td bgcolor="#99CCFF">학번</td>
      <td bgcolor="#E0DFF9"><%=number%></td>
    </tr>
    <tr>                                              
      <td bgcolor="#99CCFF">아이디</td>
      <td bgcolor="#E0DFF9"><%=id%></td>
    </tr>
    <tr> 
      <td bgcolor="#99CCFF">이메일 주소</td>
      <td bgcolor="#E0DFF9"><%=email%></td>
    </tr>
    <tr> 
      <td bgcolor="#99CCFF">C·P 번호</td>
      <td bgcolor="#E0DFF9"><%=cpNum%></td>
    </tr>
    <tr>      
    <td bgcolor="#99CCFF">가입날짜</td>
      <td bgcolor="#E0DFF9"><%=date%></td>
    </tr>
    <tr> 
      <td height="50" colspan="2" align="center"><input name="login" type="button" value="로그인" onClick="location.href='index.html'">
      </td>
    </tr>
  </table>
</body>
</html>

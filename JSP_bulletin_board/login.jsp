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
boolean flag = false;		// 아이디 존재여부 검사

try {
while ((info = txt.readLine()) != null)		// 라인단위로 읽어들임
{
	String [] mem_info = info.split("/");	// '/'를 기준으로 문자열 분리 후 배열로 저장

	if(id.equals(mem_info[2]))
	{
		if(pw.equals(mem_info[3]))
		{
			name = mem_info[0];
			date = mem_info[6];
			email = mem_info[4];
			flag = true;		// 아이디 존재시 flag를 true로 설정
			break;
		}
		out.print("<script>alert(\"비밀번호가 일치하지 않습니다.\"); history.back();</script>");
		return;
	}
}
}
catch (Exception e)	  // 입력되는 값이 없는 경우 예외처리
{
	out.print("정상적인 접근방법이 아닙니다.");
	return;
}
txt.close();

if (!flag)		// flag값이 false인 경우 실행
{
	out.print("<script>alert(\"존재하지 않는 아이디 입니다.\"); history.back();</script>");
	return;
}

session.setMaxInactiveInterval(10 * 60);	// 세션 만료 시간 10분
session.setAttribute("login", "ok");		// 로그인 상태 체크를 위한 세션 생성
session.setAttribute("id", id);				// id 세션 생성
session.setAttribute("name", name);			// 이름 세션 생성
session.setAttribute("email", email);			// 이메일 세션 생성

%>

<html>
<head>
<title>환영합니다</title>
</head>

<body>
<hr>
<h2 align="center">파일 시스템을 이용한 게시판</h2>
<hr><br><br>
<table width="300" border="0" align="center" cellpadding="7" bgcolor="#CCCCCC">
  <tr>
    <td align="center"><%=name%>님 환영합니다.<br><br>
      가입일 : <%=date%></td>
  </tr>
  <tr>
	<td align="center"><a href="bbs_list.jsp">게시판으로 이동</a></td>
<tr>
</table>
</body>
</html>

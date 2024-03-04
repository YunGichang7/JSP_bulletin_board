<%@ page language = "java" import = "java.io.*,java.text.SimpleDateFormat,java.util.Date" contentType = "text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr");

if (session.getAttribute("login") != "ok")	// 로그인 상태 체크
{
	session.invalidate();
	out.print("<br><br><br><center><b>[ 로그아웃 상태 ]</b><br><br><a href=\"./\">로그인 페이지로 이동</a></center>");
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
dos.writeBytes(txt_count2);		// 게시물 개수 증가

dos.close();

String name = (String)session.getAttribute("name");
String id = (String)session.getAttribute("id");
String email = request.getParameter("email");
String title = request.getParameter("title");
String text = request.getParameter("text");

String date;
Date currentDate = new Date();		// 현재 시간을 저장
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");		// 시간 출력형식 지정
date = dateFormat.format(currentDate);		// 현재 시간을 정해진 출력형식으로 저장

String bbs_list = txt_num + "/," + title + "/," + name + "/," + date + "\n";

FileWriter fw = new FileWriter(dbFile+"board.txt", true);	// 게시판 목록 추가

for (int i = 0; i < bbs_list.length(); i++)		// 한문자씩 파일에 저장
	fw.write (bbs_list.charAt(i));

fw.close();

String bbs_txt = title + "/," + name + "/," + id + "/," + email + "/," + date + "/," + text;

FileWriter fw2 = new FileWriter(dbFile+"bbs_data\\" + txt_num + ".txt", true);	
                                                            // 게시물 번호로 파일 생성

for (int i = 0; i < bbs_txt.length(); i++)		// 한문자씩 파일에 저장
	fw2.write (bbs_txt.charAt(i));

fw2.close();


%>
<br><br><br>
<table width="350" height="150" border="0" align="center">
  <tr> 
    <td bgcolor="#CCCCCC" align="center"><b>성공적으로 글이 등록되었습니다.</b><br><br><a href="bbs_list.jsp">게시판 목록으로 이동</a></td>
  </tr>
</table>

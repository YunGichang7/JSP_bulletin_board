<%@ page language = "java" import = "java.io.*" contentType = "text/html;charset=euc-kr" %>
<% session.invalidate();	// 세션 삭제 %>
<script>
alert('로그아웃 되었습니다.');
 location.replace('./');
</script>
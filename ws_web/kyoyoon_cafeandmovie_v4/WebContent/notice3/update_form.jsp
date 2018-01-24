<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>

<% 
request.setCharacterEncoding("utf-8"); 
%>
 
<%
// 수정할 레코드의 PK (Primary Key) 컬럼의 값을 받음 
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String title = "";
String rname = "";
 
NoticeVO noticeVO = noticeDAO.read(noticeno);

title = noticeVO.getTitle();
rname = noticeVO.getRname();

%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 3</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <form name='frm' action='./update_proc.jsp' method='POST'>
    <input type='hidden' name='noticeno' id='noticeno' value='<%=noticeno%>'>
    
    <fieldset style='width: 70%; margin: 10px auto;'>
      <legend class='legend_basic'>공지사항 수정 3</legend>
      <ul>
        <li class='li_none'>
          <label for='title'>내용: </label>
          <input type='text' name='title' id='title' value='<%=title %>' style='width: 80%;'>
        </li>
        <li class='li_none'>
          <label for='rname'>성명: </label>
          <input type='text' name='rname' id='rname' value='<%=rname %>' style='width: 30%;'>
        </li>
      </ul>
    </fieldset>
    
    <DIV class='bottom_menu'>
      <button type='submit'>저장</button>
      <button type='button' onclick="location.href='./list.jsp'">취소</button>
    </DIV>    
  </form>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>
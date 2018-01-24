<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <fieldset class='fieldset_basic' style='width: 80%'>
    <legend class='legend_basic'>방명록 수정</legend>
      <ul>
      <%
      int visitorno = Integer.parseInt(request.getParameter("visitorno"));
      String content = request.getParameter("content");
      String rname = request.getParameter("rname");
      String passwd = request.getParameter("passwd");
      String email = request.getParameter("email");
      String home = request.getParameter("home");
       
      VisitorVO visitorVO = new VisitorVO();
      visitorVO.setVisitorno(visitorno);
      visitorVO.setContent(content);
      visitorVO.setRname(rname);
      visitorVO.setPasswd(passwd);
      visitorVO.setEmail(email);
      visitorVO.setHome(home);
      
      int count = 0;
      if (visitorProc.passwordCheck(visitorno, passwd) == 1) {
        count = visitorProc.update(visitorVO); // 처리된 레코드 갯수
      
        if (count == 1) {
          response.sendRedirect("./list.jsp");
        } else {
        %>  
          <li class='li_none'>방명록 수정에 실패했습니다.</li>
          <li class='li_none'>다시한번 시도해주세요.</li>
        <%  
        }
      } else {
        %>
          <li class='li_none'>패스워드가 일치하지 않습니다.</li>
        <%  
      }
      %>
      </ul>
  </fieldset>
  
  <DIV class='bottom_menu'>
    <%
    if (count == 0) {
    %>
      <button type='button' onclick="location.href='./update_form.jsp?visitorno=<%=visitorno%>'">다시 시도</button>  
    <%  
    } 
    %>
    <button type='button' onclick="location.href='./list.jsp'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>
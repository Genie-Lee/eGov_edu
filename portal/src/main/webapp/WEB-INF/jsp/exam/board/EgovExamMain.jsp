<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>경량환경 템플릿 포털사이트</title>
<link href="<c:url value='/'/>css/default.css" rel="stylesheet" type="text/css" >
</head>
<body>
<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap">
	<!-- header start -->
	<div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>
	<!-- //header end -->

		<div class="search_result_div">
            
                <table width="98%" cellpadding="0" cellspacing="0">
                                
                <thead>
                <tr>      
                    <th>순번</th>        
				    <th>제목</th>                   
				    <th>작성자</th>        
				    <th>등록일자</th>               
                </tr>
                </thead>
                
                <tbody>
               <c:forEach items="${list}" var = "list">
                <tr>
			        <td><c:out value="${list.eno}"></c:out></td>         
			        <td  align="left"><c:out value="${list.title}"></c:out></td>       
			        <td><c:out value="${list.writer}"></c:out></td>   
			       <!-- <td class="lt_text3"><c:out value="${list.regdate}"></c:out></td>   -->
			       <td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></td> 
			    </tr>   
			    </c:forEach>
                </tbody>
                  
                </table>
                
                
		</div>
		<!-- search result end -->
		
<!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
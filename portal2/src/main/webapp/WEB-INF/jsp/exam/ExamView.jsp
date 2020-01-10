<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>exam 게시판</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
</head>
<body>
<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>  
    <!-- //header end -->
    <!--  타이틀 이미지 시작 -->
    <div id="title_img_div"><img src="<c:url value='/'/>images/header/img_portal_title.gif" alt="" /></div>
    <!--  //타이틀 이미지 끝 -->
    <div id="bodywrap">
    	
	    <div id="content_field"><!--contents start-->
	
	            <!-- search result start -->
	            <div class="search_result_div">
	            
	                <table width="98%" cellpadding="0" cellspacing="0" summary="Exam 목록 제공">
	                <caption>약관목록</caption>
	                
	                <colgroup>
	                    <col width="15%" > 
	                    <col width="55%" >
	                    <col width="15%" >
	                    <col width="15%" >
	                </colgroup>
	                
	                <thead>
	                <tr>      
	                    <th>순번</th>        
					    <th>제목</th>                   
					    <th>작성자</th>        
					    <th>등록일자</th>               
	                </tr>
	                </thead>
	                
	                <tbody>
	                <c:if test="${fn:length(resultList) == 0}">
	                <tr> 
	                      <td class="lt_text3" colspan="4">
	                          <spring:message code="common.nodata.msg" />
	                      </td>
	                </tr>                                                 
	                </c:if>
	                <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	                <tr>
				        <td class="lt_text3"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>         
				        <td class="lt_text3"  align="left">
				            <a href="<c:url value='/uss/olh/faq/FaqInqireCoUpdt.do?faqId=${resultInfo.faqId}&amp;pageIndex=${searchVO.pageIndex}'/>" onclick="fn_egov_inquire_faqlistdetail('<c:url value='${resultInfo.faqId}'/>'); return false;">
				                <c:out value="${resultInfo.qestnSj}"/>
				            </a>
				        </td>       
				        <td class="lt_text3"><c:out value="${resultInfo.inqireCo}"/></td>       
				        <td class="lt_text3"><fmt:formatDate value="${resultInfo.lastUpdtPnttm}"  pattern="yyyy-MM-dd"/></td>         
				    </tr>   
	                </c:forEach>
	                </tbody>
	                  
	                </table>
	            </div>
	            <!-- search result end -->
	            
	    	</div><!-- contents end -->
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
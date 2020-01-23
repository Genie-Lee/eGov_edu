<%@ page import="egovframework.com.cmm.LoginVO"%>
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
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<script>

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_Examlist(){

	// 첫 입력란에 포커스..
	document.ExamListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.ExamListForm.pageIndex.value = pageNo;
	document.ExamListForm.action = "<c:url value='/exam/ExamView.do'/>";
   	document.ExamListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_exam(){

	document.ExamListForm.pageIndex.value = 1;
	document.ExamListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_exam(pageIndex){
	
	document.ExamListForm.pageIndex.value = pageIndex;
	document.ExamListForm.action = "<c:url value='/exam/ExamRegistView.do'/>";
	document.ExamListForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_examlist(){

	document.ExamListForm.action = "<c:url value='/exam/ExamUpdtView.do'/>";
	document.ExamListForm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_examlistdetail(eno) {		

	// eno
	document.ExamListForm.examId.value = eno;	
  	document.ExamListForm.action = "<c:url value='/exam/ExamRead.do'/>";  	
  	document.ExamListForm.submit();	
	   	   		
}



</script>
</head>
<body onLoad="fn_egov_initl_Examlist()">
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
	    
	     <form name="ExamListForm" action="<c:url value='/exam/ExamView.do'/>" method="post">
            
            <!-- sub title start -->
            <div><h2>Exam목록</h2></div>
            <!-- sub title end -->
	    
				<!-- search area start-->
	            <div class="search_service">
	                <div class="search_area">
	                <div class="search_conditions" >
	                    <select name="searchCondition" class="select" title="조회조건 선택">
				           <option selected value=''>--선택하세요--</option>
				           <option value="title"  <c:if test="${searchVO.searchCondition == 'title'}">selected="selected"</c:if> >제목</option> 
				           <option value="writer"  <c:if test="${searchVO.searchCondition == 'writer'}">selected="selected"</c:if> >작성자</option>       
				       </select>
				       <input name="searchKeyword" type="text" size="35" value= '<c:out value="${searchVO.searchKeyword}" />'  maxlength="35" title="검색어 입력"> 
	                </div>
	                    <div class="search_buttons">
	                        <input type="submit" value="검색" onclick="fn_egov_search_exam(); return false;" />
	                    
	                    	<%
	                    		LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
	                    		if(loginVO != null){
	                    	%>
	                        	<a href="<c:url value='/exam/ExamRegistView.do?pageIndex=${searchVO.pageIndex }'/>" onclick="fn_egov_regist_exam(<c:out value='${searchVO.pageIndex }'/>); return false;"><spring:message code="button.create" /></a>
	                    	<%} %>
	                    </div>
	                </div> 
	            </div>
	            <!-- search area end -->
	            
	            </form>
	            
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
	                    <th>게시물 번호</th>        
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
				        <td class="lt_text3">
				        	<a href="<c:url value='/exam/ExamRead.do?eno=${resultInfo.eno}&amp;pageIndex=${searchVO.pageIndex}'/>" >
				        		<c:out value="${resultInfo.title}"/>
				        	</a>
				        </td>
				        <td class="lt_text3"><c:out value="${resultInfo.writer}"/></td>    
				        <td class="lt_text3"><fmt:formatDate value="${resultInfo.regdate}"  pattern="yyyy-MM-dd"/></td>
				    </tr>   
	                </c:forEach>
	                </tbody>
	                  
	                </table>
	            </div>
	            <!-- search result end -->
	            
	            <div id="paging_div">
	            	<ul class="paging_align">
	            		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
	            	</ul>
	            </div>
	            
	    	</div><!-- contents end -->
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
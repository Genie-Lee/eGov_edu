<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>글 목록 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_examlist(){

	// 첫 입력란에 포커스..
	document.examListForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.examListForm.pageIndex.value = pageNo;
	document.examListForm.action = "<c:url value='/exam/ExamListInqire.do'/>";
   	document.examListForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_exam(){

	document.examListForm.pageIndex.value = 1;
	document.examListForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_exam(){

	document.examListForm.action = "<c:url value='/exam/ExamCnRegistView.do'/>";
	document.examListForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_faqlist(){

	document.examListForm.action = "<c:url value='/exam/ExamCnUpdtView.do'/>";
	document.examListForm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_examlistdetail(examId) {		

	// Examid
	document.examListForm.examId.value = examId;	
  	document.examListForm.action = "<c:url value='/exam/ExamInqireCoUpdt.do'/>";  	
  	document.examListForm.submit();	
	   	   		
}


</script>
</head>
<body onLoad="fn_egov_initl_examlist();">

<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>  
    <!-- //header end -->
    <!--  타이틀 이미지 시작 -->
    <div id="title_img_div"><img src="<c:url value='/'/>images/title_image/img_title04.gif" alt="" /></div>
    <!--  //타이틀 이미지 끝 -->
    <div id="bodywrap">
        <div id="leftmenu_div"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
        <div id="middle_content">
            <!-- 현재위치 네비게이션 시작 -->
            <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>게시판</li>
                            <li>&gt;</li>
                            <li><strong>게시판</strong></li>
                        </ul>
                    </div>
            </div>
            <div id="content_field"><!--contents start-->
            
            <form name="examListForm" action="<c:url value='/exam/ExamListInqire.do'/>" method="post">
            
            <!-- sub title start -->
            <div><h2>글 목록</h2></div>
            <!-- sub title end -->
            
            <!-- search area start-->
            <div class="search_service">
                <div class="search_area">
                <div class="search_conditions" >
                    <select name="searchCondition" class="select" title="조회조건 선택">
			           <option selected value=''>--선택하세요--</option>
			           <option value="examSj"  <c:if test="${searchVO.searchCondition == 'examSj'}">selected="selected"</c:if> >제목</option>            
			       </select>
			       <input name="searchKeyword" type="text" size="35" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="35" title="검색어 입력" > 
                </div>
                    <div class="search_buttons">
                        <input type="submit" value="조회" onclick="fn_egov_search_exam(); return false;" />
                        <a href="<c:url value='/exam/ExamCnRegistView.do'/>" onclick="fn_egov_regist_exam(); return false;"><spring:message code="button.create" /></a>
                    </div>
                </div> 
            </div>
            <!-- search area end -->
            <input name="examId" type="hidden" value="">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			</form>

            <!-- search result start -->
            <div class="search_result_div">
            
                <table width="98%" cellpadding="0" cellspacing="0" summary="게시판에 대한 목록을 제공합니다.">
                <caption>글목록</caption>
                
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
				    <th>조회수</th>        
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
                	<td class="lt_rext3"><c:out value="${resultInfo.examId}"/></td>
<%-- 			        <td class="lt_text3"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>          --%>
			        <td class="lt_text3"  align="left">
<%-- 			            <a href="<c:url value='/exam/ExamInqireCoUpdt.do?faqId=${resultInfo.examId}&amp;pageIndex=${searchVO.pageIndex}'/>" onclick="fn_egov_inquire_examlistdetail('<c:url value='${resultInfo.examId}'/>'); return false;"> --%>
<%-- 			            <a href="<c:url value='/exam/ExamInqireCoUpdt.do?examId=${resultInfo.examId}'/>" onclick="fn_egov_inquire_examlistdetail('<c:url value='${resultInfo.examId}'/>'); return false;"> --%>
			            <a href="<c:url value='/exam/ExamListDetailInquire.do?examId=${resultInfo.examId}'/>">
			                <c:out value="${resultInfo.examSj}"/>
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
            
<!-- 			<div id="paging_div"> -->
<!-- 				<ul class="paging_align"> -->
<%-- 					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/> --%>
<!--                 </ul> -->
<!-- 			</div> -->

           </div><!-- contents end -->
        </div>
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
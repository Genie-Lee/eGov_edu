<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>exam 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_exam(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_examView(pageIndex) {
	document.ExamForm.pageIndex.value = pageIndex;
	document.ExamForm.action = "<c:url value='/exam/ExamView.do'/>";
	document.ExamForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_exam(eno, pageIndex){
	
	// Update하기 위한 키값(eno)을 셋팅
	/* alert()  로그 확인
	alert(eno);
	alert(pageIndex); */
	/* document.ExamForm.eno.value = eno;
	document.ExamForm.pageIndex.value = pageIndex; */
	document.ExamForm.action = "<c:url value='/exam/ExamUpdtView.do?eno="${resultInfo.eno}"&amp;pageIndex="${searchVO.pageIndex}"'/>";
	document.ExamForm.submit();	
	
}


function fn_egov_delete_exam(eno){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{	

		// Delete하기 위한 키값(eno)을 셋팅
		document.ExamForm.eno.value = eno;
		document.ExamForm.action = "<c:url value='/exam/ExamDelete.do'/>";
		document.ExamForm.submit();
			
	}
	
	
}

</script>
</head>

<body onLoad="fn_egov_initl_exam();">
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
        <div id="middle_content">
            
            <div id="content_field"><!--contents start-->
            
            <!-- 업데이트 폼 -->
            <form name="ExamForm" action="${pageContext.request.contextPath}/exam/ExamUpdtView.do" method="post">
            
            <!-- sub title start -->
            <div><h2>Exam 상세조회</h2></div>
            <!-- sub title end -->
            
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">                  
					<table summary="exam에 대한 정보를  조회합니다.">
					<caption>Exam상세조회</caption>
					  <tr> 
					    <td class="td_width">제목&nbsp;&nbsp;</td>
					    <td class="td_content">
					        <c:out value="${result.title}"/>  
					    </td>
					  </tr>
					
					  <tr> 
					    <td class="td_width"><label for="content">내용</label>&nbsp;&nbsp;</td>
					    <td class="td_content">
					      <textarea id="content" name="content" class="textarea"  cols="70" rows="15"  readonly="readonly" title="내용"><c:out value="${result.content}"/>
					      </textarea>
					    </td>
					  </tr>
					  
					  <tr> 
					    <td class="td_width">작성자&nbsp;&nbsp;</td>
					    <td class="td_content">
					        <c:out value="${result.writer}"/>  
					    </td>
					  </tr>
					  
					  <tr> 
					    <td class="td_width">등록일자</td>
					    <td class="td_content">
					     	<c:out value="${result.regdate}"/>
					        <%-- <fmt:formatDate value="${result.regdate}"  pattern="yyyy-MM-dd"/> --%>
					    </td>
					  </tr> 
					   
					</table>
                    
                </div>
            </div>
            <!--detail area end -->
            
            <!-- 수정, 삭제, 목록버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
            <c:if test="${result.esntl_Id eq user or user eq 'USRCNFRM_00000000000'}">
                 <input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_exam('<c:out value="${result.eno}"/>','<c:out value="${searchVO.pageIndex}"/>'); return false;">
                 <a href="<c:url value='/exam/ExamDelete.do?eno=${result.eno}&amp;pageIndex=${searchVO.pageIndex }'/>" onclick="fn_egov_delete_exam('<c:out value="${result.eno}"/>'); return false;"><spring:message code="button.delete" /></a>
			</c:if>
                 <a href="<c:url value='/exam/ExamView.do?pageIndex=${searchVO.pageIndex}'/>" onclick="fn_egov_examView(<c:out value='${searchVO.pageIndex}'/>); return false;"><spring:message code="button.list" /></a>
            </div>
            </td></tr></table>
            <!-- 수정, 삭제, 목록버튼  끝-->
            
			<input name="eno" type="hidden" value="${result.eno }">
			<input name="pageIndex" type="hidden" value="${searchVO.pageIndex }">
			
			</form>

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
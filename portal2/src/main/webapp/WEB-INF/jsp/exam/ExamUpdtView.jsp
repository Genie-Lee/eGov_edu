<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
<title>FAQ내용수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="ExamVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_exam(){

	// 첫 입력란에 포커스..
	ExamVO.title.focus();
	
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_exam(form, eno/* , pageIndex */){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/exam/ExamUpdt.do'/>";
		form.submit(); 
		return;
	*/

	if (!validateExamVO(form)) {
			 			
		return;
			
	} else {
		
		
		// form.eno.value = eno; 주석처리
		form.action = "<c:url value='/exam/ExamUpdt.do'/>";
		form.submit();
			
	} 	
		
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
 function fn_egov_examView(pageIndex) {
		document.ExamForm.pageIndex.value = pageIndex;
		document.ExamForm.action = "<c:url value='/exam/ExamView.do'/>?pageIndex=";
		document.ExamForm.submit();
			
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
            
            <!-- sub title start -->
            <div><h2>Exam내용수정</h2></div>
            <!-- sub title end -->
			
			<!-- 상단타이틀 파일첨부를 위한 폼명 및 Enctype 설정-->
			<form:form commandName="examVO" name="examVO" action="${pageContext.request.contextPath}/exam/ExamUpdt.do" method="post">
			<!-- FaqCnUpdtView.do Call을 위한 처리-->
            <input name="eno" type="hidden" value="<c:out value='${result.eno}'/>">
            <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">                  
					<table summary="Exam 정보 수정">
					<caption>Exam내용수정</caption>
					  <tr> 
					    <td class="td_width"><label for="title">제목</label><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					        <form:input path="title" size="70" maxlength="70" title="제목"/>
					        <form:errors path="title"/>                                
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width"><label for="content">내용</label><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content"> 
					      <form:textarea path="content" cols="70" rows="15" cssClass="txaClass"  title="내용"/>   
					      <form:errors path="content"/>                                                                       
					    </td>
					  </tr> 
					  <%-- <tr> 
					    <td class="td_width"><label for="writer">작성자</label><img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					        <form:input path="writer" size="70" maxlength="70" title="작성자"/>
					        <form:errors path="writer"/>                                
					    </td>
					  </tr> --%> 
					</table>
                </div>
            </div>
            <!--detail area end -->

            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                <input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_updt_exam(document.examVO,'<c:out value="${result.eno}"/>'<%-- , '<c:out value="${searchVO.pageIndex }"/>' --%>); return false;" />
                <a href="<c:url value='/exam/ExamView.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_examView(<c:out value='${searchVO.pageIndex}'/>); return false;"><spring:message code="button.list" /></a>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->

            </form:form>

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
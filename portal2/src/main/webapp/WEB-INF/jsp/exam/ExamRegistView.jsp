<%--
  Class Name : EgovFaqCnRegist.jsp
  Description : EgovFaqCnRegist 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.02.01   박정규          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스개발팀 박정규
    since    : 2009.02.01
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FAQ 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="faqManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faqcn(){

	// 첫 입력란에 포커스..
	faqManageVO.qestnSj.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_faqcn(form){

	// 서버사이드 테스트용
	/*	
		form.action = "<c:url value='/uss/olh/faq/FaqCnRegist.do'/>";
		form.submit(); 
		return;
	*/

	
	if (!validateFaqManageVO(form)) {
			 			
		return;
			
	} else {

		form.action = "<c:url value='/uss/olh/faq/FaqCnRegist.do'/>";
		form.submit();
			
	} 		
		
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqcnlist() {

	faqManageVO.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
	faqManageVO.submit();
		
}

</script>

</head>
<body onLoad="fn_egov_initl_faqcn();">
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
            
            <!-- sub title start -->
            <div><h2>FAQ내용등록</h2></div>
            <!-- sub title end -->
            
            <!-- 상단타이틀(폼명 설정 -->
			<form:form commandName="examVO" name="examVO" action="${pageContext.request.contextPath}/exam/ExamRegist.do" method="post"> 
            
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">                  
                    <table summary="exam 정보등록">
					<caption>exam내용등록</caption>
					  <tr> 
					    <td class="td_width"><label for="qestnSj">제목</label><img src="<c:url value='/images/required.gif'/>" width="15" height="15" alt="필수항목"></td>
					    <td class="td_content">
					        <form:input path="qestnSj" size="70" maxlength="70" title="질문제목"/>
					        <form:errors path="qestnSj"/>                              
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width"><label for="qestnCn">내용</label><img src="<c:url value='/images/required.gif'/>" width="15" height="15" alt="필수항목"></td>
					    <td class="td_content">
					      <form:textarea path="qestnCn" cols="100" rows="15" cssClass="txaClass"  title="질문내용"/>   
					      <form:errors path="qestnCn"/>                                                                       
					    </td>
					  </tr> 
					  <tr> 
					    <td class="td_width"><label for="answerCn">답변내용</label><img src="<c:url value='/images/required.gif'/>" width="15" height="15" alt="필수항목"></td>
					    <td class="td_content">
					      <form:textarea path="answerCn" cols="100" rows="15" cssClass="txaClass" title="답변내용"/>   
					      <form:errors path="answerCn"/>                                                                       
					    </td>
					  </tr> 
					</table>
                </div>
            </div>
            <!--detail area end -->

            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                 <input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_exam(document.examVO); return false;"/>
                 <a href="<c:url value='/exam/ExamView.do'/>" onclick="fn_egov_examview_examlist(); return false;"><spring:message code="button.list" /></a>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->
			
			</form:form>

            </div><!-- contents end -->

	</div>
	<!-- bodywrap end -->
	
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->

</body>
</html>
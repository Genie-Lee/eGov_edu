<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>글 상세조회</title>
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
function fn_egov_inqire_examlist() {

	document.ExamManageForm.action = "<c:url value='/exam/ExamListInqire.do'/>";
	document.ExamManageForm.submit();
		
}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_exam(examId){

	// Update하기 위한 키값(faqId)을 셋팅
	document.ExamManageForm.examId.value = examId;	
	document.ExamManageForm.action = "<c:url value='/exam/ExamCnUpdtView.do'/>";
	document.ExamManageForm.submit();	
	
}


function fn_egov_delete_exam(examId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{	

		// Delete하기 위한 키값(examId)을 셋팅
		document.ExamManageForm.faqId.value = faqId;	
		document.FaqManageForm.action = "<c:url value='/exam/ExamCnDelete.do'/>";
		document.FaqManageForm.submit();
			
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
            
            <form name="ExamManageForm" action="${pageContext.request.contextPath}/exam/ExamCnUpdtView.do" method="post">
            
            <!-- sub title start -->
            <div><h2>글 상세조회</h2></div>
            <!-- sub title end -->
            
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">                  
					<table summary="글에 대한 정보를  조회합니다.">
					<caption>글상세조회</caption>
					  <tr> 
					    <td class="td_width">제목&nbsp;&nbsp;</td>
					    <td class="td_content">
					        <c:out value="${result.examSj}"/>  
					    </td>
					  </tr>
					
					  <tr> 
					    <td class="td_width"><label for="examCn">내용</label>&nbsp;&nbsp;</td>
					    <td class="td_content">
					      <textarea id="examCn" name="examCn" class="textarea"  cols="100" rows="15"  readonly="readonly" title="글내용"><c:out value="${result.examCn}"/>
					      </textarea>
					    </td>
					  </tr>
					
					  <tr> 
					    <td class="td_width">조회수</td>
					    <td class="td_content">
					        <c:out value="${result.inqireCo}"/>
					    </td>
					  </tr>
					  
					  <c:if test="${result.atchFileId != ''}">
					    <tr> 
					        <td class="td_width">첨부파일 목록&nbsp;&nbsp;</td>
					            <td class="td_content">
					                <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
					                    <c:param name="paramAtchFileId" value="${result.atchFileId}" />
					                </c:import>                             
					            </td>
					    </tr>
					  </c:if>      
					  
					  <tr> 
					    <td class="td_width">등록일자</td>
					    <td class="td_content">
					        <c:out value="${result.lastUpdusrPnttm}"/>
					    </td>
					  </tr> 
					   
					</table>
                    
                </div>
            </div>
            <!--detail area end -->
            
            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                 <input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_exam('<c:out value="${result.examId}"/>'); return false;">
                 <a href="<c:url value='/exam/ExamCnDelete.do'/>?faqId=<c:out value='${result.examId}'/>" onclick="fn_egov_delete_exam('<c:out value="${result.examId}"/>'); return false;"><spring:message code="button.delete" /></a>
                 <a href="<c:url value='/exam/ExamListInqire.do'/>" onclick="fn_egov_inqire_examlist(); return false;"><spring:message code="button.list" /></a>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->
            
			<input name="examId" type="hidden" value="">
			
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
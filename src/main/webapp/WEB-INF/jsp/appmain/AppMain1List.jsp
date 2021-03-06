<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/LeftMenu2.jsp" />


<script>
    function fn_formSubmit() {
        document.form1.submit();
    }
</script>

<script>
    function fn_orderKey(_a) {
        document.form1.orderKeyword.value = _a;
        document.form1.submit();
    }
</script>

<script>
    function fn_formGo() {
        location.href = "/admin/appmain1Form";
    }
</script>



<form id="form1" name="form1" method="post">

<input type="hidden" name="sn" id="sn"
		value="" /> 
		
	<input type="hidden" name="orderKeyword" id="orderKeyword"
		value="${searchVO.orderKeyword}" /> 
		

	<section id="main-content" class=" ">
		<section class="wrapper"
		style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>
			<div class="content-body">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form name="searchFrm">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<table id="customers">
										<tr>
											<td class="tdl" style="width: 25%">프로젝트</td>
											<td style="width: 75%">
												<select name="project">
													<option>프로젝트</option>
													<option value="01">프로젝트01</option>
													<option value="02">프로젝트02</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="tdl" style="width: 25%">컨텐츠 타입</td>
											<td style="width: 75%">
												<select name="type"  class="form-control" >
													<c:forEach var="cateview" items="${cateview}"   varStatus="status">
														<option value="${cateview.code2}" <c:if test="${banner1Info.category eq cateview.code2}">selected</c:if>>${cateview.title}</option>
													</c:forEach>

												</select>
											</td>
										</tr>
										<tr>
											<td class="tdl" style="width: 25%">타이틀</td>
											<td style="width: 75%">
												<input name="title" type="text"	value="" class="form-control">
											</td>
										</tr>
										<tr>
											<td class="tdl" style="width: 25%">등록</td>
											<td style="width: 75%">
												<input name="startDate" type="text"	value="" class="form-control datepicker" data-format="yyyy-mm-dd"> ~
												<input name="endDate" type="text"	value="" class="form-control datepicker" data-format="yyyy-mm-dd">
											</td>
										</tr>
									</table>
									<div class="form-group" style="margin-top: 20px">
										<button type="button" class="btn btn-orange" onclick="fn_formSv()">검색</button>
									</div>
								</div>
							</div>
							<script>
                                function fn_formSv() {
                                    if ( document.searchFrm.title.value == ""){
                                        alert("검색어를 입력해주세요.");
                                        document.form.title.focus();
                                        return false;
                                    }
                                    $("#loading").show();
                                    document.searchFrm.submit();
                                }
							</script>
						</form>
					</div>
				</div>
			</div>
		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="page-title">

				<div class="pull-left">
					<h1 class="title">팝업내용 목록</h1>
				</div>


			</div>
		</div>
		<div class="clearfix"></div>


			<div class="col-lg-12">
				<section class="box ">

					<div class="content-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">


								<table class="table">
									<thead>
									<tr>
										<th><input type="checkbox" id="allChk" ></th>
										<th>No</th>
										<th>프로젝트</th>
										<th>팝업제목</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>등록일</th>
										<th>관리</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach var="listview" items="${listview}" varStatus="status">
										<tr>
											<td><input type="checkbox" value="${listview.sn}" name="chkSn" ></td>
											<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
											<td>${listview.project}</td>
											<td>${listview.title}</td>
											<td>${listview.sdate}</td><td>${listview.edate}</td>
											<td>${listview.regDate}</td>
											<td>
												<button type="button" class="btn btn-gray" onclick="fn_readGo(${listview.sn})">수정</button>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>

							</div>



							<div class="col-md-12 col-sm-12 col-xs-12"
								style='border-top: 2px solid #d8d8d8; padding-top: 20px;'>
								<jsp:include page="/WEB-INF/jsp/common/Paging.jsp" />
							</div>
						</div>
					</div>


				</section>

			</div>
		</section>
	</section>


</form>


<jsp:include page="/WEB-INF/jsp/common/Footer2.jsp" />

<script>

    $(function(){
        $("#allChk").on("click",function(){
            if ($(this).is(':checked')) {
                $("input[name='chkSn']").prop('checked', true);
            } else {

                $("input[name='chkSn']").prop('checked', false);
            }
        });
    });

    function fn_readGo(_a) {
        document.form1.sn.value = _a;
        document.form1.action = "appmain1Read";
        document.form1.submit();
    }

    function deletePost(){
        var cnt = $("input[name='chkSn']:checked").length;
        var arr = new Array();
        $("input[name='chkSn']:checked").each(function() {
            arr.push($(this).attr('value'));
        });
        if(cnt == 0){
            alert("선택된 글이 없습니다.");
        }
        else{
            $.ajax({
                type: "POST",
                url: "/admin/prtChkDelete",
                data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
                dataType:"json",
                success: function(jdata){
                    alert(jdata);
                    if(jdata != 'TRUE') {
                        alert("삭제 오류");
                    }else{
                        alert("삭제 성공");
                        location.href = "/admin/project";
                    }
                },
                error: function(data){location.href = "/admin/project";}
            });
        }
    }
</script>

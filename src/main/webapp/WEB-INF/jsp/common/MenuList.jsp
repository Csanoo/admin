<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String HEADERURL = request.getRequestURL().toString();
main.java.common.satelite.kr.LeftMenuUtil btr = new main.java.common.satelite.kr.LeftMenuUtil();
//btr.setUserProgram(HEADERURL);
%>

<%
	String sessionUTYPE = "";
	if ( session.getAttribute("USERTYPE") != null ) 
	{ sessionUTYPE = (String)session.getAttribute("USERTYPE"); }
%>

<ul class='wraplist'>
	<li class="<%=btr.CLASSOPEN(HEADERURL, "member1/Member")%>">

		<a href="javascript:;"> <i
			class="fa fa-folder-open"></i> <span class="title">회원관리</span>
			<span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li><a href="/admin/memberList"	class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Member")%>"> <span class="title">회원 목록</span>	</a></li>

		</ul>
	</li>
	<li class="<%=btr.CLASSOPEN(HEADERURL, "member1/Contents2")%>">
		<a href="javascript:;">
			<i class="fa fa-folder-open"></i> <span class="title">컨텐츠 관리</span><span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li>
				<a href="/admin/project" class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Contents2")%>">
					<span class="title">프로젝트 컨텐츠 관리</span>
				</a>
			</li>
			<li>
				<a href="/admin/contents" class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Contents2")%>">
					<span class="title">기본 컨텐츠 관리</span>
				</a>
			</li>
			<li>
				<a href="/admin/RegExcel" class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Contents2")%>">
					<span class="title">컨텐츠 엑셀 등록 </span>
				</a>
			</li>
		</ul>
	</li>
	<li class="
		<%=btr.CLASSOPEN(HEADERURL, "AppMain")%>
		<%=btr.CLASSOPEN(HEADERURL, "Banner")%>
		<%=btr.CLASSOPEN(HEADERURL, "posts/Post")%>">
		<a href="javascript:;"> <i class="fa fa-folder-open"></i>
			<span class="title">운영 관리</span> <span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li>
				<a href="/admin/PostList" class="<%=btr.CLASSACTIVE(HEADERURL, "Posts")%>">
					<span class="title">공지사항-알림</span>
				</a>
			</li>
			<li><a href="/admin/AppMain1"
				class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain1")%>"> <span
					class="title">팝업 관리</span>
			</a></li>
			<li><a href="/admin/appmain1Form"
				class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain2")%>"> <span
					class="title">팝업 등록</span>
			</a></li>
			<li><a href="/admin/BannerList"
				class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain3")%>"> <span
					class="title">프로젝트 배너관리</span>
			</a></li>
			<li><a href="/admin/banner1Form"
				class="<%=btr.CLASSACTIVE(HEADERURL, "AppMain4")%>"> <span
					class="title">프로젝트 배너등록</span>
			</a></li>
		</ul>
	</li>
	<li class="<%=btr.CLASSOPEN(HEADERURL, "posts/Ytb")%> <%=btr.CLASSOPEN(HEADERURL, "Contents")%>">
		<a	href="javascript:;"> <i class="fa fa-folder-open"></i>
			<span class="title">크롤링 관리</span> <span class="arrow "></span>
		</a>
		<ul class="sub-menu">
			<li><a href="/admin/ytbForm"
				class="<%=btr.CLASSACTIVE(HEADERURL, "posts/Ytb")%>"> <span
					class="title">크롤링</span>
			</a></li>

			<li><a href="/admin/codeList" class="<%=btr.CLASSACTIVE(HEADERURL, "member1/Code")%>"> <span class="title">코드목록</span></a></li>
		</ul>
	</li>
</ul>
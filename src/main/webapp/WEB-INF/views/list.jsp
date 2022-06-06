<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="include/head.jsp" %>
<%@ include file="include/plugin_js.jsp" %>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  
  <%@ include file="include/main_header.jsp" %>
  
  <!-- Left side column. contains the logo and sidebar -->

  <%@ include file="include/left_column.jsp" %>
  <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시판 전체조회 <small>검색 및 페이징처리</small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 게시판들</li>
					<li class="active"><a href="/board/list">게시판</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="search">
					<select name="searchType" id="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}" />>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}" />>
							제목</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}" />>
							작성자</option>
						<option value="tw"
							<c:out value="${cri.searchType eq 'tw'?'selected':''}" />>
							제목+작성자</option>

					</select>
					
				</div>
				<div>
					<input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword}'>
					<button id='searchBtn'>Search</button>
				<script>
							$(function() {
								$('#searchBtn').click(function() {
									self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput').val());
									});
							});
						</script>
				
				</div>
				
				

				<!-- 페이징 후 보여지는 갯수 처리 -->
				<div style="float: right;">
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="5"
							<c:if test="${pageMaker.cri.perPageNum == 5}">selected</c:if>>5줄
							보기</option>
						<option value="10"
							<c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${pageMaker.cri.perPageNum == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${pageMaker.cri.perPageNum == 20}">selected</c:if>>20줄
							보기</option>
					</select>
				</div>
				<script>
						function selChange() {
							var sel = document.getElementById('cntPerPage').value;
							var type = document.getElementById('searchType').value;
							var keyword = document.getElementById('keywordInput').value;
							
							location.href = "list?page=1&perPageNum=" + sel+"&searchType="+type+"&keyword="+keyword;
						}
					</script>


				<div class="table-responsive">
					<table class="table">
						<tr>
							<td>글번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td>작성자</td>
							<td>조회수</td>
						</tr>
						<c:forEach var="board" items="${list }">
							<tr>
								<td>${board.bno}</td>
								<td><a href="detail?bno=${board.bno}"> ${board.title} </a></td>
								<td>${board.regdate}</td>
								<td>${board.id}</td>
								<td><span class="badge">${board.readcnt }</span></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="center"><input
								class="btn btn-success" type="button" value="메인으로" id="main" />
							</td>
						</tr>
					</table>
				</div>
							<div>
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage -1) }">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class=active':''}" />>
							<a href="list${pageMaker.makeSearch(idx)}"> ${idx } </a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">다음</a></li>
					</c:if>
				</ul>
			</div>
			</section>
			<script type="text/javascript">
				var result = '${msg}';
				if (result == 'regist') {
					alert("등록되었습니다.");
				}else if(result == 'update'){
					alert("수정되었습니다");
				}else if(result == 'delete'){
					alert("삭제되었습니다");
				}
			</script>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@ include file="include/main_footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>
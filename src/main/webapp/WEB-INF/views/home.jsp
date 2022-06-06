<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>

<html>
<%@ include file="include/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
  <%@ include file="include/main_header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  
  <%@ include file="include/left_column.jsp" %>
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       메인페이지
        <small>홈페이지 구성</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 위치</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

			<script type="text/javascript">
				var result = '${msg}';
				var name = '${name}'
				if (result == 'join') {
					alert(name+"님 가입되었습니다.");
				}
			</script>
      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        
		<div class="box-header with-border">
			<c:if test="${user==null }">
			</c:if>		
			<c:if test="${user!=null }">
				${user.name }님 환영합니다. <br />
			</c:if>	
		</div>
		<hr>
				<table border="1">
					<tr align="center">
						<td colspan="2">홈페이지 기능 개요</td>
					</tr>

					<tr>
						<td width="400">로그인/로그아웃<br> <br>
						</td>
						<td width="400"><a href="/user/login">loginForm</a>->세션부여<br>
							<a href="/user/logout">로그아웃</a>->세션무효화<br></td>
					<tr>
						<td width="400">회원가입<br> <br>
						</td>
						<td width="400"><a href="/user/join">회원가입 폼</a>->id확인->계정등록<br>
					</tr>
					<tr>
						<td width="400">게시판 기능<br> <br>
						</td>
						<td width="400"><a href="/board/list">페이징 처리된 게시판</a>->검색,보여지는 게시글 조절<br>
						게시글 상세조회 후 댓글조회, 수정,삭제<br>
						댓글 등록,수정,삭제<br>
						세션확인 인터셉트(세션 없을 시 로그인페이지)<a href="/board/regist">->게시글쓰기 폼</a><br>
						</td>
					
	
				</table>
			</section>
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
            </a>
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
            </a>
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
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
<!-- REQUIRED JS SCRIPTS -->
<%@ include file="include/plugin_js.jsp" %>


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>
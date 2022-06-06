<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <aside class="main-sidebar">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
    <c:if test="${user!=null }">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${user.name }</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
	</c:if>
      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">게시판 메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        
        <c:if test="${user==null }">
			<li class="active"><a href="/user/login"><i class="fa fa-link"></i>
        		<span>DB로그인</span></a>
        	</li>
		</c:if>		
		<c:if test="${user!=null }">
			<li class="active"><a href="/user/logout"><i class="fa fa-link"></i>
        		<span>DB로그아웃</span></a>
        	</li>
		</c:if>	
        <li><a href="/user/join"><i class="fa fa-link"></i> <span>회원가입</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>게시판들</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/board/list">게시판</a></li>
            <li><a href="/board/regist">글쓰기</a></li>

          </ul>
        </li>
        


        
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

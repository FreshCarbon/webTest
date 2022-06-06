<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html>
<%@ include file="include/head.jsp"%>
<%@ include file="include/plugin_js.jsp"%>
<script>
   // ajax를 통한 댓글쓰기
   $(document).ready(function(){
      console.log("ajax test");
      
      //댓글 목록 불러오는 ajax 함수 작성
      replylist();
      
	  //댓글 저장버튼 클릭 이벤트(댓글쓰기)
	  $('#btnReplySave').click(function(){
		  console.log("댓글쓰기 눌러짐.");
		  var rememo = $("#rememo").val();
		  var rewriter = $("#rewriter").val();
		  
		  var url = "${pageContext.request.contextPath}/board/replyRegist";
		  var paramData = {
				  "rewriter" : rewriter,
				  "rememo" : rememo,
				  "bno" : '${board.bno}'
		  };
		  $.ajax({
			url : url,
			data : paramData,
			dataType : 'json',
			type : 'POST',
			success : function(result) {
				console.log(result);
				replylist();
				alert("댓글이 등록되었습니다.");
			},
			error : function(data){
				alert("에러가 발생했습니다." + data);
			}
			 
		  })
 
		  
	  });
   });
   
   
   
   // 댓글 목록 불러오기 : ajax
   function replylist(){
      var url = "${pageContext.request.contextPath}/board/replyList";
      var paramData = {
            "bno": ${board.bno}            
      };
      
      $.ajax({
         url  : url,
         data : paramData,
         dataType : 'json',
         type : 'POST',
         success : function(result){
            console.log("결과 내용을 보여주세요==> " + result);
            var htmls =""; // 댓글 모양꾸미기
            
            if(result.length <1){
               htmls += "<h3>등록된 댓글이 없습니다.</h3>";
            }
            else{
               $(result).each(function(){
            	  htmls = htmls + '<div class="" id="reno' +this.reno + '">';
                   //<div id="reno12"> <div id="reno13">
				  htmls += '<span class="d-block">';
				  htmls += this.reno + ' - ';
				  htmls += '<strong class="text-gray-dark">' + this.rewriter + '</strong>';
				  htmls += '<span style="padding-left: 7px; font-size: 9pt">';
				  htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.reno + ', \'' + this.rewriter + '\', \'' + this.rememo + '\' )" style="padding-right:5px">수정</a>';
				  htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reno + ')" >삭제</a>';
				  htmls += '</span>';
				  htmls += '</span><br>';
				  htmls += this.rememo;
				  htmls += '</p>';
				  htmls += '</div>';  
               });               
            }
            $("#replyList").html(htmls);// 댓글모양 주입
            
         },
         error : function(data){
            alert("에러가 발생했습니다." + data);
         }
      }); //ajax end
            
   }// end function replylist
   function fn_editReply(reno, rewriter, rememo){
	      var htmls =""; // 댓글 모양꾸미기
	      htmls = htmls + '<div class="" id="reno' +reno + '">';
	       htmls += '<span class="d-block">';
	       htmls += reno + ' - ';
	       htmls += '<strong class="text-gray-dark">' + rewriter + '</strong>';
	       htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	       htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reno + ', \'' + rewriter + '\', \'' + rememo + '\' )" style="padding-right:5px">저장</a>';
	       htmls += '<a href="javascript:void(0)" onclick="replylist()">취소</a>';
	       htmls += '</span>';
	       htmls += '</span><br>';
	       htmls += '<textarea name="editmemo" id="editmemo" class="form-control" rows="3">';
	       htmls += rememo;
	       htmls += '</textarea>'
	       htmls += '</p>';
	       htmls += '</div>'; 
	       //선택한 요소를 다른것으로 바꿉니다. (변경)
	      $('#reno'+reno).replaceWith(htmls);
	      $('#reno'+reno+'#editmemo').focus();       
	   } // end of fn_editReply
	   	
	   
	   
	// 댓글 수정 보내기
	   function fn_updateReply(reno, rewriter){
	      var editmemo = $('#editmemo').val();
	      var url = "${pageContext.request.contextPath}/board/replyUpdate"; //ajax수정
	      var paramData = {
	            "reno" : reno,
	            "rewriter" : rewriter,
	            "rememo" : editmemo
	      }; // 수정데이터
	      $.ajax({
	         url : url,
	         data : paramData,
	         dataType : 'json',
	         type : 'POST',
	         success : function(result){
	            console.log(result);
	            replylist(); //댓글목록 호출
	         },
	         error : function(data){
	            console.log(data);
	            alert("에러가 발생했습니다.");
	         }
	      });    
	   }
	   
	   function fn_deleteReply(reno){ //댓글 삭제 함수
		   
		   var url = "${pageContext.request.contextPath}/board/replyDelete"; // ajax삭제
		   var paramData = {
				"reno" : reno
		   }
		   $.ajax({
			   url : url,
			   data : paramData,
			   dataType : 'json',
			   type : 'POST',
			   success : function(result){
				   console.log(result);
				   replylist();
			   },
			   error : function(data){
				   console.log(data);
		           alert("에러가 발생했습니다.");
			   }
		   });
		   
	   }

</script>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->

		<%@ include file="include/main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->

		<%@ include file="include/left_column.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시판 <small>게시글 보기</small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i>게시판들</li>
					<li class="active"><a href="board/list">게시판</a></li>
					<li class="active">상세보기</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="box">
					<div class="box-header">
						<h3 class="box-title">상세보기</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label>제목</label> <input type="text" name="title"
								class="form-control" value="${board.title}" readonly="readonly" />
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea name="content" rows="5" readonly="readonly"
								class="form-control">${board.contents}</textarea>
						</div>

						<div class="form-group">
							<label>작성자</label> <input type="text" name="id"
								class="form-control" value="${board.id}" readonly="readonly" />
						</div>
					</div>

				</div>
				<div class="box-footer">
					<button id="main" class="btn btn-success">메인</button>
					<button id="update" class="btn btn-warning">수정</button>
					<button id="delete" type="submit" class="btn btn-danger">삭제</button>
					<button id="list" class="btn btn-primary">목록</button>
				</div>
				<div>
					<div class="box-body">
						<table>
							<tr>
								<td rowspan="2" width="70%"><textarea class="form-control"
										name="rememo" id="rememo" placeholder="댓글을 입력하세요"></textarea>
								</td>
								<td><input type="text" name="rewriter" id="rewriter"
									placeholder="댓글작성자"></td>
							</tr>
							<tr>
								<td><button type="button" id="btnReplySave">저장</button></td>
							</tr>
						</table>

					</div>
				</div>
				<hr>
				
				<div id="replyList"></div>

				<hr>

			</section>

			<script>
				$(function() {
					//메인 버튼을 눌렀을 때 처리
					$("#main").click(function() {
						location.href = "/#";
					});
					//목록 버튼을 눌렀을 때 처리
					$("#list").click(function() {
						location.href = "/board/list";
					});
					//삭제 버튼을 눌렀을 때 처리
					$("#delete").click(function() {
						location.href = "/board/delete?bno=" + ${board.bno};
					});
					//수정 버튼을 눌렀을 때 처리
					$("#update").click(function() {
						location.href = "/board/update?bno=" + ${board.bno};
					});
					//댓글작성 버튼을 눌렀을 때 처리
					$("#comment").click(function() {location.href = "reply?bno=" + ${board.bno};
					});
				})
			</script>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="include/main_footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
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
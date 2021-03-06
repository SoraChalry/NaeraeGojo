<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .no-margin {
    padding: 10px !important;
}
.box-title {
    font-size: 30px !important;
}
#modal-container {
  width: 200%;
  /* One Modal --> 100%, Two modals --> 200%*/
  overflow: hidden
}

.modal-dialog {
  float: left;
  width: 50%;
  margin: 5px auto;
}

.modal-content {
    width: 720px;
    height : 350px;
    margin-top: 200px;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 200px;
}

.modal-body{
    
    height: 60%;
/*     margin: auto; */
    overflow-y:auto;
    overflow-x:hidden;
    margin: 15px;
/*     border: 1px solid ; */
    
}

table th {
    font-size: large;
}


table td {
    font-size: medium;
}


</style>
<script type="text/javascript">

$(function(){
	
//     $('input[type="checkbox"].flat-red').iCheck({
//         checkboxClass: 'icheckbox_flat-blue'
//       });
    
    
	//상세내용
    $('#listTable tr:gt(0)').click(function(){
        var video_chat_room_code = $(this).find('td:eq(0) input').val();
        $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatView/'+video_chat_room_code+'.do');
    });
    
    // 화상개설
    $('#btn1').click(function(){
    	 $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatForm.do');
    });
    
//     $('#btn1').click(function(){
//     	 $(location).attr('href', '${pageContext.request.contextPath}/user/video/chatForm.do');
//     });

    $('#modal1').click(function(){
        
    	$('#myModal').modal('show');
    	
//         $.ajax({
            
//              type : "POST"
//                  , url : "${pageContext.request.contextPath}/user/video/modalProject.do"
//                  , dataType : "json"
//                  , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
//                  , error : function(request, status, error) {
//                         alert("error : " + request.status );
//                  }
//                  , success : function(modalPro) {
//                      $('#mymodal').modal('show');
                     
//                      for (var i = 0; i < modalPro.modalPro.length; i++) {
                         
//                          $('#ff').append('<label><input type="checkbox" name="chkbox" class="flat-red" value="'+ modalPro.modalPro[i].pw_code +'">'+ modalPro.modalPro[i].pw_function +'</label>');
//                      }
//                 }
//         });
    });   


    $(".btn-next").click(function() {
    	  $('#modal-container').animate({
    	    'margin-left': '-=100%'
    	  }, 500);
    });

   	$(".btn-back").click(function() {
   	    $('#modal-container').animate({
   	        'margin-left': '+=100%'
   	    }, 500);
   	});
    
    
});


</script>

    <!-- Main content -->
    <section class="content"> 
    <br/>
    <div class="col-md-2"  style="float:right;">
      <input id="modal1" value="+ 화상회의 개설" type="button" class="btn btn-block btn-warning btn-lg "   style="float:right;  border:1px outset;">
    </div>
    <br/>
     <br/>
      <br/>
      <div class="col-md-12">
        <!-- TABLE: LATEST ORDERS -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <b class="box-title">화상회의 목록</b>
              <br/><br/>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover" style="margin:auto;" id="listTable">
                  <thead>
                  <tr>
                    <th>No.</th>
                    <th>회의일자</th>
                    <th>회의 제목</th>
                    <th>관련 프로젝트</th>
                    <th>참여인원</th>
                    <th>상태</th>
                    <th>개설자</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${chatroomList}" var="chatroomInfo">
	                  <tr>
                            <td style="width: 100px;"><input type="hidden" value="${chatroomInfo.video_chat_room_code}">${chatroomInfo.rnum}</td>
                            <td style="width: 180px;">${chatroomInfo.video_chat_room_date}</td>
                            <td  style="width: 350px;">${chatroomInfo.video_chat_room_title}</td>
                            <td style="width: 350px;">${chatroomInfo.project_name}</td>
                            <td style="width: 150px;">${chatroomInfo.emp_cnt}<label> 명</label></td>
                            <c:if test="${chatroomInfo.video_chat_status=='y'}">
                                <td  style="width: 140px;"><span class="label label-warning ">종료</span></td>
                            </c:if>
                            <c:if test="${chatroomInfo.video_chat_status=='n'}">
                                <td  style="width: 140px;"><span class="label label-info">진행중</span></td>
                            </c:if>                            
                            
                            <td style="width: 120px;">${chatroomInfo.emp_name}</td>
	                  </tr>
                  </c:forEach>
                  </tbody>  

                </table>
              </div>
              
              <!-- /.table-responsive ㅇㅇㄹㅇㄹ-->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
                ${paging }
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
         </section>     
        <form action="${pageContext.request.contextPath}/user/video/chatList.do" method="post" class="form-inline pull-right">
        <select class="form-control" name="search_keycode" >
<!--            <option>검색조건</option> -->
            <option value="TOTAL">전체</option>
            <option value="TITLE">제목</option>
            <option value="CONTENT">내용</option>
            <option value="WRITER">개설자</option>
        </select>
        <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
        <button type="submit" class="btn btn-primary form-control">검색</button>
        </form>
        
  
 <!-- 모달 -->       
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div id="modal-container">
  
    <div class="modal-dialog" role="document">
      <div class="modal-content" >
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 class="modal-title" id="myModalLabel">관련 프로젝트</h3>
        </div>
        
        <div class="modal-body" style="margin-bottom:auto;">
            <div class="col-md-6">
              <div class="box box-solid box-primary">
              <div class="box box-primary">
              
                <div class="box-header with-border" >
                  <a type="next" class="btn-next"><h3>정부청사관리본부 정보시스템 통합유지보수</h3></a>
                </div>
                <div class="box-body">
                    <h5>프로젝트 기간 : &nbsp;<i style="font-size: 20px;"></i></h5>
                  </div>
              </div>
              </div>
             </div>
            <div class="col-md-6">
              <div class="box box-solid box-primary">
              <div class="box box-primary">
                <div class="box-header with-border" >
                  <a class="btn-next"><h3>정부청사관리본부 정보시스템 통합유지보수</h3> </a>
                </div>
                <div class="box-body">
                    <h5>프로젝트 기간 : &nbsp;<i style="font-size: 20px;"></i></h5>
                  </div>
              </div>
              </div>
             </div>
	    </div> 
        <div class="modal-footer" >
<!--           <button type="next" class="btn btn-primary btn-next">Move Next</button> -->
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
    </div>
    
    <div class="modal-dialog" role="document" ">
      <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 class="modal-title" id="myModalLabel">직원초대</h3>
        </div>
        <div class="modal-body">
           
            <table class="table table-striped">
                <tr>
                  <th  style="width:10px"></th>
                  <th style="width: 70px">사원번호</th>
                  <th style="width: 70px">이름</th>
                  <th style="width: 70px">담당부서</th>
                  <th style="width: 60px">역할</th>
                </tr>
                <tr>
                  <td><input type="checkbox" name="chkbox" class="flat-red" value=""></td>
	               <td>25125</td>
	               <td>최동화</td>
	               <td>개발1팀</td>
	               <td>DA</td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="chkbox" class="flat-red" value=""></td>
	               <td>25125</td>
	               <td>이동화</td>
	               <td>개발2팀</td>
	               <td>DA</td>
                </tr>
             </table>
          
        </div>
        <div class="modal-footer" style="padding-bottom : 5px !important;  padding-top : 5px !important;">
          <button type="back" class="btn btn-default btn-back">뒤로가기</button>
          <input type="button" value="등록" class="btn btn-primary ">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    
  </div>
  </div>

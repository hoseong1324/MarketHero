<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
	
    <script type="text/javascript">
        window.onload = function () {

           init(); 
           Notification.requestPermission(function (result){
	            if (Notification.permission == 'denied') {
	                alert('알림설정 거부 시 신규주문 알림을 받을 수 없습니다.');
	            }else {
	            //새로고침마다 뜨게
	            }
	          });
        }
 
        // 알림
        function calculate() {
        	var notification = new Notification('신규 주문이 등록되었습니다.', {
                icon: '<c:url value= "/resources/images/menu/menu_ci.png"/>',
                body: 'ex.신라면(box) 외 3개 상품 - 킹스마트',
            });

            notification.onclick = function () {
                window.open('#');
            };
            
            setTimeout(function () {
                notification.close();
            }, 4000);
        }
        
        
        //신규주문 조회 요청
        function init()
        {
    	    $.ajax({
    	        url : '${pageContext.request.contextPath}/alarm/merchant' 
    	        , type : 'GET' 
    	        , dataType : 'text' 
    	        , success: function (result) {
    				if (result == "true") {
    					calculate();
    					console.log("예쓰")
    					console.log(result)
    				}else{
						console.log("조회중")
        				}
    	        }
    	       , error:function(request,status,error){
    	            console.log("시발");
    	        }
    	    });
            
    	    //신규주문 조회하는 함수 불러오기 , 반복 시간
			setTimeout('init()',5000);
        }

    </script>
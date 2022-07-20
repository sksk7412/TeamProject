<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>

var naverLogin = new naver.LoginWithNaverId(
        {
        	 clientId: '8Y65VuJ4FktggRb3Yxgs',
             callbackUrl: 'http://localhost:8081/Joohyeon/naver_callback.jsp',
            isPopup: true,
            callbackHandle: true
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
        }
    );

    /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
    naverLogin.init();

    /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) {
                /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
		
                // 유저 아이디, 이메일 주소, 이름을 Session에 저장하였습니다.
                sessionStorage.setItem("user_info",naverLogin.user.id);
                sessionStorage.setItem("naver_name", naverLogin.user.getName());
 
                // 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장합니다.
                sessionStorage.setItem("kinds","naver");

                
                let url = "http://localhost:8081/Joohyeon/join.jsp";
                location.href = url;
                
                } else {
                console.log("callback 처리에 실패하였습니다.");
            }
        });
    });
</script>

</body>
</html>
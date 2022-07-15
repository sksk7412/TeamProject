const node = $('#checkAll').get(0);
const checkboxes = $(':checkbox');
const warning = $('.warning');
const req = $(".req");
function checkVal(form) {
    if (checkboxes.get(1).checked && checkboxes.get(4).checked)
        form.submit();
    else {
        alert('필수항목에 동의해주세요.');
        for (let i = 0; i < warning.length; i++) {
            warning.show();
        }
    }
}
$('#checkAll').click(e => {
    if (node.checked) {
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes.get(i)
                .checked = true;
        }
    }
    else {
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes.get(i)
                .checked = false;
        }
    }
})
Kakao.init('3f31e8bd109b34cf032b507e1c53d24e');
console.log(Kakao.isInitialized());
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
const naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "8Y65VuJ4FktggRb3Yxgs",
				callbackUrl: "http://localhost:8081/naver.Login",
				loginButton: {color: "green", type: 3, height: 44}
			}
		);
 naverLogin.init(); // 로그인 설정
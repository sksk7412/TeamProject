const node = $('#checkAll').get(0);
const checkboxes = $(':checkbox');
const warning = $('.warning');
const req = $(".req");

function checkVal(form) {
    if (checkboxes.get(1).checked && checkboxes.get(4).checked){
		form.submit();
		}
		
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
 			console.log(response)
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
			let account = response.kakao_account;
			$('#testId').val(response.id);
			$('#testPw').val(account.profile.nickname);
			console.log(account.profile.nickname);
			console.log(response.id);
			$('#command').val('kakaologin');
			$('.test').submit();
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
function kakaoLogin2() {
    Kakao.Auth.login({
      success: function (response) {
 			console.log(response)
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
			let account = response.kakao_account;
			$('#UserId').val(response.id);
			$('#UserPw').val(account.profile.nickname);
			$('#UserName').val(account.profile.nickname);
			console.log(account.profile.nickname);
			console.log(response.id);
			$('#command').val('kakaologin');
			$('.test').submit();
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

  var naverLogin = new naver.LoginWithNaverId({
        clientId: '8Y65VuJ4FktggRb3Yxgs',
        callbackUrl: 'http://localhost:8081/teamProject/naver_callback.jsp',
        isPopup: true /* 팝업을 통한 연동처리 여부 */,
        loginButton: { color: 'green', type: 3, height: 44 } /* 로그인 버튼의 타입을 지정 */,
      });

      /* 설정정보를 초기화하고 연동을 준비 */
      naverLogin.init();


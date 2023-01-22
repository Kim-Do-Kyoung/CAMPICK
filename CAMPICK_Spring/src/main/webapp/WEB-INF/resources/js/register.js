
function pw_duplicate(){
	
	const pw1 = document.getElementById("user_pw");
	const pw2 = document.getElementById("user_pw2");
	const checkMsg = document.getElementById("checkMsg");
	if(pw1.value==pw2.value){
		checkMsg.style.color = "#134f2c";
		checkMsg.innerText = "OK!";
        return true;
	} else{
		checkMsg.style.color = "#D1433A";
		checkMsg.innerText = "불일치";   
	}
}

function pwCheck(){

   const password =  document.getElementById("user_pw");
   const pwMsg = document.getElementById("pwMsg");
   const pattern = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 ( 3 가지 조합)
     
     if(pattern.test(password.value)){
        pwMsg.style.color = "#134f2c";
        pwMsg.innerText = "사용 가능한 비밀번호입니다.";
         return true;
     }
     else{
        pwMsg.style.color = "#D1433A";
        pwMsg.innerText = "8~12자리의 특수문자/영문자/숫자 포함";   
         
   }
   }

function register(){
	const checking = document.getElementById("idCheckResult");
	if(checking.value=="idOk"){
		joinForm.method="post";
		joinForm.action="userRegister.do";
		joinForm.submit();
	}else{
		alert("id 중복 체크는 필수입니다!");
	}
}

/*


  function register(){
        	var joinForm = document.joinForm;
        	var id = joinForm.user_id.value;
        	var pw = joinForm.user_pw.value;
        	var pw2 = joinForm.user_pw2.value;
        	var idCheck = joinForm.idCheckResult.value;
        	
        	
        	if(pw.length<8||pw.length>12){
        		alert("비밀번호는 8자 이상 12자 이하로 해주세요.");
        		joinForm.pw.focus();
        		return false;
        	}else if(pw!=pw2){
        		alert("입력하신 비밀번호가 다릅니다.");
        		return false;
        		
        	}else{
        		joinForm.method="post";
        		joinForm.action="user.do?action=register";
        	}
        	}
        
 function idCheck(){
	 
	 var id = joinForm.user_id.value;
	 if(id!=null){

		 var popup = window.open('idCheck.jsp', 'ID중복체크', 'width=500px,height=400px');
	 }
 }
 
	 alert("id check!");
	 var id = joinForm.user_id.value;
	 
	 
	if(id!=null){
		 joinForm.method="post";
		 joinForm.action="user.do?action=checkID";
		 joinForm.submit();
		 
		 if(result){
			 alert('사용 가능한 아이디입니다.');
			 joinForm.idCheckResult.value = "idOK";
			 joinForm.user_id.value = "thisisID";
			 joinForm.user_id.readOnly = true;
			 
		 }else{
			 alert('다른 아이디를 입력해 주세요.');
		 }
		*/

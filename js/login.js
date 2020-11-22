function dologin(){
    var uid = document.login.uid.value;
    if(uid.length < 5 || uid == null){
        alert("로그인 아이디를 입력해 주십시오. ");
        
        return false;
    }
    var pwd = document.login.pwd.value;
    if( pwd.length < 4 || pwd == null){
        alert("비밀번호는 4자 이상입니다.. ");
        return false;
    }
    document.login.submit();
}




function dojoin(){

    const uid = document.joinform.uid.value;
    if(uid.length<5 || uid == null){
        alert("아이디를 다시 입력해주세요. 아이디는 필수 입력입니다.");
        return false;
    }
    const pwd = document.joinform.pwd.value;
    if(pwd.length<6 || pwd == null){
        alert("비밀번호를 다시 입력해주세요. 비밀번호는 필수 입력입니다.");
        return false;
    }
    const phone = document.joinform.phone.value;
    if(phone.length!=11 ){
        alert("전화번호를 정확히 입력해주세요.");
        return false;
    }
    const uname = document.joinform.uname.value;
    if(uname.length<2 || uname == null){
        alert("이름은 두글자 이상 필수 입력입니다.");
        return false;
    }
    document.joinform.submit();
}


function pagechange(clicked_id){
    console.log(clicked_id);
    location.href = "item.jsp?image="+clicked_id;
}
function itemchange(clicked_id){
    
    location.href = "market.jsp?category="+clicked_id;
       
}
function wr(clicked_id){

    console.log(clicked_id);
    location.href = "mypage.jsp?itemid="+clicked_id;
}

function reviewwrite(){
    const title = document.rewrite.title.value;
    if(title.length < 2 || title == null){
        alert("제목은 두글자 이상 입력해야합니다. ");
        return false;
    }
    const content = document.rewrite.content.value;
    if(content.length < 2 || content == null){
        alert("본문은 두글자 이상 입력해야합니다. ");
        return false;
    }
    document.rewrite.submit();
}

//function view(clicked_id){
    //location.href = "board.jsp?bid="+clicked_id;
//}

function view(clicked_id) {
    location.href = "board.jsp?bid="+clicked_id;
}
function notice(clicked_id) {
    location.href = "board.jsp?nid="+clicked_id;
}
function closed(){
    location.href="board.jsp";
}


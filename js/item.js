function change(num) {
    var x = document.orderform.count.value;
    var y = Number(x)+num;
    if(y < 1) y = 1;
    
    document.getElementById("cnt").value = y;
}
function get(){
    
    const count = document.orderform.cnt.value;
    //alert("주문하신 상품 개수는" + count + "개 입니다.");
    document.orderform.submit();
}
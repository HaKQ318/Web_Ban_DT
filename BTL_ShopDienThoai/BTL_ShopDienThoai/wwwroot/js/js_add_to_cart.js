function  addToCart(item) {
    debugger;          
     item.quantity = 1;
     console.log(item.quantity);
     var list;
     if (localStorage.getItem('giohang') == null) {
         list = [item];
     } else {
         list = JSON.parse(localStorage.getItem('giohang')) || [];
     let ok = true;
     for (let x of list) {
         if (x.id == item.id) {
            x.quantity += 1;
            ok = false;
            break;
            }
        }
        if(ok){
            list.push(item); 
        } 
    }
    localStorage.setItem('giohang', JSON.stringify(list));
    alert("Đã thêm giỏ hàng thành công");
}
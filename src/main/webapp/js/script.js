function add_to_cart(pid,pname,price)
{
  let cart=localStorage.getItem("cart");
    if(cart==null)
    {
        let products=[];
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:price};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("Product is added for the first time");
    }
    else
    {
        let pcart=JSON.parse(cart);
        let oldProduct=pcart.find((item) => item.productId==pid))
          if(oldProduct)
          {
              oldProduct.productQuantity=oldProduct.productQuantity+1;
              pcart.map((item)=>{
                  if(item.productId==oldProduct.productId)
                  {
                      item.productQuantity=oldProduct.productQuantity;
                  }
              })
              localStorage.setItem("cart",JSON.stringify(pcart));
              console.log("Product Quantity is increased");
          }
          else
          {
              let product={productId:pid,productName:pname,productQuantity:1,productPrice:price};
              pcart.push(product);
              localStorage.setItem("cart",JSON.stringify(pcart));
              console.log("Product is added");
          }
          
    }
    updateCart();
}

function updateCart()
{
    
  let cartString=localStorage.getItem("cart");
   let cart=JSON.parse(cartString); 
    if(cart==null || cart.length==0)
    {
        console.log("Cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart doesn't have any items</h3>");
        $(".checkout-btn").addClass('disable');
    }
    else
    {
        console.log(cart);
       $(".cart-items").html(`( ${cart.length} )`);    
        let table=`
        <table class="table">
        <thead class="thead-light">
         <tr>
         <th>Item Name</th>
         <th>Price</th>
         <th>Quantity</th>
         <th>Total Price</th>
         <th>Action</th>
          </tr>
        </thead>                 
   `     ;
       cart.map((item)=>{
            table+=
                    <tr>
            <td>${item.productName}</td>
            <td>${item.productName}</td>
            <td>${item.productprice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productName*item.productPrice}</td>
            <td><button class="btn btn-danger-btn-sm">Remove</button></td>
           
                   </tr>
                   
            totalPrice=item.productPrice*item.productQuantity;       
       }); 
        
        
   table=table+`<tr><td class='text-right font-weight-bold'>Total Price:${totalPrice}</td></tr></table>`;
    $(".cart-body").html(table);
   }
}
$(document).ready(function(){
    updateCart();
});


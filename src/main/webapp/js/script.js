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
        let oldProduct=pcart.find((item) => item.productId==pid);
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
    
}

function updateCart()
{
    
    
    
    
}
$document.ready(function(){
    updateCart()
})


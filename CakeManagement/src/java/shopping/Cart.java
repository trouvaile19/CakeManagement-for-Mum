package shopping;

import java.util.HashMap;
import java.util.Map;
import shopping.Product;

public class Cart {
    private Map<String, Product> cart;
    
    public Cart(){}

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public boolean add(Product product) {
        boolean check = false;
        try{
            if(this.cart == null){
                this.cart = new HashMap<>();
            }
            if(this.cart.containsKey(product.getProductID())){
                int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getProductID(), product);
            check = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return check;
    }

    public boolean edit(String id, int quantity) {
        boolean check = false;
        try{
            if(this.cart != null){
                if(this.cart.containsKey(id)){
                    this.cart.get(id).setQuantity(quantity);
                    check = true;
                }
            }
        }catch(Exception e){
        }
        return check;
    }

    public void remove(String id) {
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.remove(id);
            }
        }
    }
    
}

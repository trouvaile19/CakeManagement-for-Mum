
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import shopping.Product;
import utils.DBUtils;

public class CakeDAO {
    private static final String LIST_PRODUCT = "SELECT productID, name, price, quantity FROM tblProducts";
    private static final String CHECK_QUANTITY = "SELECT quantity FROM tblProducts WHERE productID = ?";
    
    public List<Product> getListCake() throws SQLException{
        List<Product> listCake = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!= null){
                psm = conn.prepareStatement(LIST_PRODUCT);
                rs = psm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    listCake.add(new Product(productID, name, price, quantity));
                }
            }
        }catch(ClassNotFoundException | SQLException e){
            
        }finally{
            if(rs!= null) rs.close();
            if(psm!= null) psm.close();
            if(conn!= null) conn.close();
        }
        
        return listCake;
    }
    
    public int checkQuantity(String productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(CHECK_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if(rs.next()){                   
                    quantity = rs.getInt("quantity");
                }
            }
            
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return quantity;
    }
    
}



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import enity.Category;
import enity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductDAO extends DAO.DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    // LIST
    public List<Product> getListProductSale() {
        List<Product> list = new ArrayList<>();

        String query = "SELECT top 10 *\n"
                + "  FROM [MyProject_Clothing].[dbo].[Product]\n"
                + "  order by price asc\n";

        try {
            ps = connection.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                list.add( new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getFloat(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6)
                        )
                );
            }

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return list;
    }

    public List<Category> getAllCate() {
        List<Category> list = new ArrayList<>();

        String query = " select * from Category";

        try {
            ps = connection.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return list;
    }

    public List<Product> getProductByCid(int cid, int index) {
        List<Product> list = new ArrayList<>();

        String query = "select * from Product\n"
                + "WHERE categoryID = ?;";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, cid);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getFloat(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6)
                        )
                );
            }

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return list;
    }

    public List<Product> getProductBySearch(String txtSearch) {
        List<Product> list = new ArrayList<>();

        String query = "select * from Product\n"
                + "WHERE productName like ?;";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getFloat(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6)
                        )
                );
            }

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return list;
    }

    public Product getProductById(int productID) {
        String query = "select * from Product\n"
                + "  where Product.productID = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setInt(1, productID);

            rs = ps.executeQuery();

            if (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getFloat(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));
                return product;
            }
        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return null;
    }

    // TOTAL PRODUCT
    public int totalProduct() {

        String query = "select count(*) from Product";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return 0;
    }

    // PAGINATION
    public List<Product> getListPageByIndex(int index) {
        List<Product> list = new ArrayList<>();

        String query = "select * from Product\n"
                + "  order by productID\n"
                + "  offset ? rows fetch next 8 rows only;";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(
                        new Product(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getFloat(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6)
                        )
                );
            }

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return list;
    }

    public void deleteProductByProductID(int productID) {
        String sql = "delete from OrderItem\n"
                + "  where ProductID = ?";

        try {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, productID);

            ps.executeUpdate();
        } catch (SQLException exception) {
            System.out.println(exception);
        }

        String query = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE Product.productID = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setInt(1, productID);

            ps.executeUpdate();
        } catch (SQLException exception) {
            System.out.println(exception);
        }
    }

    public void updateProductByProductID(String productName, double price,
            String img, String des, int categoryID, int productID) {

        String query = "UPDATE [dbo].[Product]\n"
                + "   SET [productName] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[categoryID] = ?\n"
                + " WHERE Product.productID = ?";

        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, productName);
            ps.setDouble(2, price);
            ps.setString(3, img);
            ps.setString(4, des);
            ps.setInt(5, categoryID);
            ps.setInt(6, productID);

            ps.executeUpdate();

        } catch (SQLException exception) {
            System.out.println(exception);
        }

    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.getProductBySearch("polo"));
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import DAO.ProductDAO;
import enity.Category;
import enity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "EditProduct", urlPatterns = {"/editProduct"})
public class EditProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO proDao = new ProductDAO();
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Product pro = proDao.getProductById(id);
            List<Category> list = proDao.getAllCate();

            request.setAttribute("product", pro);
            request.setAttribute("list", list);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO proDao = new ProductDAO();

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String des = request.getParameter("des");
        String price = request.getParameter("price");
        String cate = request.getParameter("cate");
        String img = request.getParameter("img");
        
        proDao.updateProductByProductID(
                name,
                Double.parseDouble(price),
                img,
                des,
                Integer.parseInt(cate),
                Integer.parseInt(id));

        response.sendRedirect("manageProduct");
    }

}

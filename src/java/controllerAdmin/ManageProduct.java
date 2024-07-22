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

@WebServlet(name = "ManageProduct", urlPatterns = {"/manageProduct"})
public class ManageProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO proDao = new ProductDAO();
        try {
            // INDEX PAGE AND TOTAL
            int indexPage = Integer.parseInt(
                    request.getParameter("index") == null ? "1" : request.getParameter("index")
            );
            int maxPage
                    = proDao.totalProduct() % 8 == 0 ? (proDao.totalProduct() / 8) : (proDao.totalProduct() / 8 + 1);

            // LIST 
            List<Product> listPro = proDao.getListPageByIndex(indexPage);
            List<Category> listCa = proDao.getAllCate();

            // REQUEST
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("listPro", listPro);
            request.setAttribute("listCa", listCa);
            request.getRequestDispatcher("manageProduct.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}

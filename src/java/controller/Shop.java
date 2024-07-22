/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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

@WebServlet(name = "Shop", urlPatterns = {"/shop"})
public class Shop extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO proDao = new ProductDAO();
        try {
            String cate = request.getParameter("cate");
            String search = request.getParameter("search");

            // INDEX PAGE AND TOTAL
            int indexPage = Integer.parseInt(
                    request.getParameter("index") == null ? "1" : request.getParameter("index")
            );
            int maxPage
                    = proDao.totalProduct() % 8 == 0 ? (proDao.totalProduct() / 8) : (proDao.totalProduct() / 8 + 1);

            // LIST 
            List<Product> listPro = proDao.getListPageByIndex(indexPage);
            List<Category> listCa = proDao.getAllCate();

            if (cate != null) {
                System.out.println(cate);
                listPro = proDao.getProductByCid(Integer.parseInt(cate), 1);
            }

            System.out.println(search);

            if (search != null) {
                listPro = proDao.getProductBySearch(search);
            }

            // REQUEST
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("listPro", listPro);
            request.setAttribute("listCa", listCa);
            request.getRequestDispatcher("shop.jsp").forward(request, response);

        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO proDao = new ProductDAO();
        try {
            String cate = request.getParameter("cate");
            // INDEX PAGE AND TOTAL
            int indexPage = Integer.parseInt(
                    request.getParameter("index") == null ? "1" : request.getParameter("index")
            );
            int maxPage
                    = proDao.totalProduct() % 8 == 0 ? (proDao.totalProduct() / 8) : (proDao.totalProduct() / 8 + 1);

            // LIST 
            List<Product> listPro = proDao.getListPageByIndex(indexPage);
            List<Category> listCa = proDao.getAllCate();

            if (cate != null) {
                System.out.println(cate);
                listPro = proDao.getProductByCid(Integer.parseInt(cate), 1);
            }

            // REQUEST
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("listPro", listPro);
            request.setAttribute("listCa", listCa);
            request.getRequestDispatcher("shop.jsp").forward(request, response);

        } catch (Exception e) {
        }
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import DAO.AccountDAO;
import enity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "EditAccount", urlPatterns = {"/editAccount"})
public class EditAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO accD = new AccountDAO();

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Account acc = accD.getAccountByUserID(id);

            request.setAttribute("acc", acc);
            request.getRequestDispatcher("editAccount.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO accD = new AccountDAO();

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String location = request.getParameter("location");
        String role = request.getParameter("role");

        System.out.println(role);

        accD.updateAccount(
                Integer.parseInt(id),
                fullname,
                email,
                phone,
                location
        );

        response.sendRedirect("manageAccount");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

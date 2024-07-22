/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.log;

import DAO.AccountDAO;
import enity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        Cookie arr[] = request.getCookies();

        for (Cookie cookie : arr) {
            if (cookie.getName().equals("userC")) {
                request.setAttribute("userC", cookie.getValue());
            }
            if (cookie.getName().equals("passC")) {
                request.setAttribute("passC", cookie.getValue());
            }
        }

        request.getRequestDispatcher("log/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        String remeber = request.getParameter("remember");

        AccountDAO adao = new AccountDAO();

        Account account = adao.getAccountByUserAndPass(user, password);

        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("acc", account);
            Cookie u = new Cookie("userC", user);
            Cookie p = new Cookie("passC", password);

            u.setMaxAge(60 * 60 * 24 * 7);

            if (remeber != null) {
                p.setMaxAge(60 * 60 * 24 * 7);
            } else {
                p.setMaxAge(0);
            }

            response.addCookie(u);
            response.addCookie(p);
            if (account.getRoleID() == 0) {

                response.sendRedirect("homePage");
            }else{
                response.sendRedirect("manageProduct");
                
            }

        } else {
            String errLogin = "User or Password INCORRECT";
            request.setAttribute("errLogin", errLogin);
            request.getRequestDispatcher("log/login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

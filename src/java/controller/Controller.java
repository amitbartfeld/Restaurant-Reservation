/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SearchRestaurantLogic;
import model.auth.RestaurantDetails;
import model.auth.UserDetails;

/**
 *
 * @author admin
 */
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().setAttribute("user", new UserDetails("abcd", "abc@gmail.com", "0549999999"));
        String action = request.getParameter("action");
        switch(action) {
            case "login":
                
                break;
            case "signup":
                request.setAttribute("isClient", true);
                request.setAttribute("pageName", "reservations");
                request.setAttribute("user", new UserDetails("abcd", "abc@gmail.com", "0549999999"));
                transferToPage("view/ViewReservations.jsp", request, response);
                break;
            case "restaurantsignup":
                
                break;
            case "search":
                String search = request.getParameter("search");
                if (search == null)
                    search = "";
                request.setAttribute("isClient", true);
                request.setAttribute("pageName", "home");
                request.setAttribute("restaurants",SearchRestaurantLogic.search(search));
                transferToPage("view/SearchRestaurantsPage.jsp", request, response);
                break;
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    private void transferToPage(String pageUrl, HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher dispatcher = request.getRequestDispatcher(pageUrl);
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

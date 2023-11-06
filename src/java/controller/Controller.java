/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Constants;
import model.DatabaseOperationsSingleton;
import model.SearchRestaurantLogic;
import model.UserDetailsChanger;
import model.auth.AuthenticationLogic;
import model.auth.DatabaseClientCreator;
import model.auth.DatabaseRestaurantCreator;
import model.auth.RegisteredClient;
import model.auth.RegisteredRestaurant;
import model.auth.UserDetails;

/**
 *
 * @author admin
 */
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch(action) {
            case "login":
                request.setAttribute("message", "");
                String username = request.getParameter("username");
                if (username == null)
                    transferToPage("view/Login.jsp", request, response);
                else {
            try {
                String password = request.getParameter("password");
                if (DatabaseOperationsSingleton.getInstance(Constants.clientTable).getSpecificRowByUniqueColumn(Constants.clientUserNameField, username) != null) {
                    if (AuthenticationLogic.login(username, password, false, request.getSession())) {
                        request.setAttribute("pageName", "reservations");
                        transferToPage("view/ViewReservations.jsp", request, response);
                    } else {
                        request.setAttribute("message", "Wrong password");
                        transferToPage("view/Login.jsp", request, response);
                    }
                } else if (DatabaseOperationsSingleton.getInstance(Constants.restaurantTable).getSpecificRowByUniqueColumn(Constants.restaurantUserNameField, username) != null) {
                    if (AuthenticationLogic.login(username, password, true, request.getSession())) {
                        request.setAttribute("pageName", "home");
                        request.setAttribute("restaurants",SearchRestaurantLogic.search(""));
                        transferToPage("view/SearchRestaurantsPage.jsp", request, response);
                    } else {
                        request.setAttribute("message", "Wrong password");
                        transferToPage("view/Login.jsp", request, response);
                    }
                } else {
                    request.setAttribute("message", "This user does not exist");
                    transferToPage("view/Login.jsp", request, response);
                }
                
                transferToPage("view/HomePage.jsp", request, response);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
                }
                break;
            case "signup":
                request.setAttribute("message", "");
                username = request.getParameter("username");
                if (username == null)
                    transferToPage("view/Signup.jsp", request, response);
                else {
                    String password = request.getParameter("password");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    if (AuthenticationLogic.registerClient(username, email, phone, password, request.getSession())) {
                        request.setAttribute("pageName", "reservations");
                        transferToPage("view/ViewReservations.jsp", request, response);
                    } else {
                        request.setAttribute("message", "User already exists");
                        transferToPage("view/Signup.jsp", request, response);
                    }
                }
            break;
            case "restaurantsignup":
                request.setAttribute("message", "");
                username = request.getParameter("username");
                if (username == null)
                    transferToPage("view/RestaurantSignup.jsp", request, response);
                else {
                    String password = request.getParameter("password");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    if (AuthenticationLogic.registerClient(username, email, phone, password, request.getSession())) {
                        request.setAttribute("pageName", "home");
                        request.setAttribute("restaurants",SearchRestaurantLogic.search(""));
                        transferToPage("view/SearchRestaurantsPage.jsp", request, response);
                    } else {
                        request.setAttribute("message", "User already exists");
                        transferToPage("view/RestaurantSignup.jsp", request, response);
                    }
                }
                break;
            case "restaurant":
                request.setAttribute("pageName", "home");
                transferToPage("view/RestaurantPage.jsp", request, response);
                break;
            case "search":
                String search = request.getParameter("search");
                if (search == null)
                    search = "";
                request.setAttribute("pageName", "home");
                request.setAttribute("restaurants",SearchRestaurantLogic.search(search));
                transferToPage("view/SearchRestaurantsPage.jsp", request, response);
                break;
            case "book":
                String restaurantUserName = request.getSession().getAttribute("restaurantUserName").toString();
                String restaurantDate = request.getParameter("date");
                String restaurantTime = request.getParameter("time");
                int numOfPeople = Integer.parseInt(request.getParameter("numOfPeople"));
                Calendar c = Calendar.getInstance();
                String[] dateParts = restaurantDate.split("-");
                int hours = Integer.parseInt(restaurantTime.split(":")[0]);
                c.set(Calendar.YEAR, Integer.parseInt(dateParts[0]));
                c.set(Calendar.MONTH, Integer.parseInt(dateParts[1])-1);
                c.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateParts[2]));
                c.set(Calendar.HOUR_OF_DAY, hours);
                c.set(Calendar.MINUTE, 0);
                c.set(Calendar.SECOND, 0);
                long time = c.getTimeInMillis();
                DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
                try {
                    databaseOperations.insertDataToSql(new Object[]{time, restaurantUserName, numOfPeople, true});
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("pageName", "reservations");
                transferToPage("view/ViewReservations.jsp", request, response);
                break;
            case "password":
            case "updatePassword":
                String newPassword = request.getParameter("newPassword");
                if (newPassword != null) {
                    boolean isClient = (boolean)request.getSession().getAttribute("isClient");
                    UserDetails user = (UserDetails)request.getSession().getAttribute("user");
                    new UserDetailsChanger(!isClient).changePassword(user.username, newPassword, request.getSession());
                }
                request.setAttribute("pageName", "edit");
                request.setAttribute("subPage", "password");
                transferToPage("view/UserDetailsPage.jsp", request, response);
                break;
            case "phone":
            case "updatePhone":
                String newPhone = request.getParameter("newPhone");
                if (newPhone != null) {
                    boolean isClient = (boolean)request.getSession().getAttribute("isClient");
                    UserDetails user = (UserDetails)request.getSession().getAttribute("user");
                    new UserDetailsChanger(!isClient).changePhone(user.username, newPhone, request.getSession());
                }
                request.setAttribute("pageName", "edit");
                request.setAttribute("subPage", "phone");
                transferToPage("view/UserDetailsPage.jsp", request, response);
                break;
            case "email":
            case "updateEmail":
                String newEmail = request.getParameter("newEmail");
                if (newEmail != null) {
                    boolean isClient = (boolean)request.getSession().getAttribute("isClient");
                    UserDetails user = (UserDetails)request.getSession().getAttribute("user");
                    new UserDetailsChanger(!isClient).changePhone(user.username, newEmail, request.getSession());
                }
                request.setAttribute("pageName", "edit");
                request.setAttribute("subPage", "email");
                transferToPage("view/UserDetailsPage.jsp", request, response);
                break;
            case "delete":
                request.setAttribute("pageName", "edit");
                request.setAttribute("subPage", "delete");
                transferToPage("view/UserDetailsPage.jsp", request, response);
            case "deleteAccount":
                boolean isClient = (boolean)request.getSession().getAttribute("isClient");
                UserDetails user = (UserDetails)request.getSession().getAttribute("user");
                new UserDetailsChanger(!isClient).deleteUser(user.username, request.getSession());
                transferToPage("view/HomePage.jsp", request, response);
                break;
            case "logout":
                request.getSession().invalidate();
                transferToPage("view/HomePage.jsp", request, response);
            case "reservations":
                request.setAttribute("pageName", "reservations");
                transferToPage("view/ViewReservations.jsp", request, response);
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

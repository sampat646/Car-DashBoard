package com.jsp.servlet.carDash;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/display-car")
public class DisplayCar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "root");
            PreparedStatement pst = conn.prepareStatement("select * from car");

            ResultSet rs = pst.executeQuery();
            req.setAttribute("carList", rs);// Object in key value pair
            req.getRequestDispatcher("displayAllCars.jsp").forward(req, resp);// All the data which is got will pass to
                                                                              // the mentioned jsp file

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }
}

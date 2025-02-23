package com.jsp.servlet.carDash;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/save-update-data")
public class SaveUpdatedCar extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String model = req.getParameter("model");
        String brand = req.getParameter("brand");
        String color = req.getParameter("color");
        int price = Integer.parseInt(req.getParameter("price"));

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "root");

            PreparedStatement pst = conn.prepareStatement(
                    "UPDATE car SET carModel=?, carbrand=?, carcolor=?, carprice=? WHERE carId=?");
            pst.setString(1, model);
            pst.setString(2, brand);
            pst.setString(3, color);
            pst.setInt(4, price);
            pst.setInt(5, id);

            pst.executeUpdate();
            resp.sendRedirect("display-car");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.getWriter().write("Database Error: " + e.getMessage());
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

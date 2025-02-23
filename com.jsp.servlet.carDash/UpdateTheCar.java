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

@WebServlet("/find-by-id")
public class UpdateTheCar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("carId"));
        // String model = req.getParameter("model");
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_cardb", "root", "root");

            PreparedStatement pst = conn.prepareStatement("select * from car where carId=?");
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            req.setAttribute("carList", rs);
            // while (rs.next()) {
            // req.setAttribute("id", rs.getInt(1));
            // req.setAttribute("model", rs.getString(2));
            // req.setAttribute("brand", rs.getString(3));
            // req.setAttribute("color", rs.getString(4));
            // req.setAttribute("price", rs.getInt(5));
            //
            // }
            req.getRequestDispatcher("UpdateTheCarData.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

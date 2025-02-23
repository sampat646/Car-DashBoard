package com.jsp.servlet.carDash;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Add-car")
public class AddCarServlet extends HttpServlet {
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
			PreparedStatement pst = conn.prepareStatement("insert into car values(?,?,?,?,?)");
			pst.setInt(1, id);
			pst.setString(2, model);
			pst.setString(3, brand);
			pst.setString(4, color);
			pst.setInt(5, price);

			pst.execute();
			resp.sendRedirect("index.html");//return back to index.html
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

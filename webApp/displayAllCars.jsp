<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Inventory</title>
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
            --background: #f8fafc;
            --card-bg: #ffffff;
            --text: #1e293b;
            --border: #e2e8f0;
            --success: #059669;
            --danger: #dc2626;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        body {
            background-color: var(--background);
            color: var(--text);
            line-height: 1.6;
            padding: 2rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            margin-bottom: 2rem;
            text-align: center;
        }

        .header h1 {
            color: var(--text);
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .table-container {
            background: var(--card-bg);
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            font-weight: 500;
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid var(--border);
        }

        tr:hover {
            background-color: rgba(37, 99, 235, 0.05);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            text-decoration: none;
            color: white;
            font-size: 0.875rem;
            transition: opacity 0.3s ease;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-update {
            background-color: var(--success);
        }

        .btn-delete {
            background-color: var(--danger);
        }

        .home-link {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 0.5rem;
            transition: background-color 0.3s ease;
            margin-top: 1rem;
        }

        .home-link:hover {
            background-color: var(--primary-dark);
        }

        @media (max-width: 768px) {
            .table-container {
                overflow-x: auto;
            }

            table {
                min-width: 700px;
            }

            body {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Car Inventory</h1>
        </div>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Car ID</th>
                        <th>Model</th>
                        <th>Brand</th>
                        <th>Color</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    ResultSet rs2 = (ResultSet) request.getAttribute("carList");
                    while (rs2.next()) { 
                    %>
                    <tr>
                        <td><%=rs2.getInt(1)%></td>
                        <td><%=rs2.getString(2)%></td>
                        <td><%=rs2.getString(3)%></td>
                        <td><%=rs2.getString(4)%></td>
                        <td>$<%=String.format("%,d", rs2.getInt(5))%></td>
                        <td>
                            <div class="action-buttons">
                                <a href="find-by-id?carId=<%=rs2.getInt(1)%>" class="btn btn-update">Update</a>
                                <a href="find-by-id-delete?carId=<%=rs2.getInt(1)%>" class="btn btn-delete">Delete</a>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <a href="index.html" class="home-link">Back to Home</a>
    </div>
</body>
</html>
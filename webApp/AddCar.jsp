<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Car</title>
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
            --background: #f8fafc;
            --card-bg: #ffffff;
            --text: #1e293b;
            --border: #e2e8f0;
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .form-container {
            background: var(--card-bg);
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-header h1 {
            color: var(--text);
            font-size: 1.5rem;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border);
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .submit-btn {
            width: 100%;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: var(--primary-dark);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 1rem;
            color: var(--primary);
            text-decoration: none;
            font-size: 0.875rem;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 640px) {
            .form-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h1>Add New Car</h1>
        </div>
        <form action="Add-car" method="post">
            <div class="form-group">
                <input type="number" 
                       class="form-control" 
                       placeholder="Enter the car id" 
                       name="id" 
                       required>
            </div>
            <div class="form-group">
                <input type="text" 
                       class="form-control" 
                       placeholder="Enter the car Model" 
                       name="model" 
                       required>
            </div>
            <div class="form-group">
                <input type="text" 
                       class="form-control" 
                       placeholder="Enter the car brand" 
                       name="brand" 
                       required>
            </div>
            <div class="form-group">
                <input type="text" 
                       class="form-control" 
                       placeholder="Enter the car color" 
                       name="color" 
                       required>
            </div>
            <div class="form-group">
                <input type="number" 
                       class="form-control" 
                       placeholder="Enter the car price" 
                       name="price" 
                       required>
            </div>
            <button type="submit" class="submit-btn">Add Car</button>
        </form>
        <a href="index.html" class="back-link">Back to Home</a>
    </div>
</body>
</html>
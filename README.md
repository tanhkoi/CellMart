# 📱 CellMart - Your Destination for Smartphone Shopping

Welcome to CellMart, your premier destination for all things smartphone-related. This repository houses the final project for the Web Development course at the University, implemented using the MVC pattern in .NET Core with SQL Server for the database.


# Project Overview:

CellMart is a web-based platform designed to streamline the process of purchasing smartphones online. Leveraging the power of MVC architecture and SQL Server, this project delivers a seamless user experience by organizing the application into three interconnected components: Models, Views, and Controllers.

# Key Features:

- User Authentication: Secure user authentication ensures a personalized shopping experience, with features like login, registration, and password recovery.
- Product Catalog: Browse through an extensive catalog of the latest smartphones, each meticulously categorized and detailed to aid in decision-making.
- Shopping Cart: Seamlessly add desired smartphones to your cart, review your selections, and proceed to checkout with ease.
- Order Management: Track the status of your orders, view past purchases, and manage your account information effortlessly.
- Admin Panel: Admins have access to a dedicated panel for managing products, users, and orders, facilitating efficient administration of the platform.

# Installation:

- Clone the Repository: `git clone https://github.com/your-username/CellMart.git`
- Navigate to the Project Directory: `cd CellMart`
- Install Dependencies: `dotnet restore`
- Database Setup:
  - Ensure you have SQL Server installed and running.
  - Update the connection string in **appsettings.json** with your SQL Server details.
  - Run Entity Framework Core migrations to create the database schema: `dotnet ef database update`
- Run the Application: `dotnet run`

# Usage:

- Access the Website: Open your web browser and navigate to http://localhost:port.
- User Authentication: Register for a new account or log in using existing credentials.
- Browse Products: Explore the product catalog, filter by category, and view detailed product information.
- Add to Cart: Select desired smartphones and add them to your shopping cart for purchase.
- Checkout: Review your cart, provide shipping details, and complete the purchase securely.
- Admin Panel: Access the admin panel by navigating to http://localhost:port/admin (admin credentials required).

# Contributing:

Contributors: [Tấn Khôi](https://github.com/tanhkoi) [Thăng Tiến](https://github.com/NTTien203) [Việt Trung](https://github.com/viettrung2512) [Huỳnh Đức](https://github.com/huynhduc2412)

# Contact:

For any inquiries or assistance, feel free to contact us at _tankhoi46@gmail.com_.

Thank you for choosing CellMart! Happy shopping!

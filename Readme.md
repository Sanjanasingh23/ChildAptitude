# KidGenius Website

KidGenius is a web-based platform designed to assess and enhance children's aptitude through interactive tests and a chatbot assistant. This repository contains the source code, configuration files, and database structure required to run the application.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Folder Structure](#folder-structure)
4. [Installation](#installation)
5. [Usage](#usage)
6. [API Endpoints](#api-endpoints)
7. [Database Structure](#database-structure)
8. [Contributing](#contributing)
9. [License](#license)

---

## Project Overview

KidGenius is a child-friendly platform that provides:
- Aptitude tests to evaluate children's skills.
- A chatbot assistant for interactive learning and support.
- A responsive design for seamless use across devices.

---

## Features

- **Interactive Tests**: Dynamic test questions with real-time feedback.
- **Chatbot Assistant**: AI-powered chatbot for guidance and support.
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices.
- **Secure Authentication**: User login and registration with secure API endpoints.

---

## Folder Structure

```plaintext
/kidgenius-website/
├── index.php              (Main entry point)
├── config/
│   └── db_config.php      (Database connection config)
├── css/
│   ├── styles.css         (Main stylesheet)
│   └── responsive.css     (Responsive design styles)
├── js/
│   ├── main.js            (Main JavaScript)
│   ├── test.js            (Test functionality)
│   └── chatbot.js         (Chatbot functionality)
├── includes/
│   ├── header.php         (Common header)
│   ├── footer.php         (Common footer)
│   └── chatbot.php        (Chatbot HTML)
├── api/
│   ├── auth.php           (Login/register API)
│   ├── test_data.php      (Get test questions)
│   ├── submit_test.php    (Process test submissions)
│   └── chat_response.php  (Chatbot backend)
└── sql/
    └── database.sql       (Database structure)

---

## Installation

To set up the KidGenius platform on your local machine, follow these steps:

1. **Clone the Repository**:
   Clone the repository to your local machine using the following command:
   ```bash
   git clone https://github.com/your-username/kidgenius-website.git

2. **Set Up a Local Server**:
    Install and configure a local server environment such as XAMPP or WAMP.

3. **Move the Project**:
    Place the cloned project folder in the server's root directory. For example:
    For XAMPP: c:/xampp/htdocs/kidgenius-website/
    For WAMP: c:/wamp/www/kidgenius-website/

4. **Import the Database**:
    Open phpMyAdmin in your browser (e.g., http://localhost/phpmyadmin).
    Create a new database (e.g., kidgenius).
    Import the sql/database.sql file located in the project folder.

5. **Configure the Database Connection**:
    Open the config/db_config.php file.
    Update the database credentials (e.g., host, username, password, and database name) to match your local setup.

6. **Start the Server**:
    Start the local server environment (e.g., XAMPP or WAMP).
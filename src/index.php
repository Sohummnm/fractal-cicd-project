<html>
<head>
<title>Restaurant Registration App - From Live </title>

<style>
    body {
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(to bottom right, #dce9ff, #ffffff);
        margin: 0;
        padding: 0;
    }

    .wrapper {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 60px;
    }

    .card {
        background: #ffffff;
        padding: 40px 50px;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        text-align: center;
        width: 400px;
        animation: fadeIn 0.5s ease-in-out;
        border-top: 10px solid #1e6fff; /* BLUE indicator */
    }

    .tag-blue {
        background: #1e6fff;
        color: white;
        padding: 6px 14px;
        border-radius: 50px;
        display: inline-block;
        font-size: 14px;
        margin-bottom: 15px;
        font-weight: bold;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
        font-size: 26px;
        letter-spacing: 0.5px;
    }

    input[type=text] {
        width: 100%;
        padding: 14px;
        margin: 12px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 15px;
        transition: 0.3s;
    }

    input[type=text]:focus {
        border-color: #1e6fff;
        box-shadow: 0 0 6px rgba(30, 111, 255, 0.3);
        outline: none;
    }

    button {
        background-color: #1e6fff;
        color: white;
        padding: 14px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        transition: 0.3s;
    }

    button:hover {
        background-color: #1554c7;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(30, 111, 255, 0.3);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>

<?php
if($_SERVER['REQUEST_METHOD'] == "POST")
{
    // Read DB config from ENV
    $servername = getenv('DB_HOST');
    $username   = getenv('DB_USER');
    $password   = getenv('DB_PASSWORD');
    $dbname     = getenv('DB_NAME');

    $name  = $_POST["name"];
    $phone = $_POST["mobile"];

    // Plain MySQL connection (NO SSL)
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("<p style='color:red;text-align:center;font-size:18px;'>DB Connection Failed: " . $conn->connect_error . "</p>");
    }

    $stmt = $conn->prepare("INSERT INTO employee (name, mobile) VALUES (?, ?)");
    $stmt->bind_param("ss", $name, $phone);

    if ($stmt->execute()) {
        echo "<p style='color: green; font-size: 18px; text-align:center;'>Record added successfully (BLUE)!</p>";
    } else {
        echo "<p style='color: red; font-size: 18px; text-align:center;'>Error: " . $stmt->error . "</p>";
    }

    $stmt->close();
    $conn->close();
}
?>
</head>

<body>

<div class="wrapper">
    <div class="card">

        <!-- BLUE badge -->
        <div class="tag-blue"> VERSION - 1 DEPLOYMENT LIVE</div>

        <h2>Restaurant Registration</h2>

        <form action="index.php" method="POST">

            <input type="text" placeholder="Restaurant Name" name="name" required>

            <input type="text" placeholder="Mobile Number" name="mobile" required>

            <button type="submit">Add Employee</button>
        </form>
    </div>
</div>

</body>
</html>

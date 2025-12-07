<html>
<head>

<title>Restaurant Regisration App</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 25%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 25%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: left;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 100px;
  border-radius: 200px;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>

<?php
if($_SERVER['REQUEST_METHOD'] == "POST")
{
    $servername = getenv('DB_HOST');
    $username   = getenv('DB_USER');
    $password   = getenv('DB_PASSWORD');
    $dbname     = getenv('DB_NAME');

    $name  = $_POST["name"];
    $phone = $_POST["mobile"];

    // Initialize MySQLi with SSL
    $conn = mysqli_init();

    // Path to CA certificate bundle (default on App Service)
    $ssl_cert = '/etc/ssl/certs/ca-certificates.crt';

    mysqli_ssl_set($conn, NULL, NULL, $ssl_cert, NULL, NULL);
    mysqli_options($conn, MYSQLI_OPT_SSL_VERIFY_SERVER_CERT, true);

    // Connect securely with SSL
    if (!mysqli_real_connect(
        $conn,
        $servername,
        $username,
        $password,
        $dbname,
        3306,
        NULL,
        MYSQLI_CLIENT_SSL
    )) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Use prepared statement (safer)
    $stmt = $conn->prepare("INSERT INTO employee (name, mobile) VALUES (?, ?)");
    $stmt->bind_param("ss", $name, $phone);

    if ($stmt->execute()) {
        echo "Record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
</head>

<body>
<h2> Restaurant Registration Form (Version-1) </h1>
<form action="index.php" method="POST">
        <div class="imgcontainer">
    <img src="image.png" alt="Avatar" class="avatar">
  </div>

<div class="container">
    <label for="name"><b>Restaurant Name </b></label>
    <input type="text" placeholder="Enter Username" name="name" required>
     <br />
    <label for="mobile"><b>Mobile Number</b></label>
    <input type="text" placeholder="Enter mobile" name="mobile" required>
     <br />
    <button type="submit">Add Employee</button>
  </div>

</form>
</body>
</html>
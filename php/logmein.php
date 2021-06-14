<?php
header('Content-Type: text/html; charset=UTF-8');

session_start();

if ((!isset($_POST['input_login']) || (!isset($_POST['input_pass']))))
{
    header('Location: index.php');
    exit();
}

require_once "db.php";

$conn = @new mysqli($host, $db_user, $db_password, $db_name);
    if ($conn->connect_errno!=0)
    {
        echo "SQL Error: ". $conn->connect_errno;
    }
    else
    {

        $login = $_POST['input_login'];
        $pass = $_POST['input_pass'];

        $login = htmlentities($login, ENT_QUOTES, "UTF-8");
        $pass = htmlentities($pass, ENT_QUOTES, "UTF-8");

        $sql = "SELECT * FROM users WHERE Login='$login' AND Password='$pass'";

        if ($result = @$conn->query(
            sprintf("SELECT * FROM users WHERE Login='%s' AND Password='%s'",
            mysqli_real_escape_string($conn,$login),
            mysqli_real_escape_string($conn,$pass))))
        {
            $users_no = $result->num_rows;
            if($users_no>0)
            {
                $_SESSION['logged_in'] = true;
                $row = $result->fetch_assoc();
                $_SESSION['user'] = $row['Login'];

                unset($_SESSION['err']);
                $result->free_result();
                header('Location: loggedin.php');
            } else {
                $_SESSION['err'] = '<h3 style="color:hotpink">Invalid Login or password ! </h3> <h6> Try again. </h6>  ';
                header('Location: index.php');
            }

        }

        $conn->close();
    }
?>
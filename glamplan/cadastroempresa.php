<?php
// Dados de conexão
$hostname = "localhost";
$username = "root";
$password = "";
$database = "glamplan";

// Conectar ao banco de dados
try {
    $conn = new mysqli($hostname, $username, $password, $database);
} catch (Exception $e) {
    die("Erro ao conectar:" . $e->getMessage());
}

// Verificar se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Recebendo variáveis do formulário
    $name = $_POST['name'];
    $email = $_POST['email'];
    $cnpj = $_POST['cnpj'];
    $number = $_POST['number'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];

    if (empty($name) || empty($email) || empty($cnpj) || empty($number) || empty($password) || empty($confirmPassword) || $password != $confirmPassword) {
        echo '<div class="alert alert-warning" role="alert">
                Dados não podem ficar vazios e as senhas devem coincidir!
              </div>';
    } else {
        // Criar o comando SQL
        $sql = "INSERT INTO empresa (name, cnpj, email, numero, senha) VALUES ('$name', '$cnpj', '$email', '$number', '$password')";

        // Executar o comando
        $resultado = $conn->query($sql);

        if ($resultado) {
            header("Location: login.php");
        } else {
            echo '<div class="alert alert-danger" role="alert">
                    Erro ao inserir o dado!
                  </div>';
        }
    }
}
?>

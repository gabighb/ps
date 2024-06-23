<?php
    //dados de conexao
    $hostname = "localhost";
    $username = "root";
    $password = "";
    $database = "glamplan";

    //Conectar ao banco de dados
    try {
        $conn = new mysqli($hostname, $username, $password, $database);
    } catch (Exception $e) {
        die("Erro ao conectar:" . $e->getMessage());
    }

    //recebendo variaveis do formulario
    $name = $_POST['firstname'];
    $email = $_POST['email'];
    $sex = ' ';
    $number = $_POST['number'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];
    $username = $_POST['username'];

    $checkedfem = (isset($_POST['female']))?true:false;
    $checkedmale = (isset($_POST['male']))?true:false;
    $checkedother = (isset($_POST['others']))?true:false;
    $checkednone = (isset($_POST['none']))?true:false;

    $sex = ($checkedfem) ? "Feminino" : (($checkedmale) ? "Masculino" : (($checkedother) ? "Outros" : "Prefiro não dizer") );

        if ($checkedfem == true && $checkedmale = true || $checkedfem == true && $checkedother = true || $checkedmale == true && $checkedothers = true || $checkedmale == true && $checkednone = true || $checkedfem == true && $checkednone = true || $checkednone == true && $checkedother = true || empty($name) || empty($email) || empty($sex) || empty($number) || empty($password) || empty($confirmPassword) || empty($username) || $password = $confirmPassword) :
            ?>
                <div class="alert alert-warning" role="alert">
                    Dados nao podem ficar vazios e apenas um sexo pode ser selecionado!
                </div>
            <?php
            else :
                //Criar o comando
                $sql = "INSERT INTO cliente VALUES(NULL, '$name', '$username', '$sex', '$email', '$number', '$password')";

                //executar o comando
                $resultado = $conn->query($sql);

                ?>
                <?php if ($resultado) : ?>
                    <?php
                        header("login.php");
                        ?>
                    <?php else : ?>
                        <div class="alert alert-danger" role="alert">
                            Erro ao inserir o dado!
                        </div>
        <?php endif; ?>
        
    <?php endif; ?>
<?php 
/*require_once("conexao.php");
$sql = $conn->query("SELECT nome, senha FROM login where nome=? and senha=?");
$conn->beginTransaction();
$resultado = $conn->prepare($sql);
$resultado->bindParam(1, $_POST['nome']);
$resultado->bindParam(2, $_POST['senha']);
$resultado->execute();
$con->commit();
if($resultado->fetch(PDO::FETCH_ASSOC) == true):
echo"existe login";

else:
$conn->rollBack();
echo"não existe login";
endif; */
?>
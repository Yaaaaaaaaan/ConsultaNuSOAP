<?php 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Parâmetros de conexão com o banco de dados MySQL
require_once('db_config.php');

require_once('lib/nusoap.php');

function Consulta($codigo) {
    try {
        // Conexão com o banco de dados
		$dbh = new \PDO(
			"mysql:host=localhost;dbname=dadosConsulta;charset=utf8",
			"root",
			""
		);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Consulta SQL para obter os detalhes da consulta
        $consulta_sql = "SELECT 
                            consulta.cod AS consulta_cod,
                            consulta.nome,
                            consulta.descricao,
                            consulta.endereco,
                            consulta.usuario
                        FROM 
                            consulta
                        WHERE 
                            consulta.cod = :codigo";

        $stmt_consulta = $dbh->prepare($consulta_sql);
        $stmt_consulta->bindParam(':codigo', $codigo);
        $stmt_consulta->execute();
        $consulta_result = $stmt_consulta->fetch(PDO::FETCH_ASSOC);

        if ($consulta_result) {
            // Consulta SQL para obter as contas relacionadas à consulta
            $contas_sql = "SELECT 
                                contas.cod AS conta_cod,
                                contas.data,
                                contas.multa,
                                contas.debito
                            FROM 
                                contas
                            WHERE 
                                contas.codigoConsulta = :codigo";

            $stmt_contas = $dbh->prepare($contas_sql);
            $stmt_contas->bindParam(':codigo', $codigo);
            $stmt_contas->execute();
            $contas_result = $stmt_contas->fetchAll(PDO::FETCH_ASSOC);

            $response['mensagem_retorno'] = "Sucesso";
            $response['codigo'] = $consulta_result['consulta_cod'];
            $response['nome'] = $consulta_result['nome'];
            $response['descricao'] = $consulta_result['descricao'];
            $response['endereco'] = $consulta_result['endereco'];
            $response['usuario'] = $consulta_result['usuario'];
            
            // Adiciona as contas ao resultado
            $response['contas'] = $contas_result;
        } else {
            $response['mensagem_retorno'] = "Erro: Consulta não encontrada";
        }
    } catch (PDOException $e) {
        $response['mensagem_retorno'] = "Erro: " . $e->getMessage();
    }

    return $response;
}

// Criação do NuSOAP server
$server = new soap_server();
$server->configureWSDL('example', 'urn:example');

// Registro do método Consulta
$server->register(
    'Consulta',
    array('codigo' => 'xsd:string'),
    array(
        'mensagem_retorno' => "xsd:string",
        'codigo' => "xsd:string",
        'nome' => "xsd:string",
        'descricao' => "xsd:string",
        'endereco' => "xsd:string",
        'usuario' => "xsd:string",
        'contas' => "xsd:Array"
    )
);

// Use the request to (try to) invoke the service
$HTTP_RAW_POST_DATA = file_get_contents('php://input');
$server->service($HTTP_RAW_POST_DATA);
?>

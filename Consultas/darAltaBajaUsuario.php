<?php

include_once '../plantilla/cabecera.php';
include_once '../plantilla/menu.php';
include_once '../plantilla/menu_lateral.php';
include_once '../Conexion/conexion.php';

?>

<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Responsive & Accessible Data Table</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
   <!-- Estilo de la tabla-->
  <link href="../dist/css/styleTabla.css" rel="stylesheet">

</head>

<body>
    <div class="page-wrapper" style="height: 671px;">
         <div class="col-md-12 col-md-pull-12" align="right">
                                    <a href='#'  data-toggle="modal" data-target='#myModal'><button type='button' class='btn btn-info btn-circle btn-lg'><i class="fa fa-question fa-2"></i></button></a>
                    </div>
        <br>
            <div class="row" align="center">
                <div class="col-md-12">
                    <div class="wrap">
                <script src="../html/js/jquery.min.js" ></script>
                <script src="../html/js/buscaresc.js"></script>
                <div class="search">
                    <input type="text" name="buscar" id="filtrar" class="searchTerm" placeholder="Que está buscando?">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
                </div>
            </div>
  <div class="container-fluid">

   
                    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Ayuda | Dar alta/baja usuario.</h4> 
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        
      </div>
      <div class="modal-body">
        <div style="text-align: center;">
<iframe src="https://issuu.com/abitho/docs/dar_alta_baja_usuario/1?ff" 
style="width:700px; height:500px;" frameborder="0"></iframe>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      <!--  <button type="button" class="btn btn-primary">Save changes</button>  --> 
      </div>
    </div>
  </div>
</div>

<br/>
    <div class="card" >
      <h3 class="card-title">Dar alta/baja | Datos de Usuarios</h3>
      <div class="col-md-12">

          <div id="bodywrap">


  <div class="scroll-window-wrapper">
  <div class="scroll-window">
  <table class="table table-striped table-hover user-list fixed-header" align="center">
    <thead>
  
      <th><div>Nombre</div></th>
 
      <th><div>Correo</div></th>
      <th><div>Usuario</div></th>
 
      <th><div>Tipo de Usuario</div></th>
     
      <th><div>Acción</div></th>
   
      
    </thead>
    <tbody  class="buscar"> <!--Se manda a llamar la clase del jquey para que haga la búsqueda automaticamente-->
    <!-- Donde va el contenido de la tabla-->
      <?php
        $sacar = mysqli_query($conexion, "SELECT
usuarios.usuario,
usuarios.nombre,
usuarios.correo,
tipo_usuario.tipo,
usuarios.id,
usuarios.estado
FROM
usuarios
INNER JOIN tipo_usuario ON usuarios.id_tipo = tipo_usuario.id");
            while ($fila = mysqli_fetch_array($sacar)) {
                  $modificar=$fila['id']; 
                  
                 $nom=$fila['nombre'];  
                 $correo=$fila['correo'];  
                 $usuario=$fila['usuario'];  
                 
                 $tipo=$fila['tipo'];
                 $fe=$fila['estado']; 
                 
                 if ($fe==0) {
                     $estado="Desactivado";
                 } else {
                     $estado="Activado";
                 }
            
        ?>
        
      <tr>
        <th scope="row"><?php echo $nom;?></th>
      
        <td data-title="Studio"><?php echo $correo;?></td>
        <td data-title="Worldwide Gross" data-type="currency"><?php echo $usuario;?></td>
      
        <td data-title="Worldwide Grosss" data-type="currency"><?php echo $tipo;?></td>
    
        <?php 
        if($fe==0){ ?>
        <td class="text"><a href="../Consultas/ProcesoDarBajaAltaUsuario.php?ir=<?php echo $modificar; ?>"  class="btn btn-success fas fa-arrow-circle-up">Dar Alta</a></td>
        <?php
        }else{
        ?>
        <td class="text"><a href="../Consultas/ProcesoDarBajaAltaUsuario.php?ir=<?php echo $modificar; ?>" class="btn btn-warning fas fa-arrow-circle-down" >Dar Baja</a></td>
      
 <?php  }
            }?>
      
      </tr>

    </tbody>
  </table>
  </div> <!-- Div scroll-window -->
</div> <!-- Div scroll-window-wrapper-->


</div> <!-- Div bodywrap -->

  </div> <!-- Div col-md-12 -->
  </div> <!-- Div card -->
  </div> <!-- Div page-wrapper -->
  </div> <!-- Div page-wrapper -->

</body>

</html>

<?php
    
    include_once '../plantilla/pie.php';

?>

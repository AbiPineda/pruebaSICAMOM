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
                    <input type="text" name="buscar" id="filtrar" class="searchTerm" placeholder="Que está buscando?" autocomplete="off">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
                </div>
            </div>
  <div class="container-fluid">
             <div class="row mb-12">   
        
      <div class="col-lg-2">
            
            <select class="custom-select" name="tipo" onchange="location = this.value">
               <option>Seleccionar Tabla</option>
                <option value="modificarMayoresdeEdad.php">Mayor de edad</option>
                <option value="modificarMenoresdeEdad.php">Menor de Edad</option>
                
            </select>


        </div>

    
    

    </div>
            <!--Fin Búsqueda-->

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Ayuda | Modificar paciente.</h4> 
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        
      </div>
      <div class="modal-body">
        <div style="text-align: center;">
<iframe src="https://issuu.com/abitho/docs/modificar_paciente/1?ff" 
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

    <div class="card" >
      <h3 class="card-title">Modificar Paciente Mayor de Edad | Datos generales</h3>
      <div class="col-md-12">

          <div id="bodywrap">


  <div class="scroll-window-wrapper">
  <div class="scroll-window">
  <table class="table table-striped table-hover user-list fixed-header">
     <thead>
      
     <th><div>Paciente</div></th>
      <th><div>DUI</div></th>
      <th><div>Teléfono</div></th>
      <th><div>Fecha de nacimiento</div></th>
       <th><div>Acción</div></th>
    
      
      
      
    </thead>
    <tbody  class="buscar"> 
    <?php
$d = date("d");
$m = date("m");
$y = date("Y");
$ym=$y-18;

//echo "$d-$m-$ym";
        $sacar = mysqli_query($conexion, "SELECT*FROM t_paciente WHERE (pac_ffecha_nac<='$ym-$m-$d') AND estado=1");
            while ($fila = mysqli_fetch_array($sacar)) {
                  $modificar=$fila['id_paciente'];
                 $ape=$fila['pac_capellidos'];  
                 $nom=$fila['pac_cnombre'];  
                 $dui=$fila['pac_cdui'];  
                 $tel=$fila['pac_ctelefono'];  
                  $fe=$fila['pac_ffecha_nac']; 
                $partes = explode('-', $fe);
                $_fecha = "{$partes[2]}-{$partes[1]}-{$partes[0]}"; 
            
        ?>
      <tr>
        <th scope="row"><?php echo $nom . " " . $ape;?></th>
        <td data-title="Studio"><?php echo $dui;?></td>
        <td data-title="Worldwide Gross" data-type="currency"><?php echo $tel;?></td>
        <td data-title="Domestic Gross" data-type="currency"><?php echo $_fecha;?></td>
         <td class="text"><a href="../Consultas/modificarPaciente.php?ir=<?php echo $modificar; ?>" class="btn btn-success fas fa-edit">Modificar</a>
        </td>

       <?php  }?>
      
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

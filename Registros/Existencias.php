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
    <div class="page-wrapper" style="height: 810px;">
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


            
            <!--Fin Búsqueda-->

           
                    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Ayuda | Inventario de insumos.</h4> 
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        
      </div>
      <div class="modal-body">
        <div style="text-align: center;">
<iframe src="https://issuu.com/abitho/docs/inventario_de_insumos/1?ff" 
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
      <h3 class="card-title">Existencias de insumos</h3>
      <div class="col-md-12">

          <div id="bodywrap">


  <div class="scroll-window-wrapper">
  <div class="scroll-window">
  <table class="table table-striped table-hover user-list fixed-header">
    <thead>
      
      <th><div>Código</div></th>
      <th><div>Insumo</div></th>
      <th><div>Marca</div></th> 
      <th><div>Existencia</div></th>
      
      <th><div>Acción</div></th>
  
      
    </thead>
    <tbody  class="buscar"> 
    <?php
        $sacar1 = mysqli_query($conexion, "SELECT *FROM t_inventario i INNER JOIN t_insumo m ON i.insumo=m.ins_codigo WHERE m.tipo='Contable'");
            while ($fila = mysqli_fetch_array($sacar1)) {
                
                $cod=$fila['codigo'];
                $insumo=$fila['ins_cnombre_comercial']; 
                $marca=$fila['ins_cmarca']; 
                $cantidad=$fila['inv_ecantidad_actual'];
                $presen=$fila['presentacion'];
                $id=$fila['insumo'];
                $unidad=$fila['unidad'];
                $espace=' ';
                $uni='unidades';
                $de='de';
                $descrip=$fila['ins_cdescripcion'];
              
                
        ?> 
        <tr>
                
                <th scope="row"><?php echo $cod; ?></th>
                <th scope="row"><?php echo $insumo; echo $espace; echo $descrip;?></th>
                 <th scope="row"><?php echo $marca; ?></th>
                 <td data-title="Released"><?php echo $cantidad; echo $espace; echo $presen; echo $espace; echo $de; echo $espace; echo $unidad; echo $espace; echo $uni; ?></td>
                
                
                <td class="text"><a href="../Registros/Existencia-Reducion.php?ir=<?php echo $id;?>" class="btn btn-success "> Utilizar</a>

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
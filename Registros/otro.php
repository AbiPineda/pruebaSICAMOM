<?php
include_once '../plantilla/cabecera.php';
include_once '../plantilla/menu.php';
include_once '../plantilla/menu_lateral.php';




    ?>

  <div class="page-wrapper">
                    <!-- ============================================================== -->
                    <!-- Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->

                    <!-- ============================================================== -->
                    <!-- End Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Container fluid  -->
                    <!-- ============================================================== -->
                    <div class="container-fluid" style="height: 671px;">
                        <!-- ============================================================== -->
                        <!-- Start Page Content -->
                        <!-- ============================================================== -->
                        <div class="card" style="background: rgba(0, 101, 191,0.3)">
                            <div class="card-body wizard-content">
                                <h4 class="card-title">Registro Inventario</h4>
                                <form id="FORMULARIO" action="" method="POST" class="m-t-40">
                                    <div>
                                        <h3>Datos generales</h3>
                                        <section>
                                            <div class="row mb-3">

                                                <div class="col-lg-6">
                                                    <label>Nombre Comercial<small class="text-muted"></small></label>
                                                   
                                                        <input type="text" class="form-control" name="nombreCom" id="fnamep" placeholder="Ingrese nombre de la comercial">  
                                                        <div class="input-group-append">
                                                            <span class="input-group-text"><i class="fas fa-building"></i></span>
                                                        </div>
                                                    

                                                </div>

                                                <div class="col-lg-6">
                                                    <label>Marca<small class="text-muted"></small></label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" name="marca" id="fnamep" placeholder="Ingrese la marca">  
                                                        <div class="input-group-append">
                                                            <span class="input-group-text"><i class="far fa-registered"></i></span>
                                                        </div>
                                                    </div> 

                                                </div>

                                                <div class="col-lg-6">
                                                    <label style="padding-top: 8px;">Descripción<small class="text-muted"></small></label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" name="descripcion" id="fnamep" placeholder="Ingrese la descripción">  
                                                        <div class="input-group-append">
                                                            <span class="input-group-text"><i class="fas fa-file-alt"></i></span>
                                                        </div>
                                                    </div> 

                                                </div>

                                                <div class="col-lg-6">
                                                    <label style="padding-top: 8px;">Presentación<small class="text-muted"></small></label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" name="presentacion" id="fnamep" placeholder="Ingrese la presentación"> 
                                                        <div class="input-group-append">
                                                            <span class="input-group-text"><i class="fas fa-chart-area"></i></span>
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="col-lg-6">
                                                    <label style="padding-top: 8px;">Precio<small class="text-muted"></small></label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" name="precio" id="fnamep" placeholder="Ingrese el precio"> 
                                                        <div class="input-group-append">
                                                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                                        </div>
                                                    </div>


                                                </div>


                                                <div class="col-lg-6">
                                                    <label style="padding-top: 8px;">Fecha de caducidad<small class="text-muted"></small></label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control mydatepicker" name="fecha" placeholder="Ingrese fecha de caducidad">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                    </div>

                                                    <button type="submit" class="btn btn-info" name="nameEnviar">Guardar </button>
                                                    <button type="submit" class="btn btn-info" name="name">Prueba </button>
                                               
                                                </div>

                                            </div>


                                        </section>

                                    </div>

                                </form>
                               
                            </div>

                        </div>
                    </div>
                   
                </div>





    <?php
    
    include_once '../plantilla/pie.php';

?>
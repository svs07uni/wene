<?php
use yii\widgets\ListView;
/* @var $this yii\web\View */

$this->title = 'Wene';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Postulate!</h1>
        <p>Pasantías, Bolsa de Trabajo, Actividades, Investigación, Extensión de la Universidad Nacional del Comahue y mucho más!</p>
        <form action="#" method="get" >
            <div class="input-group">
                <input type="text" name="valor" class="form-control" placeholder="Buscador..." value="<?=$valor?>"/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
    </div>    
    <div class="container-fluid">
      <?php 
            echo ListView::widget([
            'dataProvider' => $dataProvider,
            'itemView' => '_list_item',
                'options' => [
                    'tag' => 'div',
                    'class' => 'panel-group',
                ],
            ]); ?>
            </div>
 <!--    
   /*echo GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_convocatoria',
            'titulo',
            'descripcion',
            'direccion',
            'fecha_alta',
            //'fecha_desde',
            //'fecha_hasta',
            //'cant_postulantes',
            //'activo:boolean',
            //'id_tipo',
            //'id_sede_pedido',
            //'id_institucion',
            //'requisitos',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]);*/
    <div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <h2>RAKIDUAMN S.R.L. </h2>

                <p>Busca
Estudiantes avanzados de las carreras Lic. en Ciencias de la Computación / Lic. en Sistemas de Información.

Tareas a realizar:

    Entender la metodología de trabajo del área de sistemas (scrum).
    Realizar documentos de la metodología de trabajo.
    Comenzar a estudiar framework / herramientas de programación.
    Entender nuestro sistema SCADA y base de datos
    Análisis y resolución de problemas

Período de la pasantía: 6 meses. Con posibilidad de incorporación.

Lugar de trabajo: Barda en el medio (30km desde NQN) - 4 horas. Se necesita movilidad.

Fecha límite de inscripción: 10 de Noviembre de 2018.

Los interesados deberán enviar C.V. y Rendimiento Académico (excluyente) a busquedas@fi.uncoma.edu.ar indicando en el asunto "Pasantía Rakiduamn 2018".</p>

                <p><a class="btn btn-success" href="">Aplicar</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Beca: Administración de redes y sistemas (Convenio con Facultad de Ingeniería) </h2>

                <p>Llamado a inscripción de alumnos avanzados de las carreras de Lic. en Ciencias de la Computación y/o Lic. en Sistemas de Información de la Facultad para cubrir 1 Beca-PPU.

 Tareas a realizar:

    Carga y Migración de Datos.
    Administración de redes Windows y Linux.
    Instalación y configuración de software bajo Windows.
    Relevamiento y documentación de red.
    Administración de SAMBA, RAID, VPN.

Requisitos:

    Conocimientos en Windows y Linux.
    Tener cursado, como mínimo, el tercer año completo.

Duración de la Beca: 6 meses.

Lugar: Neuquén (Facultad de Informática, Facultad de Ingeniería)

Fecha límite de inscripción: 29 de octubre de 2018.

Los interesados deberán enviar C.V. y Rendimiento Académico a busquedas@fi.uncoma.edu.ar indicando en el asunto "Becas Redes".</p>

                <p><a class="btn btn-success" href="">Aplicar</a></p>
            </div>
            <div class="col-lg-4 container">
                <h2>YPF S.A. </h2>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Busca
Graduados o próximos a graduarse en Lic. en Ciencias de la Computación.
                    </div>
                    <div class="panel-body">
                        Requisitos:

    SQL Server.
    Desarrollo web, HTML5, JavaScript, Angular.
    Conocimientos de infraestructuras de TI (hardware, software, comunicaciones).
    Sólidos conocimientos de SCADA.
    Tareas a realizar:

    Efectuar el relevamiento en campo, análisis, ingeniería, programación y testing operativo de nuevas soluciones que surjan de necesidades detectadas por el negocio.
    Efectuar la planificación de las tareas del proyecto, análisis de riesgos, monitoreo y avance del proyecto y análisis de desvíos.
    Participar de la estimación de costos, plazos y esfuerzo requerido para un nuevo proyecto. Asesorar en la elección de las distintas tecnologías para ser incorporadas en los proyectos.
    Elaborar las especificaciones técnicas para los documentos de ejecución de proyectos definiendo los niveles de servicio para un mejor control, informes de Seguimiento de Proyecto.
    Realizar, mantener y documentar estándares y procedimientos para los procesos de propia competencia. Confeccionar toda la documentación necesaria referida a los nuevos proyectos.
    Definir e implementar los planes de capacitación asociados a los proyectos.
    Capacitar a los usuarios para lograr el óptimo rendimiento de las aplicaciones.
    Elaborar planes de mantenimiento para las herramientas YD incluyendo propuestas de mejora continua.

Lugar y horario: Neuquén. De lunes a viernes de 8 a 17 hs..

Disponibilidad para viajar: no.

Interesados: enviar su CV actualizado a iara.m.ventosa@set.ypf.com
                    </div>
                    <div class="panel-footer">
                        Activo
                    </div>
                </div>
                
                <p><a class="btn btn-success" href="">Aplicar</a></p>
            </div>
        </div>

    </div> -->
</div>

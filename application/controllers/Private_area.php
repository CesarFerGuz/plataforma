<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Private_area extends CI_Controller {
 public function __construct()
 {
  parent::__construct();
  if(!$this->session->userdata('id'))
  {
   redirect('login');
  }
  $this->load->model('user_model');
 }

 function index()
 {
  $userdata = $this->user_model->get_data($this->session->userdata('id'),'table_usuarios');
  $userid = $userdata->id_empleado;
  $empleadodata = $this->user_model->get_data($userid,'table_empleados');
  $nombre = $empleadodata->nombre;
  echo '<br /><br /><br /><h1 align="center">Bienvenido '.$nombre.'</h1>';
  echo '<p align="center"><a href="'.base_url().'private_area/logout">Cerrar Sesión</a></p>';
 }

 function logout()
 {
  $data = $this->session->all_userdata();
  foreach($data as $row => $rows_value)
  {
   $this->session->unset_userdata($row);
  }
  if(isset($_SESSION['message'])){
    unset($_SESSION['message']);
  }
  redirect('login','refresh');
 }
}

?>

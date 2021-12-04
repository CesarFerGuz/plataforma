<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Main extends BaseController {
 public function __construct()
 {
  parent::__construct();
  if(!$this->session->userdata('id_usuario'))
  {
   redirect('login');
  }
  $this->load->model('user_model');
 }

 function index()
 {
  $userdata = $this->user_model->get_data("id_usuario",$this->session->userdata('id_usuario'),'table_usuarios');
  $userid = $userdata->id_persona;
  $personadata = $this->user_model->get_data("id_persona",$userid,'table_personas');
  $data['persona'] = $personadata;
  $this->load->view('main',$data);
 }

}

?>

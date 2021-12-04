<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Materias extends BaseController {

 	public function __construct()
 	{
  		parent::__construct();
  		if(!$this->session->userdata('id_usuario'))
  		{
    		redirect('login');
  		}
  		$this->load->model('user_model');
  		$this->load->model('miscellaneous_model');
 	}

	function index()
	{

  		$userdata = $this->user_model->get_data("id_usuario",$this->session->userdata('id_usuario'),'table_usuarios');
  		$userid = $userdata->id_persona;
  		$personadata = $this->user_model->get_data("id_persona",$userid,'table_personas');
  		$data['persona'] = $personadata;

  		$tbl_materias = $this->miscellaneous_model->get_all_subjects();
  		$materias = array();
  		foreach ($tbl_materias as $key) {
  			$result = $this->miscellaneous_model->get_carrera_byid($key->id_carrera)->nombre;
  			$materia = (object) array(
  				'nombre' => $key->nombre, 
  				'id_materia' => $key->id_materia,
  				'id_carrera' => $key->id_carrera,
  				'hrs_teor' => $key->hrs_teor,
  				'hrs_pract' => $key->hrs_pract,
  				'name_carrera' => $result
  			);
  			array_push($materias, $materia);
  		}
  		$data['materias'] = $materias;

  		$this->load->view('materias',$data);
	}
}

?>
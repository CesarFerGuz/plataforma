<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller {

   	public function __construct()
    {
        parent::__construct();
	  if($this->session->userdata('id'))
	  {
	   redirect('private_area');
	  }
	    $this->load->library('encrypt');
	    $this->load->model('user_model');
    }

    public function index()
    {
    	$this->load->view('register');
    }

    function getdata()
    {
    	$userdata = $this->user_model->get_data("190i0023","table_usuarios");
		if (!$userdata) {
			echo "false";
		}else{
			echo "true ".$userdata->nombre;
		}
    }

    function validation()
	{
		$this->form_validation->set_rules('id_empleado', 'Número de empleado', 'required|trim|is_unique[table_usuarios.id_empleado]');
		$this->form_validation->set_rules('user_email', 'Correo', 'required|trim|valid_email|is_unique[table_usuarios.correo]');
		$this->form_validation->set_rules('user_password', 'Contraseña', 'required');
		if($this->form_validation->run())
		{
			$idempleado = $this->input->post('id_empleado');
    		$userdata = $this->user_model->get_data($idempleado,"table_empleados");
    		if ($userdata) {
    			$tipo = 0;
    			if ($userdata->puesto_id == 1) {
    				$tipo = 1;
    			}
				$encrypted_password = $this->encrypt->encode($this->input->post('user_password'));
				$nombre = $userdata->nombre;
				$data = array(
				'correo'  => $this->input->post('user_email'),
				'contraseña' => $encrypted_password,
				'tipo' => $tipo,
				"id_empleado" => $idempleado
				);
				$id = $this->user_model->insert($data,"table_usuarios");
	      		$this->session->set_userdata('id', $id);
	      		$this->session->set_userdata('nombre',$nombre);
	    		redirect('private_area');
    		}else{
    			$this->load->view('register');
    		}
		}
		else
		{
    		$this->load->view('register');
		}
	}
    
}

?>
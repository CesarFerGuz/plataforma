<?php defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' ); 

/**
 * Class : BaseController
 * Base Class to control over all the classes
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class BaseController extends CI_Controller {
	function logout()
	{
		$this->session->sess_destroy ();
	  	if(isset($_SESSION['message'])){
	  		unset($_SESSION['message']);
	  	}
	  	redirect('login');
	}
}
?>
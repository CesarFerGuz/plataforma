<?php
class Miscellaneous_model extends CI_Model
{
	function get_all_subjects()
	{
	    $query = $this->db->get('table_materias');
	    return $query->result();
	}

	function get_carrera_byid($id)
	{
		$this->db->where('id_carrera',$id);
	    $query = $this->db->get('table_carreras');
	    return $query->row();
	}
}

?>
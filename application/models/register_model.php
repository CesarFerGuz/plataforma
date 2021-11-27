<?php
class Register_model extends CI_Model
{
 function insert($data)
 {
  $this->db->insert('table_usuarios', $data);
  return $this->db->insert_id();
 }
}

?>

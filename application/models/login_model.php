<?php
class Login_model extends CI_Model
{
 function can_login($email, $password)
 {
  $this->db->where('correo', $email);
  $query = $this->db->get('table_usuarios');
  if($query->num_rows() > 0)
  {
   foreach($query->result() as $row)
   {
     $store_password = $this->encrypt->decode($row->contraseña);
     echo $store_password;
     if($password == $store_password)
     {
      $this->session->set_userdata('id', $row->id);
      $this->session->set_userdata('nombre',$row->nombre);
     }
     else
     {
      return 'Wrong Password';
     }
   }
  }
  else
  {
   return 'Wrong Email Address';
  }
 }
}

?>

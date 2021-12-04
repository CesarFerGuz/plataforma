<?php
class User_model extends CI_Model
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
        $this->session->set_userdata('id_usuario', $row->id_usuario);
       }
       else
       {
        return 'Contraseña incorrecta';
       }
     }
    }
    else
    {
     return 'Correo incorrecto';
    }
  }

  function insert($data, $tabla)
  {
    $this->db->insert($tabla, $data);
    return $this->db->insert_id();
  }

  function get_data($idName, $id, $tabla)
  {
    $this->db->where($idName, $id);
    $query = $this->db->get($tabla);
    return $query->row();
  }
}

?>
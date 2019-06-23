<html>

<body>
 <?php 


$this->load->database();
// $query = $this->db->query("SELECT login_time FROM history_login  ORDER BY id DESC LIMIT 1 ");
// $waktu_user = $query->result_array();
// $waktu_asli = $waktu_user->login_time;
// echo json_encode($waktu_asli);

$last_row = $this->db->order_by('id',"DESC")
            ->limit(1)
            ->get('history_login')
            ->row();
// print_r($last_row)
 $waktu_user = $last_row->login_time;

$pagi = '00:00:00';
        $siang = '12:00:00';
        $sore  = '18:00:00';
        $malam = '23:00:00';
        if((date('H:i:s',strtotime($pagi)) < $waktu_user ) and (date('H:i:s',strtotime($siang)) > $waktu_user )){
            $results = "pagi";
        }
        elseif((date('H:i:s',strtotime($siang)) < $waktu_user ) and (date('H:i:s',strtotime($sore)) > $waktu_user )){
            $results = "sore";
        }
        elseif((date('H:i:s',strtotime($sore)) < $waktu_user ) and (date('H:i:s',strtotime($malam)) > $waktu_user )){
            $results = "malam";
        }
        // date_default_timezone_set('UTC'); //bagaimana caranya dikasih automatic 
        //         $hari = date ("D");
        //         $time = date('H:i:s');
    
        date_default_timezone_set('Asia/Jakarta');
    // $waktu = '07:00:00';
    // $data  = date('H:i:s');
    // $time =  date ("D");
    // echo $data;
    // echo $time;

    //   print $data['nilai'];
    //   echo $data['nilai'];
      print $this->session->userdata('nilai');
      

  ?>




</body>
</html>	
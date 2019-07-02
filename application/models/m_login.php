 <?php
class M_login extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    function cek($email, $password) {
        $this->db->where("email", $email);
        $this->db->where("password", $password);
        return $this->db->get("user_context");
    }

    function score_data($email) {
        $this->db->where("email", $email);
        return $this->db->get("history_score");
    }

    function level($email){
        $this->db->where("email",$email);
        return $this->db->get("klasifikasi_level");
    }
    

    function ambil_level3($email){
        $this->db->where("email",$email);
        return $this->db->get("boss_name");
    }

    function cek_level_1($nama){
        $this->db->where("boss_name",$nama);
        return $this->db->get("boss_name");
    }

    function cek_otp($otp){
        $this->db->where("otp_kode",$otp);
        return $this->db->get("otp_history");
    }

    function cek_level_3(){
        $query = $this->db->query("SELECT login_time FROM history_login ORDER BY id DESC LIMIT 1");
        $result = $query->result_array();
        return $result;
    }
    
    public function saveHistory($data)
    {
        {
            $this->db->insert("history_login",$data);
            $id = $this->db->insert_id();
        }

        return $id;
    }

    public function saveOTP($otp){
        {
            $this->db->insert("otp_history",$otp);
            $id = $this->db->insert_id();
        }
        return $id;

    }

    public function last_record(){
        $last_row = $this->db->order_by('id',"DESC")
            ->limit(1)
            ->get('history_login')
            ->row();
            $waktu_user = $last_row->login_time;
            return $waktu_user;
    }

    // public function fetch_boss(){
    //     $this->db->select('*');
    //    $this->db->order_by('nama_boss', 'ASC');
    //    $query = $this->db->get('boss_list');
    //    $output = '<option value="">Select Boss Name </option>';
    //    foreach($query->result() as $row)
    //    {
    //     $output .= '<option value="'.$row->nama_boss.'">'.$row->nama_boss.'</option>';
    //    }
    //    return $output;
    // }
    
}
<?php
require 'geo.php';


class Login extends CI_Controller
{
    private $kode_asli;
    // public $nilai;
    function get_lokasi(){
        $ip = file_get_contents('https://api.ipify.org');
        $geo = new geo;
        $geo->request($ip);
        $geo->lat;
        $geo->lon;

       
    }

    function get_waktu(){
        //function untuk mendapatkan waktu
        $time = date('H:i:s');
        return $time;
    }

    function get_calendar(){
        //function untuk mendapatkan info kalender
        $date = date('y-m-d');
        return $date;
    }

    function __construct()
    {
        parent::__construct();
        $this->load->model('m_login');
        $this->load->database();
    }
     function index() {
        $this->load->view('nimda/login');
    }


    function cek_login() {
            $nilai = 0;
            $email = $this->input->post('email');
		//ini ambil dari inputan email
            $password = $this->input->post('password');
		//ini ambil dari inputan pasword
            $cek = $this->m_login->cek($email, $password);
            $cek_context = $this->m_login->score_data($email);
            $cek_level = $this->m_login->level($email);
            if ($cek->num_rows() > 0) {
                //login berhasil, buat session

                foreach ($cek->result() as $qad) {
                    // $score = $qad->
                    $sess_data['logged_in'] = 1;
                    $sess_data['email'] = $qad->email;
                    $sess_data['password'] = $qad->password;
                    $sess_data['latitude'] = $qad->latitude;
                    $sess_data['longtitude'] = $qad->longtitude;
                    $sess_data['waktu_awal'] = $qad->waktu_awal;
                    $sess_data['waktu_akhir'] = $qad->waktu_akhir;
                    $sess_data['kota'] = $qad->kota;
                    $this->session->set_userdata($sess_data);
                }
                //mengambil score di database
                foreach ($cek_context->result() as $ta) {
                    $score_calender = $ta->score_calender;
                    $score_identity = $ta->score_identity;
                    $score_lokasi = $ta->score_lokasi;
                    $score_time = $ta->score_time;
                }
                foreach ($cek_level->result() as $ta1) {
                    $level_1 = $ta1->level_1;
                    $level_2 = $ta1->level_2;
                    $level_3 = $ta1->level_3;
                    $level_4 = $ta1->level_4;
                }
                $nilai = $score_identity;
                date_default_timezone_set('Asia/Jakarta'); //bagaimana caranya dikasih automatic 
                $hari = date ("D");
                $time = date('H:i:s');
                $ip = file_get_contents('https://api.ipify.org');
    
                $arr_location =file_get_contents ('http://ip-api.com/json/'.$ip);
                $arr_location = json_decode($arr_location);
                $lat = $arr_location ->lat;
                $lon = $arr_location ->lon;
                $city =$arr_location ->city;
                //perbandingan hari dan waktu
                if(($hari == 'Mon') or ($hari == 'Tue') or ($hari == 'Wed') or ($hari == 'Thu') or ($hari == 'Fri')){
                    $nilai = $nilai + $score_calender;
                    if(($time > $this->session->userdata('waktu_awal')) and ($time < $this->session->userdata('waktu_akhir'))){
                        $nilai = $nilai + $score_time;
                    }else{
                        $nilai =  $nilai + 0;
                    }   
                }else{
                    $nilai =  $nilai + 0;
                    // $activity = $activity + 0 ;
                } 
                //membandingkan lokasi pengguna 
                if(($this->session->userdata('latitude')==$lat) and ($this->session->userdata('longtitude')==$lon) or ($this->session->userdata('kota') == $city) ){
                    $nilai = $nilai + $score_lokasi;
                }else{
                    $nilai = $nilai + 0;
                }

                $email = $this->session->userdata('email');
                $data['nilai'] = $nilai;

                //klasifikasi level                                        
                //level 0
                if($nilai == $level_1){
                    $this->save_data($email,$city,$time);
                    $this->load->view('berhasil_log',$data);
                    $pesan = $this->validasi_waktu($time);
                    $this->login_info($pesan);
                     

                }
                //level 1
                if(($nilai < $level_1) and ($nilai >= $level_2)){
                    $this->save_data($email,$city,$time);
                    $this->load->view('level_1');


                }
                //level2
                if(($nilai < $level_2) and ($nilai >= $level_3 )){
                    $this->save_data($email,$city,$time);
                    $this->otp();
                    redirect('login/level_2');
                }

                if(($nilai < $level_3) and ($nilai>= $level_4)){
                    $this->load->view('level_3');
                    $this->save_data($email,$city,$time);
                    $pesan = $this->validasi_waktu($time);
                    $this->login_info($pesan);
                }

            } else {
                $this->session->set_flashdata('result_login', '<br>Username atau Password yang anda masukkan salah.');
                redirect('login/gagal_load ');
                $nilai = 0;
            }
    }


    function logout() {
        $this-> load -> view('level_3');
        $this->session->sess_destroy();
        redirect('keluar');
    }

    function level_1(){
        $boss =$this->input->post('boss');
        $cek_boss = $this->m_login->cek_level_1($boss);
        $data['nilai'] = $this->nilai;
        if ($cek_boss->num_rows() > 0){
            $this->load->view('berhasil_log',$data);
        }else{
            $this->load->view('login.php');
        }


    }
    function level_2_(){
        $otp = $this->input->post('otp');
        $cek_otp = $this->m_login->cek_otp($otp);
        if($cek_otp->num_rows()> 0 ){
            $this->load->view('berhasil_log');
        }else{
            $this-> load -> view('gagal',$this->kode_asli);
        }
    }
    function klasifikasi($nilai){
        if(($nilai == $this->session->userdata('level_1'))){
                     $this-> load -> view('berhasil_log',$data);

                }
                if(($nilai <= $this->session->userdata('level_1') and ($nilai >= $this->session->userdata('level_2')) )){
                    redirect('login/level_2');


                }
                 if(($nilai < $this->session->userdata('level_2') and ($nilai >= $this->session->userdata('level_1')) )){
                    redirect('login/level_3');
                }
    }

    function level_3_cek(){
        $this->load->database();
        $last_row = $this->db->order_by('id',"DESC")
            ->limit(1)
            ->get('history_login')
            ->row();
            $waktu_user = $last_row->login_time;
        $waktu =$this->input->post('time');
        $hasil = $this->validasi_waktu($waktu_user);

        if($waktu == $hasil){
            $this->load -> view('berhasil_log');
        }else{
            $this->load->view('gagal');
        }
    }

    function validasi_waktu($database){
        $pagi = '00:00:00';
        $siang = '12:00:00';
        $sore  = '18:00:00';
        $malam = '23:00:00';
        
        if((date('H:i:s',strtotime($pagi)) < $database ) and (date('H:i:s',strtotime($siang)) > $database )){
            $results = "pagi";
        }
        elseif((date('H:i:s',strtotime($siang)) < $database ) and (date('H:i:s',strtotime($sore)) > $database )){
            $results = "sore";
        }
        elseif((date('H:i:s',strtotime($sore)) < $database ) and (date('H:i:s',strtotime($malam)) > $database )){
            $results = "malam";
        }
        return $results;
    } 

    function save_otp($otp){
        $ArrData = array(
            'otp_kode'=>$otp
        );
        $this->m_login->saveOTP($ArrData);
    }

    function save_data($email,$city,$time){
        
                $ArrData = array(
                                         'email'=>$email,
                                         'login_location'=>$city,
                                         'login_time'=>$time
                                );
                $this->m_login->saveHistory($ArrData);
    }


    function berhasil_log($nilai){
    }

    function gagal_load(){
        $this-> load -> view('login.php');
    }
    
    function level_2 (){
        $this-> load -> view('level_2.php');
    }

    function login_info($pesan){
        $userkey = "w2cou5"; 
        $passkey = "telkommen13"; 
        $telepon = "081324424499";
        $message =  "<login_info> Login terakhir anda $pesan";
        $url = "https://reguler.zenziva.net/apps/smsapi.php";
        $curlHandle = curl_init();
        curl_setopt($curlHandle, CURLOPT_URL, $url);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS,  'userkey='.$userkey.'&passkey='.$passkey.'&nohp='.$telepon.'&pesan='.urlencode($message));
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        curl_setopt($curlHandle, CURLOPT_POST, 1);
        $results = curl_exec($curlHandle);
        curl_close($curlHandle);

        $XMLdata = new SimpleXMLElement($results);
        $status = $XMLdata->message[0]->text;
        echo $status;
    }

    function otp(){
        $userkey = "w2cou5"; 
        $passkey = "telkommen13"; 
        $telepon = "081324424499";
        $kode = rand(1000,10000);
        $kode_sementara = $kode;
        $kode_asli = (string) $kode;
        $this->save_otp($kode_asli);
        $message = "<kode> $kode_sementara";
        $url = "https://reguler.zenziva.net/apps/smsapi.php";
        $curlHandle = curl_init();
        curl_setopt($curlHandle, CURLOPT_URL, $url);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS,  'userkey='.$userkey.'&passkey='.$passkey.'&nohp='.$telepon.'&pesan='.urlencode($message));
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        curl_setopt($curlHandle, CURLOPT_POST, 1);
        $results = curl_exec($curlHandle);
        curl_close($curlHandle);

        $XMLdata = new SimpleXMLElement($results);
        $status = $XMLdata->message[0]->text;
        echo $status;
    }

}
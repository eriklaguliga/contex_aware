<?php
require 'geo.php';


class Login extends CI_Controller
{
    function level_2_cek(){
        $otp = $this->input->post('otp');
        $userkey = "w2cou5"; 
        $passkey = "telkommen13";
        $telepon = "081324424499";
        $kode = rand (1000,10000);
        $kode_asli = (string) $kode;

        $message = "<otp> $kode_asli";
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

        if($otp == $kode_asli){
            $this->load->view('berhasil_log');
        }else{
            $this->load->view('login');
        }

    }
}
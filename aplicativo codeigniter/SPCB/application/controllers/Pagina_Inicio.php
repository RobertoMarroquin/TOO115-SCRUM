<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pagina_Inicio extends CI_Controller {


public function __construct(){
	parent::__construct();
	$this->load->helper(array('validate','url'));
}



public function index()
	{

		$this->load->view('menu');

		$this->load->view('mapa');

	
	}


}

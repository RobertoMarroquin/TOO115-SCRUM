<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

function index()
	{
        $this->load->view('menu');
        $this->load->view('Login');
		}

}

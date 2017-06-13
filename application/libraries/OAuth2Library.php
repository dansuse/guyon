<?php


defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'vendor/autoload.php';
class OAuth2Library {

	private $server;
	public $kata = "Halo from";

	public function __construct(){
		$dsn      = 'mysql:dbname=guyon;host=localhost';
		$username = 'root';
		$password = '';
		// error reporting (this is a demo, after all!)
		ini_set('display_errors',1);error_reporting(E_ALL);

		// $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
		$storage = new \OAuth2\Storage\Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password));

		// Pass a storage object or array of storage objects to the OAuth2 server class
		$this->server = new OAuth2\Server($storage);

		// Add the "Client Credentials" grant type (it is the simplest of the grant types)
		$this->server->addGrantType(new OAuth2\GrantType\ClientCredentials($storage));

		// Add the "Authorization Code" grant type (this is where the oauth magic happens)
		$this->server->addGrantType(new OAuth2\GrantType\AuthorizationCode($storage));
		$this->server->addGrantType(new OAuth2\GrantType\RefreshToken($storage));
	}
	
    public function token()
    {
    	// Handle a request for an OAuth2.0 Access Token and send the response to the client

		$this->server->handleTokenRequest(OAuth2\Request::createFromGlobals())->send();
    }

    public function authorize($username = null)
    {
    	$request = OAuth2\Request::createFromGlobals();
		$response = new OAuth2\Response();

		// validate the authorize request
		if (!$this->server->validateAuthorizeRequest($request, $response)) {
		    $response->send();
		    die;
		}
		// display an authorization form
		if (empty($_POST)) {
		  exit('
		<form method="post">
		  <label>Do You Authorize TestClient?</label><br />
		  <input type="submit" name="authorized" value="yes">
		  <input type="submit" name="authorized" value="no">
		</form>');
		}

		// print the authorization code if the user has authorized your client
		$is_authorized = ($_POST['authorized'] === 'yes');
		$this->server->handleAuthorizeRequest($request, $response, $is_authorized, $username);
		if ($is_authorized) {
		  // this is only here so that you get to see your code in the cURL request. Otherwise, we'd redirect back to the client
		  $code = substr($response->getHttpHeader('Location'), strpos($response->getHttpHeader('Location'), 'code=')+5, 40);
		  exit("SUCCESS! Authorization Code: $code");
		}
		$response->send();
    }

    public function resource(){
    	// Handle a request to a resource and authenticate the access token
		if (!$this->server->verifyResourceRequest(OAuth2\Request::createFromGlobals())) {
		    $this->server->getResponse()->send();
		    die;
		}
		//echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
    }
}
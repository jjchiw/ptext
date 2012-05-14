<?php
/**
 * A Helper to display QR Code images generated by the google Chart API
 * 
 * TODO: better checking of limits and valid inputs
 * 
 * @author Max Dörfler <max@muxe.org>
 *
 */
class QrcodeHelper extends AppHelper {
	
	var $helpers = array('Html');
	
	/** 
	 * Size in pixels
	 * 
	 * @var string
	 */
	var $size = '300x300';
	
	/** 
	 * Encoding:
	 * 	UTF-8 [Default]
	 * 	Shift_JIS
	 * 	ISO-8859-1
	 * 
	 * @var string Encoding
	 */
	var $encode = 'UTF-8';
	
	/** 
	 * Error correction level
	 * L - [Default] Allows recovery of up to 7% data loss
     * M - Allows recovery of up to 15% data loss
     * Q - Allows recovery of up to 25% data loss
     * H - Allows recovery of up to 30% data loss
     * 
	 * @var string Error correction level
	 */
	var $error_correction = 'L';
	
	/** 
	 * The width of the white border around the data portion of the chart. This is in rows, not in pixels.
	 * 
	 * @var integer
	 */
	var $margin = 0;
	
	/** 
	 * The Base URL to the QR-Code Generation API
	 * 
	 * @var string
	 */
	var $base_url = 'http://chart.apis.google.com/chart?cht=qr&chl=';
	
	/**
	 * Encode Text. You can use plaintext or encode Infos in whatever format you want.
	 * 
	 * @param string $text Text to encode
	 * @param mixed $options options array, see helper vars for description of parameters
	 */
	function text($text = '',  $id = "qr", $options = array()) {
		return $this->Html->image($this->base_url . urlencode($text) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * Encode an URL. Behaves like the usual Cake URLs. Takes
	 * full URLs like "http://www.google.com"
	 * relative paths like "/" or "/articles/view/3"
	 * url arrays like "array('controller' => 'articles', 'action' => 'view', 3)"
	 * 
	 * @param string|mixed $url URL to encode
	 * @param mixed $options options array, see helper vars for description of parameters
	 */
	function url($url = '', $id = "qr", $options = array()) {
		$url = Router::url($url, true);
		return $this->Html->image($this->base_url . urlencode($url) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * Encode an email (Clients should see the possibility to send an email)
	 * 
	 * @param $mail Email Address
	 * @param mixed $options options array, see helper vars for description of parameters
	 */
	function email($mail = '',  $id = "qr", $options = array()) {
		return $this->Html->image($this->base_url . urlencode('mailto:' . $mail) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * A tel URI should be used to encode a telephone number, to ensure that the digits are understood as a telephone number. 
	 * Further, it is advisable to include prefixes that make the number accessible internationally. 
	 * For example, to encode the US phone number 212-555-1212, one should encode "tel:+12125551212". This tel URI includes a "+1" prefix 
	 * that will make it usable outside the United States.
	 * 
	 * @param string $phone Phonenumber
	 * @param mixed $options options array, see helper vars for description of parameters
	 */
	function telephone($phone = '', $id = "qr",  $options = array()) {
		return $this->Html->image($this->base_url . urlencode('tel:' . $phone) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * A MEMCARD contact
	 * 
	 * Contact Params:
	 * 	name => Full Name
	 * 	address => Full Address
	 * 	phone => Phone Number
	 * 	email => Email Address
	 * 	url => homepage
	 * 	note => memo for the contact (didn't work on my android :))
	 * 
	 * @param array $contact
	 * @param array $options options array, see helper vars for description of parameters
	 */
	function contact($contact = array(),  $id = "qr", $options = array()) {
		$ret = 'MECARD:';
		if (isset($contact['name'])) {
			$ret .= 'N:'.$contact['name'].';';
		}
		if (isset($contact['address'])) {
			$ret .= 'ADR:'.$contact['address'].';';
		}
		if (isset($contact['phone'])) {
			$ret .= 'TEL:'.$contact['phone'].';';
		}
		if (isset($contact['email'])) {
			$ret .= 'EMAIL:'.$contact['email'].';';
		}
		if (isset($contact['url'])) {
			$ret .= 'URL:'.$contact['url'].';';
		}
		if (isset($contact['note'])) {
			$ret .= 'NOTE:'.$contact['note'].';';
		}
		$url = $this->base_url . urlencode($ret) . $this->_optionsString($options);
		return $this->Html->image($url, array("id" => $id));
	}
	
	/**
	 * Send a SMS to a given number
	 * 
	 * @param string $number
	 * @param array $options options array, see helper vars for description of parameters
	 */
	function sms($number = '',  $id = "qr", $options = array()) {
		return $this->Html->image($this->base_url . urlencode('sms:' . $number) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * Send a MMS to a given number
	 * 
	 * @param string $number
	 * @param array $options options array, see helper vars for description of parameters
	 */
	function mms($number = '',  $id = "qr", $options = array()) {
		return $this->Html->image($this->base_url . urlencode('mms:' . $number) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * A geo URI may be used to encode a point on the earth, including altitude.
	 * For example, to encode the Google's New York office, which is at 40.71872 deg N latitude, 73.98905 deg W longitude, 
	 * at a point 100 meters above the office, one would encode "geo:40.71872,-73.98905,100".
	 * A reader might open a local mapping application like Google Maps to this location and zoom accordingly, 
	 * or could open a link to this location on a mapping web site like Google Maps in the device's web browser. 
	 * 
	 * Geo Params:
	 * 	lat => latitude
	 * 	lon => longitude
	 * 	height => display height
	 * 
	 * @param $geo
	 * @param mixed $options options array, see helper vars for description of parameters
	 */
	function geo($geo = array(),  $id = "qr", $options = array()) {
		if (!isset($geo['lat'])) {
			$geo['lat'] = '';
		}
		if (!isset($geo['lon'])) {
			$geo['lon'] = '';
		}
		if (!isset($geo['height'])) {
			$geo['height'] = '2000';
		}
		return $this->Html->image($this->base_url . urlencode('geo:' . $geo['lat'] . ',' . $geo['lon'] . ',' . $geo['height']) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * Searches the android market. $app Syntax:
	 * 'foobar' to just search
	 * 'pub:"Charles Chen"' a link to all apps developed by Charles
	 * 
	 * @param $app
	 * @param $options
	 */
	function market($app = '',  $id = "qr", $options = array()) {
		return $this->Html->image($this->base_url . urlencode('market://search?q=' . $app) . $this->_optionsString($options), array("id" => $id));
	}
	
	/**
	 * An iCal Event
	 * 
	 * Event params: (@see http://www.kanzaki.com/docs/ical/vevent.html)
	 * 	summary => Title for the Event (e.g. Douglas' Birthday)
	 * 	start => starttime (given as YYYYMMDD or YYYYMMDDTHHMMSS (e.g. 20101224T183000)) @see http://www.kanzaki.com/docs/ical/dateTime.html
	 * 	end => endtime (if none given and start is given as YYYYMMDD, all day event)
	 * 	location => simple location string
	 * 	description => Description for the event
	 * All params are optional
	 * 
	 * @param array $event Event param array
	 * @param mixed $options options array, see helper vars for description of parameters
	 */
	function event($event = array(), $options = array()) {
		$ret = 'BEGIN:VEVENT';
		if (isset($event['summary'])) {
			$ret .= "\n".'SUMMARY:'.$event['summary'];
		}
		if (isset($event['start'])) {
			$ret .= "\n".'DTSTART:'.$event['start'];
		}
		if (isset($event['end'])) {
			$ret .= "\n".'DTEND:'.$event['end'];
		}
		if (isset($event['location'])) {
			$ret .= "\n".'LOCATION:'.$event['location'];
		}
		if (isset($event['description'])) {
			$ret .= "\n".'DESCRIPTION:'.$event['description'];
		}
		$ret .= "\n".'END:VEVENT';
		return $this->Html->image($this->base_url . urlencode($ret) . $this->_optionsString($options), array("id" => $id));
	}
	
	/** 
	 * Takes the options array, merges it with the default values and returns all options as url parameter string
	 * 
	 * @param mixed $options options array, see helper vars for description of parameters
	 * @return string url parameter string
	 */
	function _optionsString($options) {
		if (!isset($options['size'])) {
			$options['size'] = $this->size;
		}
		if (!isset($options['encode'])) {
			$options['encode'] = $this->encode;
		}
		if (!isset($options['error_correction'])) {
			$options['error_correction'] = $this->error_correction;
		}
		if (!isset($options['margin'])) {
			$options['margin'] = $this->margin;
		}
		return '&chs='.$options['size'].'&choe='.$options['encode'].'&chld='.$options['error_correction'].'|'.$options['margin'];
	}

}
?>
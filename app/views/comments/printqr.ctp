<!doctype html> 
<html lang="es" class="no-js"> 
<head> 
  <meta charset="utf-8"> 
  <!-- Header basado en HTML5 boilerplate  --> 
  <!--[if IE]><![endif]--> 
 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
  <title>30 pre-textos. Di&aacute;logos de nada y nadie.</title> 
  <meta name="description" content="30 pre-textos es un proyecto de arte urbano que usa QRcodes para interactuar con los espectadores"> 
  <meta name="location" content="Barcelona, España"> 
  <meta name="author" content="La calabaza. Textos de Gris García"> 
  <meta name="launchdate" content="Abril 2011"> 
  <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;"> 
 
  <link rel="shortcut icon" href="/favicon.ico"> 
  <link rel="apple-touch-icon" href="/apple-touch-icon.png"> 
 
  <?php echo $this->Html->css('style.css'); ?>
  <link rel="stylesheet" media="handheld, only screen and (max-device-width:480px)" href="css/handheld.css"> 
 
	<!--Share this code --> 
	<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher:'a076a570-a644-4f59-8c32-90e1760e1ca2'});</script> 
 
	<!-- google analytics code --> 
	<script type="text/javascript"> 
	
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-22777380-1']);
	  _gaq.push(['_setDomainName', '.tuerco.com']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script> 
 
</head> 
<!--[if lt IE 7 ]> <body class="ie6" id="index"> <![endif]--> 
<!--[if IE 7 ]>    <body class="ie7" id="index"> <![endif]--> 
<!--[if IE 8 ]>    <body class="ie8" id="index"> <![endif]--> 
<!--[if IE 9 ]>    <body class="ie9" id="index"> <![endif]--> 
<!--[if (gt IE 9)|!(IE)]><!--> <body id="qrtemplate"> <!--<![endif]--> 
	
	<header> 
		<?php 
			echo $this->Qrcode->url(Configure::read('app_url') . $comment['Pretext']['title'] . ".html#" . $comment['Comment']['ordinal'], "commentqr");

			echo $this->Html->image('30pt-QRcode-template.jpg', array('alt'=> __('30 pre-textos, template para qr', true)));
		?>

	</header> 
	
	<div id="content"> 
		<h1>&iexcl;Gracias por participar!</h1> 
		
		<h2>Instrucciones de uso:</h2>
		<ol>
			<li>Imprime este QR.</li>
			<li>Rec&oacute;rtalo y p&eacute;galo en el lugar que creas adecuado.</li>
			<li>Leelo con tu tel&eacute;fono.</li>
		</ol>
		
		<p>&iexcl;Listo! La ubicaci&oacute;n de tu pre-texto ser&aacute; añadida al proyecto.</p>

		<p class="about"><strong>30 pre-textos</strong> es un proyecto de arte urbano que narra treinta principios de historias distribuidos por la ciudad de Barcelona. Cada lugar elegido tiene relación con el comienzo de la historia y a su vez dialoga con el espacio que la rodea. 
		<?php echo $this->Html->link('Descargar como pdf', array('action'=>'download',  $comment['Comment']['id'] )); ?>
		</p> 
		
	</div> 
 
	<footer> 
			
		<p>Proyecto apoyado por el Fondo Nacional para la Cultura y las Artes.</p> 
		<?php echo $this->Html->image('logosfonca.jpg', array('alt'=> __('Logotipos de CONACYT, FONCA y CONACULTA', true))); ?>
 
		<p>&copy; 2011 La Calabaza. Plataforma por: TuerCo.</p> 
 
	</footer> 
 
	</body> 
</html>
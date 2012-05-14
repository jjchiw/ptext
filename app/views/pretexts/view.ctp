<!doctype html>
<html lang="es" class="no-js">
<head>
  <meta charset="utf-8">
  <!-- Header basado en HTML5 boilerplate  -->
  <!--[if IE]><![endif]-->

  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title><?php echo $pretext['Pretext']['extra_title']; ?></title>
  <meta name="description" content="30 pre-textos es un proyecto de arte urbano que usa QRcodes para interactuar con los espectadores">

  <meta name="location" content="Barcelona, España">
  <meta name="author" content="La Calabaza. Textos de Gris García">
  <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">

  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">

  <link rel="stylesheet" href="css/style.css">
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
	  
	  function getLocation(ordinal){
		var anchor = window.location.href.split("#")
		if(anchor.length == 2){
			if(ordinal != anchor[1])
				return;
		} else {
			return;
		}

		updateLocation = function(position){
			$.post('comments/edit_location', {"data[Comment][ordinal]" : ordinal, 
								"data[Comment][lat]" :  position.coords.latitude,
								"data[Comment][lng]" : position.coords.longitude,
								"data[Comment][pretext_id]" : <?php echo $pretext['Pretext']['id']; ?>,
								"isAjax" : 1}, function(data) {
				if(data.response == "fail"){
				} else {						
				}
			});
		}
		
		//FAILURE TO GET GPS DATA
		error = function() {
		}
		
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(updateLocation, error);
		} else {
			  error('not supported');
		}
	}
	
	</script>
	
</head>
<!--[if lt IE 7 ]> <body class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <body class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <body class="ie8"> <![endif]-->

<!--[if IE 9 ]>    <body class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <body> <!--<![endif]-->

	<div id="content" class="pre-texto nueve">
		
		<?php echo $pretext['Pretext']['text']; ?>
		
		<div id="comments">
		<?php if (!empty($pretext['Comment'])):?>
		<?php
			$i = 0;
			foreach ($pretext['Comment'] as $comment):
			?>
				<div class="dialogo comment" id="<?php echo $comment['ordinal']; ?>">
					<?php echo $comment['text']; ?> 
					<span class="comment_details">Creado el <?php echo $comment['created']; ?></span>
					
					<?php echo $this->Html->link(__('Generar QR', true), array('controller' => 'comments', 'action' => 'printqr',  $comment['id']), array( 'target' => '_blank')); ?>
				</div>
			
			<?php
				if($comment['lat'] == 0 && $comment['lng'] == 0 && $this->Mobile->is_mobile()):
			?>
				<script type="text/javascript">
					getLocation(<?php echo $comment['ordinal']; ?>)
				</script>
			<?php
				endif;
			?>
			
			
			
			<?php endforeach; ?>
		<?php endif; ?>
		</div>
		
		<div id="jedit">
			<div class="edit_area" id="div_1">Continúa el pre-texto...</div>
		</div>

		<div id="fotos">
			<?php if (!empty($pretext['Multimedia'])):?>
			<?php
				$i = 0;
				foreach ($pretext['Multimedia'] as $multimedia):
				?>
				<a rel="photo_group" href="<?php echo $multimedia['url'];?>"  title="<?php echo $multimedia['description'];?>"><img src="<?php echo $multimedia['url'];?>" alt="<?php echo $multimedia['description'];?>"></a>
			<?php endforeach; ?>
		<?php endif; ?>
		</div>
		
	</div>

	<footer>
		<span class="st_twitter_hcount" displayText="Tweet"></span><span class="st_facebook_hcount" displayText="Share"></span><span class="st_email_hcount" displayText="Email"></span><span class="st_sharethis_hcount" displayText="Share"></span>
	</footer>

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jeditable.min.js"></script>
	<script type="text/javascript" src="js/json2.js"></script>

	<!--fancybox -->
	<script type="text/javascript" src="js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	
	<script type="text/javascript">
		$(document).ready(function() {
		
			function setEditable(obj){
				 obj.editable('comments/add', {
					 type      : 'textarea',
					 cancel    : 'Cancelar',
					 submit    : 'Guardar',
					 select    : true,
					 tooltip   : 'Haz clic para añadir al pre-texto',
					 indicator : 'Guardando...',
					  cssclass : "editable",
					 submitdata : {'isAjax' : 1, 'data[Comment][pretext_id]' : <?php echo $pretext['Pretext']['id']; ?>},
					 id   : 'elementid',
					 name : 'data[Comment][text]',
					 callback : function(value, settings) {
						 var comment = JSON.parse(value);
						 var commentDiv = $("<div/>").attr("class", "dialogo comment").attr("id", comment.ordinal).html(comment.text);
						 $("#comments").append(commentDiv);
						 
						 $("#div_1").remove();
						 
						 //Mensaje de gracias
						 var qrLink = $("<a/>").attr("href", "comments/printqr/"+comment.ordinal).attr("target", "_blank").html("imprime el QRCode de tu comentario");
						 var thnxdiv = $("<div/>").attr("class", "thnx").html("¡Gracias por participar! Si gustas ").append(qrLink);
						 $("#jedit").append(thnxdiv);
						 //Añadir nueva opción de comentar
						 /*var ediv = $("<div/>").attr("class", 'edit_area').attr('id', 'div_1').html("Continúa pre-texto...");
						 $("#jedit").append(ediv);
						 setEditable(ediv);*/
					 }
				});
			}
		 
			setEditable($("#div_1"));

			
			$("a[rel=photo_group]").fancybox({
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'titlePosition' 	: 'over',
				'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">Imagen ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
			});

	 });
	</script>
	
	
	</body>
</html>
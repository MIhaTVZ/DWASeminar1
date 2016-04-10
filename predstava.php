<?php
	include_once('include/connection.php');
	if(isset($_GET['lang'])){
		$lang = 'en';
		include_once('include/lang/en.php');
	}else{
		$lang = 'hr';
		include_once('include/lang/hr.php');
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Krafna - Predstave</title>
		<link rel="stylesheet" type="text/css" href="stil.css" />
		<meta charset="UTF-8">

		<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>


<script type='text/javascript'>
//<![CDATA[

  $(function() {
    // Stick the #nav to the top of the window
    var nav = $('.navigacija');
    var navHomeY = nav.offset().top;
    var isFixed = false;
    var $w = $(window);
    $w.scroll(function() {
        var scrollTop = $w.scrollTop();
        var shouldBeFixed = scrollTop > navHomeY;
        if (shouldBeFixed && !isFixed) {
            nav.css({
                position: 'fixed',
                top: 0,
                left: nav.offset().left,
                width: nav.width()
            });
            isFixed = true;
        }
        else if (!shouldBeFixed && isFixed)
        {
            nav.css({
                position: 'static'
            });
            isFixed = false;
        }
    });
});

//]]>
</script>
	</head>
	<body>
		<div class="wrapper" >
			<div class="naslov">
			<a href="index.html">
				<img class="logo" src="logo.png" alt="Smiley face" height="200" width="200">
			</a>
			<h2><?php echo $i18n['ime_stranice']; ?></h2>
			</div>
			<div class="navigacija">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="#">Predstave</a></li>
					<li><a href="#">Kontakt</a></li>
					<li><a href="#">O kazalištu</a></li>
					<li><a href="<?php $gets = http_build_query($_GET); echo parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH).'?'.$gets; if(!isset($_GET['lang'])) echo '&lang=en'; ?>">Engleski</a></li>
					<li><a href="<?php unset($_GET['lang']); $gets = http_build_query($_GET);  echo parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH).'?'.$gets; ?>">Hrvatski</a></li>
				</ul>
			</div>
			<div class="sredina">
			<div id="rep">
				<h4>GLUMCI</h4>
				<div id="repnav">
				<ul>
					<?php
						$stmt = $conn->prepare('SELECT * FROM glumci WHERE id_predstave = :id');
						$stmt->bindParam(':id', $_GET['id'], PDO::PARAM_INT); //PDO::PARAM_STR
						$stmt->execute();
						$glumci = $stmt->fetchAll();
						foreach ($glumci as $row) {
					        echo '<li>' . $row["ime"] . ' ' . $row["prezime"] . ' - ';
							if($lang == 'hr')
								echo $row["uloga"];
							else
								echo $row["uloga_en"];
							echo '</li>';
					    }
					?>
				</ul>
			</div>
			</div>
			<div id="vijesti">
			<div id="vj1">
			<h3><?php echo $i18n['predstava_opis_naslov']; ?></h3><br>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Ut sit amet sapien varius, fermentum ipsum a, mattis arcu.
			Nam sit amet porta metus, id semper lectus. Aenean quis efficitur ante, nec vehicula nisi.
			Maecenas non lobortis tellus, at mattis dui. Nunc molestie libero vitae mattis hendrerit.
			Mauris suscipit orci sit amet arcu hendrerit, vel varius ante accumsan.
			Duis vehicula orci et neque ultrices, ac semper dui consectetur.
			Suspendisse in imperdiet sem, accumsan molestie ligula.
			Duis bibendum rhoncus mi, non pellentesque nisi consectetur sit amet.
			Nunc ultricies fermentum eros sit amet laoreet. Aliquam erat volutpat.
			Suspendisse vulputate ligula leo, maximus eleifend ante vehicula venenatis.
			Vivamus cursus dui mi, sed dapibus est iaculis vel. Quisque maximus, ligula id facilisis volutpat,
			urna eros varius purus, non feugiat ex lorem at nisi.
			Nam porta leo est, sed hendrerit felis aliquam nec.</p>
			</div>
			</div>
			</div>
			<div class="footer"><p>@Fran Mihelčić,</p><p>Adresa:Fancevljev prilaz 4,</p><p>Tel:01/6678456</p></div>
		</div>
	</body>
</html>

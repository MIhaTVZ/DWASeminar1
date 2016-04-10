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
<html lang="en">
	<head>
		<title><?php echo $i18n['ime_stranice']; ?></title>
		<link rel="stylesheet" type="text/css" href="stil.css" >
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
					<li><a href="index.php <?php if(isset($_GET['lang'])) echo '?lang=en'; ?>">Home</a></li>
					<li><a href="#">Predstave</a></li>
					<li><a href="#">Kontakt</a></li>
					<li><a href="#">O kazalištu</a></li>
					<li><a href="<?php $gets = http_build_query($_GET); if(!empty($gets)) $gets = '?' . $gets; echo parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH).$gets; if(!isset($_GET['lang']) && empty($gets)) echo '?lang=en'; else if(!isset($_GET['lang'])) echo '&lang=en'; ?>">Engleski</a></li>
					<li><a href="<?php unset($_GET['lang']); $gets = http_build_query($_GET); if(!empty($gets)) $gets = '?' . $gets; echo parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH).$gets; ?>">Hrvatski</a></li>
				</ul>
			</div>
			<div class="sredina">
			<div id="rep">
				<h4>REPERTOAR</h4>
				<div id="repnav">
				<ul>
					<?php
						$predstave = $conn->query('SELECT * FROM predstave');
						foreach ($predstave as $row) {
					        echo '<li><a href="predstava.php?id=' . $row["id"] .'">' . $row["naziv"] . '</a></li>';
					    }
					?>
				</ul>
			</div>
			</div>
			<div id="vijesti">
				<?php
						$vijsti = $conn->query('SELECT * FROM vijsti ORDER BY DESC');
						foreach ($vijsti as $key => $row) {
					        echo '<div id="vj$key"><h3>'.$row["naslov"].'</h3><br><p>'.$row["tekst"].'</p></div><br><hr>';
					    }
					?>

			</div>
			</div>
			<div class="footer"><p>@Fran Mihelčić,</p><p>Adresa:Fancevljev prilaz 4,</p><p>Tel:01/6678456</p></div>
		</div>
	</body>
</html>

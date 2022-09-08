<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script
	src="https://webfonts.creativecloud.com/actor:n4:all;electrolize:n4:all.js"
	type="text/javascript"></script>

<title>Acesso</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/animate.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Theme Style -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>

	<header role="banner">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.html"><img alt="logotipo"
					src="images/logo.png"> </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarsExample05" aria-controls="navbarsExample05"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsExample05">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link active"
							href="index.html">Inicío</a></li>

						<li class="nav-item"><a class="nav-link" href="services.html">Quem
								Somos</a></li>

						<li class="nav-item"><a class="nav-link" href="services.html">Contato</a>
						</li>

						<li class="nav-item"><a class="nav-link btn-primary"
							style="color: #fff;" href="#">Acesso Restrito</a></li>

					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="container mt-5">
		<div class="row">

			<div class="col-lg-2"></div>

			<div class="card">
				<img src="images/back-login.jpg" class="card-img ml-0" alt="">


				<div class="row justify-content-center">
					<div class="card-img-overlay">
						<h2 class="card-title element-animate">Entrar</h2>
						<div class="col-md-4 mb-5 mt-5 element-animate">
							<form action="/CentroMedico/UsuarioServlet?act=login" method="post">
								<div class="row">
									<div class="col-md-12 form-group">
										<label for="login" style="color: black;">Usuário</label> <input
											type="text" name="usuario" id="usuario"
											class="form-control form-control-lg">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 form-group">
										<label for="pass" style="color: black;">Senha</label> <input
											type="password" name="senha" id="senha"
											class="form-control form-control-lg">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 form-group">
										<input type="submit" value="Entrar"
											class="btn btn-primary btn-lg btn-block">
									</div>
								</div>
							</form>
							<a href="acesso/inicio.jsp">Acesso sem Senha</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>


	<footer class="bg-light mt-5" role="contentinfo">
		<div class="container">
			<div class="row mb-5 element-animate">
				<div class="col-md-2 mb-2">
					<img class="img-responsive" src="images/5.png" alt="">
				</div>
			</div>

			<div class="row justify-content-center ">
				<div class="text-center element-animate">
					<img class="img-responsive" src="images/6.png" alt="">
				</div>
			</div>
		</div>
	</footer>
	<!-- END footer -->

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>
	
	
	<%
		if (session.getAttribute("err") != null && session.getAttribute("err").equals("naoExiste")) {
			
	%>
	<script type="text/javascript">
		swal("Erro!", "Usuário não localizado no sistema, verifique seu usuário e senha e tente novamente !", "error");
	</script>

	<%	
		}
	session.setAttribute("err", null);
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Register</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />

<link rel="stylesheet" href="css/Homepage.css" />
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
	integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
	integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.green.min.css"
	integrity="sha512-C8Movfk6DU/H5PzarG0+Dv9MA9IZzvmQpO/3cIlGIflmtY3vIud07myMu4M/NTPJl8jmZtt/4mC9bAioMZBBdA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Custom styles -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<link
	href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script
	src="http://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-login-img"
							style="background-image: url('https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&amp;amp;w=2070&amp;amp;auto=format&amp;amp;fit=crop&amp;amp;ixlib=rb-4.0.3&amp;amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); background-position: center; background-size: cover;">
						</div>
						<div class="col-lg-6">
							<div class="p-5">
								
								

								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">ĐĂNG KÝ</h1>
								</div>
								<form class="user" action="Login"
									method="post">
									<div class="form-group mb-2">
										<input type="text" class="form-control form-control-user"
											id="userName" name="txtun" placeholder="Họ">
									</div>
									<div class="form-group mb-2">
										<input type="text" class="form-control form-control-user"
											id="userName" name="txtun" placeholder="Tên">
											</div>
									<div class="form-group mb-2">
										<input type="text" class="form-control form-control-user"
											id="userName" name="txtun" placeholder="Tên đăng nhập">
									</div>
								
									<div class="form-group mb-2">
										<input type="password" class="form-control form-control-user"
											id="password" name="txtpass" placeholder="Mật khẩu">
									</div>
									<div class="form-group mb-2">
										<input type="password" class="form-control form-control-user"
											id="password" name="txtpasscomfirm" placeholder="Xác nhận Mật khẩu">
									</div>
									
									<input type="submit" class="btn btn-primary btn-user btn-block mb-2"
										placeholder="Đăng nhập">
								</form>
								<hr>
								<!-- <div class="text-center">
								<a class="small" href="forgot-password.html">Quên mật khẩu?</a>
							</div> -->
								<div class="text-center">
									<a class="small" href="ForgotPass">Forgor your password</a>
								</div>
								<div class="text-center">
									<a class="small" href="LoginController">Login</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</html>
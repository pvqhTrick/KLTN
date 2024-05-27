<%@page import="bean.Phong"%>
<%@page import="bo.KhachHangbo"%>
<%@page import="bean.KhachHangbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Sửa thông tin cá nhân</title>
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


<header>
	<!-- Navbar -->
	<%
	Phong P = (Phong) session.getAttribute("Phong");
	%>

	<nav
		class="navbar navbar-expand-lg navbar-light bg-light px-lg-3 py-lg-2 shadow-sm stick-top">
		<div class="container-fluid">
			<div class="col-lg-2 col-sm-4 col-4">
				<a href="Homepage" target="_blank" class="float-start">
					<img src="images/logo.jpg" height="100px" />
				</a>
			</div>
			<button class="navbar-toggler shadow-none" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active me-2"
						aria-current="ơage" href="Homepage">Home</a></li>
					<li class="nav-item"><a class="nav-link me-2"
						href="Rooms">Rooms</a></li>
					<li class="nav-item"><a class="nav-link me-2" href="#">Facilities</a>
					</li>
					<li class="nav-item"><a class="nav-link me-2" href="#">Contact
							us</a></li>
					<li class="nav-item"><a class="nav-link me-2" href="#">About</a>
					</li>
				</ul>
				<%
				KhachHangbean KH = (KhachHangbean) session.getAttribute("dn");
				if (KH == null) {
				%>
				<form class="d-flex" action="LoginController">

					<button class="btn btn-outline-success me-2" type="submit">Login</button>
					<button class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#LoginModal">Register</button>
				</form>
				<%
				} else {
				%><div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-expanded="false">
						<%=KH.getHoTen()%>
						<img src="avatar/avatarnull.jpg"
							style="width: 30px; /* Điều chỉnh chiều rộng */ height: 30px; /* Điều chỉnh chiều cao */ border-radius: 50%; /* Làm cho hình ảnh trở thành hình tròn */ margin-left: 10px; /* Khoảng cách từ hình ảnh đến nội dung text */ object-fit: cover; /* Đảm bảo hình ảnh vừa vặn trong kích thước đã định ">
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<li><a class="dropdown-item"
							href="UserProfile?Id=<%=KH.getIdKhachHang()%>">Thông
								tin cá nhân</a></li>
						<li><a class="dropdown-item" href="#">Ưa thích</a></li>
						<li><a class="dropdown-item" href="#">Lịch sử đặt phòng </a></li>
						<li><a class="dropdown-item" href="#">Đổi mật khẩu </a></li>
						<li><a class="dropdown-item" href="Logout">Đăng
								Xuất</a></li>
					</ul>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</nav>

	<!-- Navbar -->
	<div class="bg-primary mb-4">
		<div class="container py-4">
			<!-- Breadcrumb -->
			<nav class="d-flex mb-2">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Home</a> 
					<span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white-50">User</a> 
						<span class="text-white-50 mx-2">
						> </span> <a href="" class="text-white-50">User Profile</a> 
						<span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white-50">Confirm</a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Tieu de -->

</header>
<body>

	<section style="background-color: #eee;">
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
							alt="avatar" class="rounded-circle img-fluid"
							style="width: 150px;">
						<p class="text-muted mb-1">Khách hàng</p>

					</div>
				</div>
				<div class="card mb-4 mb-lg-0">
					<div class="card-body p-0">
						<ul class="list-group list-group-flush rounded-3">

							<li
								class="list-group-item d-flex justify-content-between align-items-center p-3">
								<i class="fab fa-twitter fa-lg" style="color: #55acee;">
									Twitter</i>
								<p class="mb-0">
									<a href="#">Chưa liên kết</a>
								</p>
							</li>

							<li
								class="list-group-item d-flex justify-content-between align-items-center p-3">
								<i class="fab fa-facebook-f fa-lg" style="color: #3b5998;">
									Facebook</i>
								<p class="mb-0">
									<a href="#">Chưa liên kết</a>
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>


			<div class="col-lg-8">
				<%
				KhachHangbean user = (KhachHangbean) session.getAttribute("user");
				%>
				<form action="SuaKhachHang?IdSua=<%=user.getIdKhachHang()%>">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Id</p>
								</div>
								<div class="col-sm-9" style="">
									<input type="text" name="IdSua"
										value="<%=user.getIdKhachHang()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Họ Tên</p>
								</div>
								<div class="col-sm-9">
									<input type="text" name="txtHoTen" value="<%=user.getHoTen()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Số điện thoại</p>
								</div>
								<div class="col-sm-9">
									<input type="text" name="txtSDT" value="<%=user.getSDT()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Giới tính</p>
								</div>
								<div class="col-sm-9">
									<select name="cbbGioiTinh" id="cbbGioiTinh">
										<option value="true">Nam</option>
										<option value="false">Nữ</option>
										<option value="null">Khác</option>
									</select>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">CCCD</p>
								</div>
								<div class="col-sm-9">
									<input type="text" name="txtCCCD" value="<%=user.getCCCD()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Email</p>
								</div>
								<div class="col-sm-9">
									<input type="text" name="txtEmail" value="<%=user.getEmail()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Địa Chỉ</p>
								</div>
								<div class="col-sm-9">
									<input type="text" name="txtDiaChi"
										value="<%=user.getDiaChi()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Tên đăng nhập</p>
								</div>
								<div class="col-sm-9">
									<input type="text" name="txtTenDangNhap"
										value="<%=user.getTendn()%>">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Password</p>
								</div>
								<div class="col-sm-9">
									<input type="password" name="txtPassword">
								</div>

							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Password Comfirm</p>
								</div>
								<div class="col-sm-9">
									<input type="password" name="txtPasswordcomfirm">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0"></p>
								</div>
								<div class="d-flex justify-content-center mb-2">
									<input type="submit" class="btn btn-primary"
										value="Sửa thông tin">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</section>
</body>
<!--Footer-->
<footer class="text-center text-lg-start text-muted bg-primary mt-3">
	<section class="">
		<div class="container text-center text-md-start pt-4 pb-4">
			<!-- Grid row -->
			<div class="row mt-3">
				<!-- Grid column -->
				<div class="col-12 col-lg-3 col-sm-12 mb-2"
					style="mix-blend-mode: multiply;">
					<!-- Content -->
					<img src="images/logo.jpg">
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Room</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="Rooms">About
								us</a></li>
						<li><a class="text-white-50" href="Rooms">Find
								room</a></li>
						<li><a class="text-white-50" href="Rooms">Categories</a></li>
						<li><a class="text-white-50" href="Rooms">Blogs</a></li>
					</ul>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">
						Information</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="#">Help center</a></li>
						<li><a class="text-white-50" href="#">Money refund</a></li>
						<li><a class="text-white-50" href="#">Shipping info</a></li>
						<li><a class="text-white-50" href="#">Refunds</a></li>
					</ul>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Support</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="#">Help center</a></li>
						<li><a class="text-white-50" href="#">Documents</a></li>
						<li><a class="text-white-50" href="#">Account restore</a></li>
						<li><a class="text-white-50" href="#">My orders</a></li>
					</ul>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-12 col-sm-12 col-lg-3">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Newsletter</h6>
					<p class="text-white">Stay in touch with latest updates about
						our products and offers</p>
					<div class="input-group mb-3">
						<input type="email" class="form-control border"
							placeholder="Email" aria-label="Email"
							aria-describedby="button-addon2" />
						<button class="btn btn-light border shadow-0" type="button"
							id="button-addon2" data-mdb-ripple-color="dark">Join</button>
					</div>
				</div>
				<!-- Grid column -->
			</div>
			<!-- Grid row -->
		</div>
	</section>
	<!-- Section: Links  -->

	<div class="">
		<div class="container">
			<div class="d-flex justify-content-between py-4 border-top">
				<!--- payment --->
				<div>
					<i class="fab fa-lg fa-cc-visa text-white"></i> <i
						class="fab fa-lg fa-cc-amex text-white"></i> <i
						class="fab fa-lg fa-cc-mastercard text-white"></i> <i
						class="fab fa-lg fa-cc-paypal text-white"></i>
				</div>
				<!--- payment --->
				<!-- Copyright -->
				<div class="text-center p-3 white">
					© 2020 Copyright: <a class="text-white"
						href="https://mdbootstrap.com/">Phan Văn Quốc Hùng</a>
				</div>
				<!-- Copyright -->
				<!--- language selector --->
				<div class="dropdown dropup">
					<a class="dropdown-toggle text-white" href="#" id="Dropdown"
						role="button" data-mdb-toggle="dropdown" aria-expanded="false">
						<i class="flag-united-kingdom flag m-0 me-1"></i>English
					</a>

					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="Dropdown">
						<li><a class="dropdown-item" href="#"><i
								class="flag-united-kingdom flag"></i>Top <i
								class="fa fa-check text-success ms-2"></i></a></li>

					</ul>
				</div>
				<!--- language selector --->
			</div>
		</div>
	</div>


</footer>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</html>
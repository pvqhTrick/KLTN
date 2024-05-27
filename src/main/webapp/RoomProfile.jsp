<%@page import="bean.Phong"%>
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
<title>Thông tin Phòng</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />


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
	<!-- Jumbotron -->
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light px-lg-3 py-lg-2 shadow-sm stick-top">
		<div class="container-fluid">
			<div class="col-lg-2 col-sm-4 col-4">
				<a href="Homepage" target="_blank" class="float-start"> <img
					src="images/logo.jpg" height="100px" />
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
						aria-current="ơage" href="Homepage">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link me-2" href="Rooms">Phòng</a></li>
					<li class="nav-item"><a class="nav-link me-2" href="#">Liên
							hệ</a></li>

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
							href="UserProfile?Id=<%=KH.getIdKhachHang()%>">Thông tin cá
								nhân</a></li>
						<li><a class="dropdown-item" href="#">Ưa thích</a></li>
						<li><a class="dropdown-item" href="#">Lịch sử đặt phòng </a></li>
						<li><a class="dropdown-item" href="#">Đổi mật khẩu </a></li>
						<li><a class="dropdown-item" href="Logout">Đăng Xuất</a></li>
					</ul>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</nav>

	<!-- Jumbotron -->

	<!-- Heading -->
	<div class="bg-primary mb-4">
		<div class="container py-4">
			<h3 class="text-white mt-2">Thông tin Phòng</h3>
			<!-- Breadcrumb -->
			<nav class="d-flex mb-2">
				<h6 class="mb-0">
					<a href="Rooms" class="text-white-50">Trang chủ </a> <span
						class="text-white-50 mx-2"> > </span> <a href="UserProfile"
						class="text-white-50">Phòng</a> <span class="text-white-50 mx-2">
						> </span> <a href="UserProfile" class="text-white-50">Thông tin phòng
					</a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->
</header>
<body>
	<%
	Phong room = (Phong) session.getAttribute("room");
	%>
	<section style="background-color: #eee;">
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">

						<img alt="" src="images/<%=room.getAnh()%>" style="width: 100%">
						<p class="text-muted mb-1">Phòng</p>
						<div class="d-flex justify-content-center mb-2">
							<a href="UpdateRoom?IdPhong=<%=room.getIdPhong()%>"><button
									type="submit" class="btn btn-succses">Cập nhập trạng
									thái</button> </a>
						</div>

						<a href="Logout"
							class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
							target="_blank"> <i class="fas fa-user-alt m-1 me-md-2"></i>
							Quay lai
						</a>

						<form action="uploadAnh" method="post" enctype="multipart/form-data">
							Chọn ảnh: <input type="file" name="file" />
							<input type="submit" value="Thay đổi ảnh" />
						</form>

					</div>
				</div>

			</div>

			<div class="col-lg-8">
				<form action="SuaPhong?IdSua=<%=room.getIdPhong()%>" method="post">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Tên phòng</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=room.getTenPhong()%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Loại Phòng</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=room.getIdLoaiPhong()%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Giá</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=room.getGia()%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Trạng thái</p>
								</div>
								<%
								if (room.getTrangThai()) {
								%>
								<div class="col-sm-9">
									<p class="text-muted mb-0">Đang hoạt động</p>
								</div>
								<%
								} else {
								%>
								<div class="col-sm-9">
									<p class="text-danger mb-0">Đang dừng cung cấp dịch vụ</p>
								</div>
								<%
								}
								%>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Số lần được đặt</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=room.getIdLoaiPhong()%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Mô tả</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=room.getIdLoaiPhong()%></p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Số phòng còn lại</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=room.getIdLoaiPhong()%></p>
								</div>
							</div>

							<hr>

							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0"></p>
								</div>
								<div class="d-flex justify-content-center mb-2">
									<button type="submit" class="btn btn-primary">Sửa
										thông tin</button>
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
					<h6 class="text-uppercase text-white fw-bold mb-2">Store</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="#">About us</a></li>
						<li><a class="text-white-50" href="#">Find store</a></li>
						<li><a class="text-white-50" href="#">Categories</a></li>
						<li><a class="text-white-50" href="#">Blogs</a></li>
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
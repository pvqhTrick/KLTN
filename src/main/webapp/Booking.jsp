<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.LoaiPhong"%>
<%@page import="bean.Phong"%>
<%@page import="bean.KhachHangbean"%>
<%@page import="bo.KhachHangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Booking room</title>
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
	LocalDate now = LocalDate.now();
	%>

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
					<li class="nav-item"><a class="nav-link me-2" href="#">Liên hệ</a></li>
					
				</ul>
				<%
				KhachHangbean KH = (KhachHangbean) session.getAttribute("dn");
				if (KH == null) {
				%>
				<form class="d-flex" action="LoginController">

					<button class="btn btn-outline-success me-2" type="submit">Đăng nhập</button>
					<button class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#LoginModal">Đăng kí</button>
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

	<!-- Navbar -->
	<div class="bg-primary mb-4">
		<div class="container py-4">
			<!-- Breadcrumb -->
			<nav class="d-flex mb-2">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Trang chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white-50">Phòng</a> <span class="text-white-50 mx-2">
						> </span> <a href="" class="text-white-50"><%=P.getTenPhong()%></a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white-50">Xác nhận đặt phòng</a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Tieu de -->

</header>

<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->

		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<!-- Main content -->
						<div class="invoice p-3 mb-3">
							<!-- title row -->
							<div class="row">
								<div class="col-12">
									<h4>
										<i class="fas fa-globe"></i> Phiếu thanh toán <small
											class="float-right" style="float: right">Ngày: <%=now%></small>
									</h4>
								</div>
								<!-- /.col -->
							</div>
							<!-- info row -->
							<div class="row invoice-info">
								<div class="col-sm-3 invoice-col">
									Lễ tân:
									<address>
										<strong>Phan Văn Quốc Hùng(lễ tân)</strong><br> <br>
										43 Lê Lợi, Thành phố Huế, Thừa Thiên Huế<br> SĐT: (+84)
										923-232-589<br> Email: info@century.com
									</address>
								</div>
								<!-- /.col -->

								<div class="col-sm-3 invoice-col">
									Thông tin khách hàng:<br>
									<address>
										<strong>Tên Khách Hàng: <%=KH.getHoTen()%></strong><br> <br>Email:
										<%=KH.getEmail()%><br> Số điện thoại:
										<%=KH.getSDT()%><br> Căn Cước Công Dân:
										<%=KH.getCCCD()%><br>

									</address>

								</div>
								<!-- /.col -->
								<div class="col-sm-3 invoice-col">
									<b>Mã Đặt phòng #007612</b><br> <br> <b>Mã Phòng:
										<%=P.getIdPhong()%></b> <br> <b>Tên Phòng: <%=P.getTenPhong()%></b>
									<br> <b>Ngày Check-in: </b>
									<%=(Date) session.getAttribute("datein")%>
									<br> <b>Ngày Check-out: </b>

									<%=session.getAttribute("dateout")%><br> <b>AccountID:</b>
									<%=KH.getIdKhachHang()%>
								</div>
								<div class="col-sm-3 invoice-col">
									<img alt="" src="images/<%=P.getAnh()%>"
										style="height: 200px; width: auto;">
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

							<!-- Table row -->
							<div class="row">
								<div class="col-12 table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Số ngày ở lại</th>
												<th>Tên Phòng</th>
												<th>Số giường</th>
												<th>Đánh giá</th>
												<th>Ngày</th>
												<th>Giá thành</th>
											</tr>
										</thead>
										<tbody>
											<%
											Long day = (Long) session.getAttribute("SoNgay");
											LoaiPhong LoaiPhong = (LoaiPhong) session.getAttribute("LoaiPhong");
											%>
											<tr>
												<td><%=session.getAttribute("SoNgay")%> Ngày <%=session.getAttribute("SoNgay")%>
													Đêm</td>
												<td><%=P.getTenPhong()%></td>
												<td>Có <%=LoaiPhong.getSoGiuongDoi()%> giường đơn, <%=LoaiPhong.getSoGiuongDoi()%>
													giường đôi
												</td>
												<td><span
													class="badge rounded-pill bg-light text-dark text-wrap">
														<%
														int sosao = P.getRatingId();
														for (int i = 2; i <= 10; i += 2)
															if (i <= sosao) {
														%> <i class="fa fa-star"></i> <%
 } else if (i - 1 == sosao) {
 %> <i class="fas fa-star-half-alt"></i> <%
 } else {
 %> <i class="far fa-star"></i> <%
 }
 %>

												</span></td>

												<td><%=session.getAttribute("datein")%></td>
												<td>$<%=P.getGia()%></td>
											</tr>

										</tbody>
									</table>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

							<div class="row">
								<!-- accepted payments column -->
								<div class="col-6">
									<p class="lead">Chấp nhận thanh toán:</p>
									<img src="images/visa.png" alt="Visa"> <img
										src="images/mastercard.png" alt="Mastercard"> <img
										src="images/american-express.png" alt="American Express">
									<img src="images/paypal2.png" alt="Paypal">

									<p class="text-muted well well-sm shadow-none"
										style="margin-top: 10px;">Ngoài ra còn có thể thanh toán
										tiền mặt tại quầy lễ tân</p>
								</div>
								<!-- /.col -->
								<div class="col-6">
									<p class="lead">
										Ngày thanh toán:
										<%=now%></p>

									<div class="table-responsive">
										<table class="table">
											<tr>
												<th style="width: 50%">Chi phi một ngày:</th>
												<td>$<%=P.getGia()%></td>
											</tr>
											<%
											if (session.getAttribute("KH") != null) {
											%>
											<tr>
												<th>Được giảm (10%)</th>
												<td style="color: green">$<%=(float) session.getAttribute("KH")%></td>
											</tr>
											
											<%
											}else{
											%>
											<tr>
												<th>Được giảm (0%)</th>
												<td style="color: green">$0</td>
											</tr>
											
											<%} %>
											<tr>
												<th>Tổng thanh toán:</th>
												<td><strong>$<%=(float)session.getAttribute("total")%></strong></td>
												
											</tr>

										</table>
									</div>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

							<!-- this row will not appear when printing -->
							<div class="row no-print">
								<div class="col-12">
									<a href="Homepage">
									<button type="button" class="btn btn-danger">
										<i class="fa-solid fa-ban"></i> Hủy
									</button>
</a>
									<button type="button" class="btn btn-success"
										data-bs-toggle="modal" data-bs-target="#myModal"
										style="float: right">
										<i class="fa-solid fa-bed"></i>Thanh Toán
									</button>
									<button type="button" class="btn btn-primary float-right"
										style="margin-right: 5px; float: right">
										<i class="fas fa-download"></i> Xuất PDF
									</button>
								</div>
							</div>
						</div>
						<!-- /.invoice -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
</body>

<div class="modal fade" id="myModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Thanh Toán Qua
					Tín dụng Momo</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- Form để nhập thông tin -->
				<style>
.momo {
	width: 100%
}
</style>
				<img alt="" src="images/momo.png" class="momo">
			</div>
		</div>
	</div>
</div>
<footer class="text-center text-lg-start text-muted bg-primary mt-3">
	<section class="">
		<div class="container text-center text-md-start pt-4 pb-4">
			<!-- Grid row -->
			<div class="row mt-3">
				<!-- Grid column -->
				<div class="col-12 col-lg-3 col-sm-12 mb-2"
					style="mix-blend-mode: multiply;">
					<!-- Content -->
					<style>
.momo {
	width: 100%;
}
</style>
					<img src="images/logo.jpg" class="momo" style="width: 100%;">
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-6 col-sm-4 col-lg-2">
					<!-- Links -->
					<h6 class="text-uppercase text-white fw-bold mb-2">Room</h6>
					<ul class="list-unstyled mb-4">
						<li><a class="text-white-50" href="Phong">About us</a></li>
						<li><a class="text-white-50" href="Phong">Find room</a></li>
						<li><a class="text-white-50" href="Phong">Categories</a></li>
						<li><a class="text-white-50" href="Phong">Blogs</a></li>
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

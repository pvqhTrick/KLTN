<%@page import="bean.KhachHangbean"%>
<%@page import="bean.LoaiPhong"%>
<%@page import="bean.Phong"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Danh sách phòng</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.min.css" />
<!-- Custom styles -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-3HhcQ/0eSf4lt2MEU0X5ytdeUnrfbwjcdO6oKr+0Pv9hzYL65oUeQoq6R8daBX+eG1VwM56OEQbCUBlGq4H9x6g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
</head>


<body>
	<!--Main Navigation-->
	<header>
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
							aria-current="ơage" href="Homepage">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link me-2"
							href="Rooms">Phòng</a></li>
						<li class="nav-item"><a class="nav-link me-2" href="#">Liên hệ</a>
						</li>
						
					</ul>
					<%
					KhachHangbean KH = (KhachHangbean) session.getAttribute("dn");
					if (KH == null) {
					%>
					<form class="d-flex" action="LoginController">

						<button class="btn btn-outline-success me-2" type="submit">Đăng nhập</button>
						<button class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#LoginModal">Đăng ký</button>
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
							<li><a class="dropdown-item" href="WishList">Ưa thích</a></li>
							<li><a class="dropdown-item" href="#">Lịch sử đặt phòng
							</a></li>
							<li><a class="dropdown-item"
								href="SuaKhachHang?IdSua=<%=KH.getIdKhachHang()%>">Đổi mật
									khẩu </a></li>
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


		<!-- Heading -->
		<div class="bg-primary mb-4">
			<div class="container py-4">
				<!-- Breadcrumb -->
				<nav class="d-flex mb-2">
					<h6 class="mb-0">
						<a href="Homepage" class="text-white-50">Trang chủ</a> <span
							class="text-white-50 mx-2"> > </span> <a href="Rooms"
							class="text-white-50">Đặt phòng</a>
					</h6>
				</nav>
				<!-- Breadcrumb -->
			</div>
		</div>
		<!-- Heading -->
	</header>

	<!-- sidebar + content -->
	<section class="main">
		<div class="container">
			<div class="row">
				<!-- sidebar -->
				<div class="col-lg-3">
					<!-- Toggle button -->
					<button class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
						type="button" data-mdb-toggle="collapse"
						data-mdb-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span>Show filter</span>
					</button>
					<!-- Collapsible wrapper -->
					<div class="collapse card d-lg-block mb-5"
						id="navbarSupportedContent">
						<div class="accordion" id="accordionPanelsStayOpenExample">

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="false" aria-controls="collapseTwo">Tìm
										kiếm</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div id="panelsStayOpen-collapseFive"
										class="accordion-collapse collapse show"
										aria-labelledby="headingOne">
										<div class="content-wrapper">
											<!-- Main content -->
											<section class="content">
												<div class="container-fluid">
													<form action="Phong" method="post">
														<div class="row">
															<div class="col-md-10 offset-md-1">
																<div class="form-group">
																	<div class="input-group input-group-lg">
																		<input type="search"
																			class="form-control form-control-lg"
																			placeholder="Type your keywords here" id="txtTimKiem"
																			name="txtTimKiem">
																		<div class="input-group-append">
																			<button type="submit" class="btn btn-lg btn-default">
																				<i class="fa fa-search"></i>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</form>
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>



							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed text-dark bg-light"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#collapseTwo" aria-expanded="false"
										aria-controls="collapseTwo">Loại Phòng</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse show"
									aria-labelledby="headingTwo"
									data-bs-parent="#accordionExample1">
									<div class="accordion-body">
										<div>
											<!-- Checked checkbox -->
											<%
											ArrayList<LoaiPhong> dsloai = (ArrayList<LoaiPhong>) session.getAttribute("dsloai");
											for (LoaiPhong item : dsloai) {
											%>

											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													value="<%item.getIdLoaiPhong();%>" id="flexCheckChecked1"
													name="LoaiPhong" /> <label class="form-check-label"
													for="flexCheckChecked1"><a
													href="Phong?lp=<%item.getIdLoaiPhong();%>"><%=item.getLoaiPhong()%></a></label>
											</div>

											<%
											}
											%>
										</div>
									</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed text-dark bg-light"
										type="button" data-bs-toggle="collapse"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">Giá</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingTwo"
									data-bs-parent="#accordionExample2">

									<div class="accordion-body">
										<div class="range">
											<input type="range" class="form-range" id="customRange1" />
										</div>
										<div class="row mb-3">
											<div class="col-6">
												<p class="mb-0">Min</p>
												<div class="form-outline">
													<input type="number" id="typeNumber" class="form-control" />
													<label class="form-label" for="typeNumber">$0</label>
												</div>
											</div>
											<div class="col-6">
												<p class="mb-0">Max</p>
												<div class="form-outline">
													<input type="number" id="typeNumber" class="form-control" />
													<label class="form-label" for="typeNumber">$1,0000</label>
												</div>
											</div>
										</div>
										<button type="button"
											class="btn btn-white w-100 border border-secondary">apply</button>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingFour">
									<button class="accordion-button collapsed text-dark bg-light"
										type="button" data-bs-toggle="collapse"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseThree">Đánh
										giá</button>
								</h2>
								<div id="collapseFour" class="accordion-collapse collapse"
									aria-labelledby="headingFour"
									data-bs-parent="#accordionExample4">

									<div class="accordion-body">
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i> <i
												class="fas fa-star text-warning"></i>
											</label>
										</div>
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> 
												<i class="fas fa-star text-warning"></i>
												<i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i> <i
												class="fas fa-star text-secondary"></i>
											</label>
										</div>
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-secondary"></i> <i
												class="fas fa-star text-secondary"></i>
											</label>
										</div>
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-secondary"></i><i
												class="fas fa-star text-secondary"></i> <i
												class="fas fa-star text-secondary"></i>
											</label>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
				<!-- sidebar -->
				<!-- content -->
				<div class="col-lg-9">
					<%
					ArrayList<Phong> ds = (ArrayList<Phong>) session.getAttribute("dsPhong");
					%>
					<header
						class="d-sm-flex align-items-center border-bottom mb-4 pb-3">
						<strong class="d-block py-2">Hiện tại còn <%=ds.size()%>
							Phòng trống
						</strong>
						<form action = "Rooms">
						<div class="ms-auto">
							<select class="form-select d-inline-block w-auto border pt-1" name = "selectOptions" >
								<option value="0">Tất cả</option>
								<option value="1">Phòng Trống</option>
								<option value="2">Đánh giá cao</option>
								<option value="3">Vip</option>
							</select>
							<div class="btn-group shadow-0 border">
								<a href="#" class="btn btn-light" title="List view"> <i
									class="fa fa-bars fa-lg"></i>
								</a> <a href="#" class="btn btn-light active" title="Grid view">
									<i class="fa fa-th fa-lg"></i>
								</a>
							</div>
						</div>
						</form>
					</header>
					<!-- Phong -->
					<%
					for (Phong item : ds) {
					%>
					<div class="row justify-content-center mb-3">
						<div class="col-md-12">
							<div class="card shadow-0 border rounded-3">
								<div class="card-body">
									<div class="row g-0">
										<div class="col-xl-3 col-md-4 d-flex justify-content-center">
											<div
												class="bg-image hover-zoom ripple rounded ripple-surface me-md-3 mb-3 mb-md-0">
												<img src="images/<%=item.getAnh()%>" class="w-100"
													style="aspect-ratio: 1;" /> <a href="#!">
													<div class="hover-overlay">
														<div class="mask"
															style="background-color: rgba(253, 253, 253, 0.15);"></div>
													</div>
												</a>
											</div>
										</div>
										<div class="col-xl-6 col-md-5 col-sm-7">
											<h5>
												<a
													href="RoomDetail?IdPhong=<%=item.getIdPhong()%>"><%=item.getTenPhong()%></a>
											</h5>
											<!-- Danh gia sao -->
											<div class="d-flex flex-row">
												<div class="text-warning mb-1 me-2">
													<%
													int sosao = item.getRatingId();
													for (int i = 2; i <= 10; i += 2)
														if (i <= sosao) {
													%>
													<i class="fa fa-star"></i>
													<%
													} else if (i - 1 == sosao) {
													%>
													<i class="fas fa-star-half-alt"></i>
													<%
													} else {
													%>
													<i class="far fa-star"></i>
													<%
													}
													%>

												</div>
												<span class="text-muted"><%=item.getSoLanDuocDat()%>
													Số lần được đặt</span>
											</div>

											<p class="text mb-4 mb-md-0">
												<%=item.getMoTa()%>
											</p>
										</div>


										<div class="col-xl-3 col-md-3 col-sm-5">
											<h3>Giá một đêm:</h3>
											<div class="d-flex flex-row align-items-center mb-1">
												<h4 class="mb-1 me-1">
													$<%=item.getGia()%></h4>
												<span class="text-danger"><s>$<%=item.getGia()%></s></span>
											</div>
											<%
											if (item.getTrangThai()) {
											%>
											<h6 class="text-success">Còn phòng</h6>
											<%
											} else {
											%>
											<h6 class="text-danger">Hết phòng</h6>
											<%
											}
											%>
						
											<style>
											.wishlistSelected{
											color:red;
											}
											</style>
											<div class="mt-4">
												<a href = "RoomDetail?IdPhong=<%=item.getIdPhong()%>">
												<button class="btn btn-primary shadow-0" type="button">
													<i class="fa-solid fa-bed"> </i> Đặt phòng
												</button></a>
												<%ArrayList<String> wishlist = (ArrayList<String>)session.getAttribute("wishlist");
												boolean isWishlist = wishlist != null && wishlist.contains(String.valueOf(item.getIdPhong()));
												%>
												<a href="ThemWishlist?IdPhong=<%=item.getIdPhong()%>"
													class="btn btn-light border px-2 pt-2 icon-hover <%=isWishlist?"wishlistSelected":""%>"><i
													class="fas fa-heart fa-lg px-1"></i></a>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<!-- Phong -->
					<hr />

					<!-- Pagination -->
					<nav aria-label="Page navigation example"
						class="d-flex justify-content-center mt-3">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
					<!-- Pagination -->
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
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

	<!-- Footer -->
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="js/script.js"></script>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// Đóng accordion khi trang web được tải
		$('#panelsStayOpen-collapseFive').collapse('show');

		// Mở accordion khi nhấp vào nút "Tìm kiếm"
		$('.btn-default').click(function() {
			$('#panelsStayOpen-collapseFive').collapse('hide');
		});
	});
</script>
</html>


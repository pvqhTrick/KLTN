<%@page import="bo.KhachHangbo"%>
<%@page import="bo.KhuyenMaiBo"%>
<%@page import="bean.Ratingbean"%>
<%@page import="bean.LoaiPhong"%>
<%@page import="bean.KhachHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Phong"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Thông tin phòng</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- Slick slider -->
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

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="css/RoomDetail.css" />

<!-- Custom styles -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-3HhcQ/0eSf4lt2MEU0X5ytdeUnrfbwjcdO6oKr+0Pv9hzYL65oUeQoq6R8daBX+eG1VwM56OEQbCUBlGq4H9x6g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="http://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
</head>

<header>
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


	<br>
	<%
	Phong item = (Phong) session.getAttribute("RoomBook");
	%>
	<div class="bg-primary mb-4 mt-2">
		<div class="container py-4">
			<nav class="d-flex mb-2">
				<h6 class="mb-0">
					<a href="Homepage" class="text-white-50">Trang chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href="Rooms"
						class="text-white-50">Phòng</a> <span class="text-white-50 mx-2">
						> </span> <a href="RoomList" class="text-white-50"><%=item.getTenPhong()%></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Tieu de -->
</header>
<!--Main Navigation-->

<!--Main layout-->
	<main class="mt-4 mb-5">
		<div class="container">
			<!--Grid row-->
			<div class="row">
				<!--Grid column-->
				<div class="booking col-md-4 mb-4">
					<!--Section: Sidebar-->
					<section class="booking" style="top: 80px;">
						<!--Section: Ad-->
						<!-- Rooms -->
	
						<section class="rooms">
							<div class="container top">
								<div class="content mtop">
									<div class="">
										<div class="items">
	
											<div class="text">
												<a href="" class="text-decoration-none">
													<h2><%=item.getTenPhong()%></h2>
												</a>
												<div class="TrangThai">
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
												</div>
												<div class="ratting mb-4">
													<h6 class="mb-1">Đánh giá</h6>
	
													<span
														class="badge rounded-pill bg-light text-dark text-wrap">
														<%
														int sosao = item.getRatingId();
														for (int i = 2; i <= 10; i += 2)
															if (i <= sosao) {
														%> <i class="fa fa-star"></i> <%
	 } else if (i - 1 == sosao) {
	 %> <i class="fas fa-star-half-alt"></i> <%
	 } else {
	 %> <i class="far fa-star"></i> <%
	 }
	 %>
	
													</span> <span class="text-muted"><%=item.getSoLanDuocDat()%>
														Số lần được đặt</span>
	
												</div>
												<%
												ArrayList<LoaiPhong> dsLoai = (ArrayList<LoaiPhong>) session.getAttribute("dsLoai");
												%>
												<div class="feather mb-4">
													<h6 class="mb-1">Mô tả</h6>
													<div class="feather mb-4">
	
														<%
														for (LoaiPhong i : dsLoai) {
															if (i.getIdLoaiPhong() == item.getIdLoaiPhong())
																for (String TienNghi : i.getTienNghi()) {
														%>
														<span
															class="badge rounded-pill bg-light text-dark text-wrap">
															<%=TienNghi%>
														</span>
														<%
														}
														}
														%>
													</div>
												</div>
												<div class="facilities mb-4">
													<h6 class="mb-1">Tiện nghi</h6>
													<span
														class="badge rounded-pill bg-light text-dark text-wrap">
														Free wifi </span> <span
														class="badge rounded-pill bg-light text-dark text-wrap">
														Tivi chất lượng cao </span> <span
														class="badge rounded-pill bg-light text-dark text-wrap">
														Tủ lạnh + Free nước lọc </span> <span
														class="badge rounded-pill bg-light text-dark text-wrap">
														Điều hòa và Máy sưởi </span>
												</div>
												<style>
	.primary-btn {
		padding: 15px 40px;
		background: cyan;
		font-weight: bold;
		color: white;
		border-radius: 1rem;
		display: block;
		margin: 0 auto;
		text-align: center;
	}
	
	.button h3 {
		font-size: 30px;
		line-height: 20px;
		margin-left: 20px;
		font-weight: 500;
		color: cyan;
	}
	
	.button h3 span {
		font-size: 15px;
		font-weight: 400;
		color: black;
	}
	}
	</style>
												<div class="button" style="display: flex;">
													<h3><%=item.getGia()%>$<span>Cho một đêm</span>
													</h3>
													<button type="button" class="btn btn-primary"
														data-bs-toggle="modal" data-bs-target="#myModal">
														<i class="fa-solid fa-bed"></i> Đặt Phòng
													</button>
	
	
												</div>
	
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!--Section: Ad-->
	
						<!--Section: Video-->
						<section class="text-center">
							<h5 class="mb-4">Reviewer</h5>
	
							<div
								class="embed-responsive embed-responsive-16by9 shadow-4-strong">
								<iframe class="embed-responsive-item rounded"
									src="https://www.youtube.com/embed/_VB4y89Ts4E/" allowfullscreen></iframe>
							</div>
						</section>
						<!--Section: Video-->
					</section>
					<!--Section: Sidebar-->
				</div>
				<div class="col-md-8 mb-4">
					<!--Slick slider-->
					<style>
	.gallery img {
		aspect-ratio: 1;
	}
	</style>
	
					<section class="gallery">
						<div class="image">
							<img alt="" src="images/<%=item.getAnh()%>"
								style="height: auto; max-width: 100%; border: 2px solid #ddd; / * Thêm viền */ border-radius : 8px; /* Bo tròn góc */ transition: transform 0.3s ease-in-out;
		/* Hiệu ứng trượt */ } .image img :hover { transform: scale(1.05);
		/* Phóng to khi di chuột qua */ box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
						</div>
						<div class="container-img top">
							<div class="slide-gallery owl-carousel owl-theme ">
								<div class="View">
									<div class="img">
										<img id="View" alt="" src="images/Main/view1.jpg">
									</div>
	
								</div>
								<div class="View">
									<div class="img">
										<img id="View" alt="" src="images/Main/view2.jpg">
									</div>
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/view3.jpg">
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/pool1.jpg">
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/pool2.jpg">
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/pool3.jpg">
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/dinner1.jpg">
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/dinner2.jpg">
								</div>
								<div class="View">
									<img id="View" alt="" src="images/Main/Decor1.jpg">
								</div>
							</div>
						</div>
					</section>
					<script
						src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
						integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
						crossorigin="anonymous" referrerpolicy="no-referrer"></script>
					<script
						src="http://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
						integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
						crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
					<script type="text/javascript">
						$('.slide-gallery').owlCarousel({
							loop : true,
							margin : 0,
							nav : true,
							dots : false,
							responsive : {
								0 : {
									items : 1
								},
								600 : {
									items : 4,
								},
								1000 : {
									items : 5
								}
							}
						})
					</script>
	
	
					<section class="about top">
						<div class="container flex">
							<div class="left">
								<p>Toạ lạt tại 43 Lê Lợi, Tp Huế, Thừa Thiên Huế. Khách sạn
									nằm ngày trong lòng thành phố, giúp các bạn có thể đến với các
									điểm tham quan di tích và lựa chọn ăn uống thích hợp.</p>
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3826.098307069636!2d107.59088907659651!3d16.470559128566343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3141a14a308cc41b%3A0x77f1b53690b10888!2sCentury%20Riverside%20Hotel%20Hue!5e0!3m2!1svi!2s!4v1711624070644!5m2!1svi!2s"
									width="100%" height="auto"
									style="border: 0; justify-content: center;" allowfullscreen=""
									loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
								<br>
								<p class="note note-light">Tọa lạc tại một vị trí trung tâm
									trên bờ sông Hương, Century Riverside Hue nằm cách Ga Tàu Huế 2
									km. Sân bay Quốc tế Phú Bài cách đó 20 phút lái xe.</p>
								<p>Các phòng nghỉ trang nhã ở đây mang chủ đề Việt Nam và có
									ban công, máy lạnh cũng như quạt máy. Ngoài ra còn đi kèm
									minibar và máy pha trà/cà phê.</p>
								<p>Khách có thể rèn luyện sức khỏe tại trung tâm thể dục hoặc
									chơi tennis. Dịch vụ mát-xa được cung cấp tại spa, nơi có bồn
									tắm nước nóng và phòng xông hơi khô. Khách sạn còn có dịch vụ
									cho thuê xe hơi và xe đạp.</p>
								<p>Ẩm thực châu Á, Việt Nam và phương Tây được phục vụ tại
									các nhà hàng Terrace Restaurant và Riverside Restaurant. Trong
									khoảng cách đi bộ từ khách sạn du khách cũng có thể tìm thấy
									nhiều quán cafe và nhà hàng.</p>
								<p>
									Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm <strong>9,2</strong>
									cho kỳ nghỉ dành cho 2 người.
								</p>
								<style>
	.facilities i {
		font-size: 20px;
		color: #8fc142;
		transition: 0.5s;
	}
	</style>
								<div class="facilities mb-4">
									<p>
										<strong>Các tiện nghi được ưa chuộng nhất:</strong>
									</p>
									<span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-person-swimming me-2"></i>Hồ bơi ngoài
										trời
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-wifi me-2"></i>Wifi miễn phí
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-car-side me-2"></i>Xe đưa đón từ sân bay
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-people-group me-2"></i>Phòng gia đình
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-ban-smoking me-2"></i>Phòng không hút
										thuốc
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-dumbbell me-2"></i>Gym
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-spa me-2"></i>Spa
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-square-parking me-2"></i>Nơi đỗ xe miễn
										phí
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-champagne-glasses me-2"></i>Quầy bar
									</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
										<i class="fa-solid fa-utensils me-2"></i>Nhà hàng
									</span>
								</div>
	
							</div>
							<div class="right">
								<section class="" style="top: 80px;">
									<div class="flex-center">
										<div class="placefuns mb-4">
											<p>
												<i class="fa-solid fa-person-running"></i> <strong>
													Xung quanh có gì?</strong>
											</p>
											<span class="badge rounded-pill bg-light text-dark text-wrap">
												February 3 Park <strong> 300m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Công Viên 3/2 <strong> 350m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Trung tâm thương mại Vincom <strong> 400m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Thương Bạc <strong> 500m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Siêu Thị GO <strong> 520m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Cầu Tràng Tiền <strong> 550m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Tứ Tượng Park <strong> 600m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Bùng Binh Hùng Vương <strong> 800m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Công Viện Kim Đồng <strong> 900m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Le Loi Park <strong> 950m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Sân Hàm Nghi <strong> 1,1km</strong>
											</span>
										</div>
										<div class="restarants mb-4">
											<p>
												<i class="fa-solid fa-utensils"></i> <strong> Nhà
													hàng</strong>
											</p>
											<span class="badge rounded-pill bg-light text-dark text-wrap">
												Fullhouse <strong> 0m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Cơm niêu <strong> 50m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Phố tây <strong> 50m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Cơm hến Nguyễn Sinh Cung <strong> 100m</strong>
											</span>
										</div>
										<div class="placefun mb-4">
											<p>
												<i class="fa-solid fa-mug-hot"></i> <strong> Coffee</strong>
											</p>
											<span class="badge rounded-pill bg-light text-dark text-wrap">
												Coffee/Bar Century <strong> 0m</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Coffee/Bar T'house Coffee <strong> 50m</strong>
											</span>
										</div>
										<div class="relics mb-4">
											<p>
												<i class="fa-solid fa-earth-americas"></i> <strong>
													Di tích lịch sử</strong>
											</p>
											<span class="badge rounded-pill bg-light text-dark text-wrap">
												Bảo tàng Museum of Royal Antiquities <strong> 1,3km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Cung An Định <strong> 1,6km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Tử Cấm Thành <strong> 1,8km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Ngũ Phụng <strong> 1,8km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Bảo tàng Hồ Chí Minh <strong> 2km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Lăng Tự Đức <strong> 5km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Cầu Ngói Thanh Toàn <strong> 5km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Minh Mang Tomb <strong> 9km</strong>
											</span>
										</div>
										<div class="car mb-4">
											<p>
												<i class="fa-solid fa-train"></i> <strong> Phương
													tiện công cộng</strong>
											</p>
	
											<span class="badge rounded-pill bg-light text-dark text-wrap">
												Ga Tàu Huế <strong> 2,3km</strong>
											</span>
	
										</div>
										<div class="airport mb-4">
											<p>
												<i class="fa-solid fa-plane-departure"> </i><strong>
													Sân bay gần nhất</strong>
											</p>
											<span class="badge rounded-pill bg-light text-dark text-wrap">
												Sân bay quốc tế Phú Bài <strong> 12km</strong>
											</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
												Sân bay Quốc tế Đà Nẵng <strong> 50m</strong>
											</span>
										</div>
									</div>
	
								</section>
								<!--Section: Sidebar-->
							</div>
						</div>
					</section>
	
					<section>
						<p class="note note-light">
							<strong> Quy tắc chung</strong>
	
						</p>
						<p>Century Hotel nhận yêu cầu đặc biệt - gửi yêu cầu trong bước
							kế tiếp!</p>
	
					</section>
	
					<!--Section: Share buttons-->
					<section class="text-center border-top border-bottom py-4 mb-4">
						<p>
							<strong>Chia sẻ:</strong>
						</p>
	
						<button type="button" class="btn btn-primary me-1"
							data-mdb-ripple-init style="background-color: #3b5998;">
							<i class="fab fa-facebook-f"></i>
						</button>
						<button type="button" class="btn btn-primary me-1"
							data-mdb-ripple-init style="background-color: #55acee;">
							<i class="fab fa-twitter"></i>
						</button>
						<button type="button" class="btn btn-primary me-1"
							data-mdb-ripple-init style="background-color: #0082ca;">
							<i class="fab fa-linkedin"></i>
						</button>
						<button type="button" class="btn btn-primary me-1"
							data-mdb-ripple-init>
							<i class="fas fa-comments me-2"></i>Thêm bình luận
						</button>
					</section>
					<!--Section: Share buttons-->
	
	
					<!--Section: Comments-->
					<%
					ArrayList<Ratingbean> dsBL = (ArrayList<Ratingbean>) session.getAttribute("dsBL");
					if(dsBL!=null){
					%>
					
					<section class="border-bottom mb-3">
						<p class="text-center">
							<strong>Comments: <%
							dsBL.size();
							%></strong>
						</p>
						<%
						for (Ratingbean bl : dsBL) {
						%>
						<!-- Comment -->
						<div class="row mb-4">
							<div class="col-2">
								<img src="avatar/avatarnull.jpg"
									class="img-fluid shadow-1-strong rounded" alt="" />
							</div>
	
							<div class="col-10">
								<p class="mb-2">
									<%
									KhachHangbo khbo = new KhachHangbo();
									KhachHangbean moi = khbo.xemChiTiet(bl.getIdKhachHang());
									%>
									<strong><%=moi.getHoTen()%></strong>
								</p>
								<span class="badge rounded-pill bg-light text-dark text-wrap">
									<%
									float sao = bl.getStars();
									for (int i = 2; i <= 10; i += 2)
										if (i <= sao) {
									%> <i class="fa fa-star"></i> <%
	 } else if (i - 1 == sosao) {
	 %> <i class="fas fa-star-half-alt"></i> <%
	 } else {
	 %> <i class="far fa-star"></i> <%
	 }
	 %>
								</span>
								<p>
									<%=bl.getBinhLuan()%>
								</p>
							</div>
						</div>
						<%
						}
						%>
						<!-- Comment -->
						<div class="row mb-4">
							<div class="col-2">
								<img
									src="https://mdbootstrap.com/img/Photos/Avatars/img%20(25).jpg"
									class="img-fluid shadow-1-strong rounded" alt="" />
							</div>
	
							<div class="col-10">
								<p class="mb-2">
									<strong>Valeria Groove</strong>
								</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Distinctio est ab iure inventore dolorum consectetur? Molestiae
									aperiam atque quasi consequatur aut? Repellendus alias dolor ad
									nam, soluta distinctio quis accusantium!</p>
							</div>
						</div>
	
						<!-- Comment -->
						<div class="row mb-4">
							<div class="col-2">
								<img
									src="https://mdbootstrap.com/img/Photos/Avatars/img%20(26).jpg"
									class="img-fluid shadow-1-strong rounded" alt="" />
							</div>
	
							<div class="col-10">
								<p class="mb-2">
									<strong>Antonia Velez</strong>
								</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Distinctio est ab iure inventore dolorum consectetur? Molestiae
									aperiam atque quasi consequatur aut? Repellendus alias dolor ad
									nam, soluta distinctio quis accusantium!</p>
							</div>
						</div>
					</section>
					<!--Section: Comments-->
	
					<%}else{ %>
	<section class="border-bottom mb-3">
						<p class="text-center">
							<strong>Comments: </strong>
						</p>
						
						<!-- Comment -->
						<div class="row mb-4">
			
							<div class="col-10">
								<p class="mb-2">
									<h1>Không có bình luận</h1>
								</p>
								
							</div>
						</div>

						
					</section>
					<%} %>
					<!--Section: Reply-->
					<section>
						<p class="text-center">
							<strong>Leave a reply</strong>
						</p>
	
	
						<!-- Name input -->
						<%
						if (session.getAttribute("dn") == null) {
						%>
						<div class="form-outline mb-4" data-mdb-input-init>
							<h1>Đang nhập để bình luận</h1>
							<form class="d-flex" action="LoginController">
	
								<button class="btn btn-outline-success me-2" type="submit">Đăng nhập</button>
								<button class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#LoginModal">Đăng ký</button>
							</form>
						</div>
						<%
						} else {
						%>
						<form action="AddBinhLuan?Id=<%=KH.getIdKhachHang()%>"
							method="post">
							<div class="form-outline mb-4" data-mdb-input-init>
								<input type="text" id="form4Example1" class="form-control"
									value="<%=KH.HoTen%>" /> <label class="form-label"
									for="form4Example1">Name</label>
							</div>
	
							<!-- Email input -->
							<div class="form-outline mb-4" data-mdb-input-init>
								<select
									class="form-select d-inline-block w-auto border pt-1 form-control"
									name="Star">
									<option value="5">5 <i class="fa fa-star"></i></option>
									<option value="4">4 <i class="fa fa-star"></i></option>
									<option value="3">3 <i class="fa fa-star"></i></option>
									<option value="2">2 <i class="fa fa-star"></i></option>
									<option value="1">1 <i class="fa fa-star"></i></option>
								</select> <label class="form-label" for="form4Example2">Star</label>
							</div>
	
							<!-- Message input -->
							<div class="form-outline mb-4" data-mdb-input-init>
								<textarea class="form-control" id="form4Example3" rows="4"
									name="BinhLuan" required="required"></textarea>
								<label class="form-label" for="form4Example3">Text</label>
							</div>
	
							<!-- Checkbox -->
							<div class="form-check d-flex justify-content-center mb-4">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form4Example4" checked /> <label class="form-check-label"
									for="form4Example4"> Send me a copy of this comment </label>
							</div>
	
							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4"
								data-mdb-ripple-init>Publish</button>
						</form>
						<%
						}
						%>
					</section>
					<!--Section: Reply-->
				</div>
				<!--Grid column-->
	
				<!--Grid column-->
	
				<!--Grid column-->
			</div>
			<!--Grid row-->
	
			<style>
	/*----------------book------------*/
	.grid {
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		gap: 20px;
	}
	
	input {
		outline: none;
		border: none;
		width: 100%;
	}
	
	.book {
		padding: 40px 0;
		background-color: #282834;
		color: white;
	}
	
	.book select {
		padding: 20px;
		width: 100%;
	}
	
	h1 {
		font-family: serif;
	}
	
	.book h1 {
		font-size: 28px;
	}
	
	.book h1 span {
		color: cyan;
	}
	
	.book input {
		padding: 20px;
	}
	
	.book input:nth-last-child(1) {
		background: cyan;
		color: white
	}
	</style>
			<section class="book">
				<div class="container flex_space">
					<div class="text me-2">
						<h1>
							<span>Book</span> Your rooms
						</h1>
					</div>
					<div class="form">
						<form class="grid" action="RoomSearch">
							<input type="date" placeholder="Ngày nhận phòng"> <input
								type="date" placeholder="Ngày trả phòng">
	
							<!-- 
	    				<input type ="number" placeholder="Người lớn">
	    				<input type ="number" placeholder="Trẻ em">
	    				 -->
	
							<div class="input-group">
								<select class="SL__NguoiLon" id="input"
									style="padding: 20px; width: 100%">
									<option value="1">Người lớn: 1</option>
									<option value="2" selected>Người lớn: 2</option>
									<option value="3">Người lớn: 3</option>
									<option value="4">Người lớn: 4</option>
									<option value="5">Người lớn: 5+</option>
								</select>
	
							</div>
							<div class="input-group">
								<select class="SL__TreEm" id="input"
									style="padding: 20px; width: 100%">
									<option value="0" selected>Trẻ em: 0</option>
									<option value="1">Trẻ em: 1</option>
									<option value="2">Trẻ em: 2</option>
									<option value="3">Trẻ em: 3+</option>
								</select>
	
							</div>
	
							<input type="submit" value="Check availability">
						</form>
					</div>
				</div>
			</section>
	
			<section class="rooms">
				<div class="container top">
					<div class="heading">
						<h1>Tham khảo phòng</h1>
						<h2>Rooms</h2>
						<p>Một số phòng đang trống:</p>
					</div>
	
					<div class="content mtop">
						<div class="slide-rooms owl-carousel owl-theme">
							<%
							ArrayList<Phong> dsPhongLQ = (ArrayList<Phong>) session.getAttribute("dsPhongLQ");
							for (Phong index : dsPhongLQ) {
							%>
							<div class="items">
								<div class="image">
									<img alt="" src="images/<%=index.getAnh()%>">
								</div>
								<div class="text">
									<a href="RoomDetail?IdPhong=<%=index.getIdPhong()%>"
										class="text-decoration-none">
										<h2><%=index.getTenPhong()%></h2>
									</a>
									<div class="ratting mb-4">
										<h6 class="mb-1">Đánh giá</h6>
	
										<span class="badge rounded-pill bg-light text-dark text-wrap">
											<%
											int sosao2 = index.getRatingId();
											for (int i = 2; i <= 10; i += 2)
												if (i <= sosao2) {
											%> <i class="fa fa-star"></i> <%
	 } else if (i - 1 == sosao2) {
	 %> <i class="fas fa-star-half-alt"></i> <%
	 } else {
	 %> <i class="far fa-star"></i> <%
	 }
	 %>
										</span> <span class="text-muted"><%=index.getSoLanDuocDat()%>
											Số lần được đặt</span>
	
									</div>
									<div class="feather mb-4">
										<h6 class="mb-1">Mô tả</h6>
										<%
										for (LoaiPhong i : dsLoai) {
											if (i.getIdLoaiPhong() == item.getIdLoaiPhong())
												for (String TienNghi : i.getTienNghi()) {
										%>
										<span class="badge rounded-pill bg-light text-dark text-wrap">
											<%=TienNghi%>
										</span>
										<%
										}
										}
										%>
									</div>
									<div class="facilities mb-4">
										<h6 class="mb-1">Tiện nghi</h6>
										<span class="badge rounded-pill bg-light text-dark text-wrap">
											Free wifi </span> <span
											class="badge rounded-pill bg-light text-dark text-wrap">
											Tivi chất lượng cao </span> <span
											class="badge rounded-pill bg-light text-dark text-wrap">
											Tủ lạnh + Free nước lọc </span> <span
											class="badge rounded-pill bg-light text-dark text-wrap">
											Điều hòa và Máy sưởi </span>
									</div>
									<div class="button flex">
										<a href="RoomDetail?IdPhong=<%=item.getIdPhong()%>"><button
												class="primary-btn">Xem Chi Tiết</button></a>
										<h3><%=item.getGia()%>
											$<span><br>Cho một đêm</span>
										</h3>
									</div>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<div class="col-lg-12 text-center mt-5">
						<a href="Rooms"
							class="btn btn-sm btn-outline-dark rounded-0 fw-bold shadow-none">Xem
							Thêm >>></a>
					</div>
	
				</div>
			</section>
			<script type="text/javascript">
				$('.slide-rooms').owlCarousel({
					loop : true,
					margin : 10,
					nav : true,
					dots : false,
					responsive : {
						0 : {
							items : 1
						},
						600 : {
							items : 2,
							margin : 10
						},
						1000 : {
							items : 3
						}
					}
				})
			</script>
	
	
		</div>
		<!-- Popup -->
		<div class="modal fade" id="myModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Để lại thông
							tin của bạn</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Form để nhập thông tin -->
						<%
						if (KH == null) {
						%>
						<form action="Booking?Id=<%=item.getIdPhong()%>"
							class="signin-form" method="post">
							<div class="mb-3">
								<label for="HoTen" class="form-label">Họ và Tên </label> <input
									type="text" class="form-control" id="HoTen" name="HoTen"
									placeholder="Tên người đặt" required>
							</div>
							<div class="mb-3">
								<label for="Email" class="form-label">Email address</label> <input
									type="email" class="form-control" id="Email" name="Email"
									placeholder="name@example.com" required>
							</div>
							<div class="mb-3">
								<label for="sdt" class="form-label">Số điện thoại</label> <input
									type="text" class="form-control" id="sdt" name="sdt" required>
							</div>
							<div class="mb-3">
								<label for="cccd" class="form-label">Căn cước công dân</label> <input
									type="text" class="form-control" id="cccd" name="cccd" required>
							</div>
							<div class="mb-3">
								<label for="DateCheckIn" class="form-label">Ngày Check-in</label>
								<input type="date" class="form-control" id="DateCheckIn"
									name="DateCheckIn" required>
							</div>
							<div class="mb-3">
								<label for="DateCheckOut" class="form-label">Ngày
									Check-out</label> <input type="date" class="form-control"
									name="DateCheckOut" id="DateCheckOut" required>
							</div>
							<div class="mb-3">
								<label for="Note" class="form-label">Ghi Chú</label>
								<textarea class="form-control" id="Note" rows="3" name="Note"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">
									<i class="fa-solid fa-ban"></i> Hủy
								</button>
								<button type="submit" class="primary-btn">Đặt phòng ngay</button>
							</div>
						</form>
						<%
						} else {
						%>
	
						<form action="Booking?Id=<%=item.getIdPhong()%>"
							class="signin-form" method="post">
							<div class="mb-3">
								<label for="HoTen" class="form-label">Họ và Tên </label> <input
									type="text" class="form-control" id="HoTen" name="HoTen"
									placeholder="Tên người đặt" value="<%=KH.getHoTen()%>" required>
							</div>
							<div class="mb-3">
								<label for="Email" class="form-label">Email address</label> <input
									type="email" class="form-control" id="Email" name="Email"
									placeholder="name@example.com" value="<%=KH.getEmail()%>"
									required>
							</div>
							<div class="mb-3">
								<label for="sdt" class="form-label">Số điện thoại</label> <input
									name="sdt" type="text" class="form-control" id="sdt"
									value="<%=KH.getSDT()%>" required>
							</div>
							<div class="mb-3">
								<label for="cccd" class="form-label">Căn cước công dân</label> <input
									name="cccd" type="text" class="form-control" id="cccd"
									value="<%=KH.getCCCD()%>" required>
							</div>
							<div class="mb-3">
								<label for="DateCheckIn" class="form-label">Ngày Check-in</label>
								<input type="date" class="form-control" id="DateCheckIn"
									name="DateCheckIn" required>
							</div>
							<div class="mb-3">
								<label for="DateCheckOut" class="form-label">Ngày
									Check-out</label> <input type="date" class="form-control"
									id="DateCheckOut" name="DateCheckOut" required>
							</div>
							<div class="mb-3">
								<label for="Note" class="form-label">Ghi Chú</label>
								<textarea class="form-control" id="Note" rows="3" name="Note"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">
									<i class="fa-solid fa-ban"></i> Hủy
								</button>
								<button type="submit" class="primary-btn">Đặt phòng ngay</button>
							</div>
						</form>
						<%
						}
						%>
					</div>
	
				</div>
			</div>
		</div>
	</main>
<!--Main layout-->
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
						<li><a class="text-white-50" href="Rooms">About us</a></li>
						<li><a class="text-white-50" href="Rooms">Find room</a></li>
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
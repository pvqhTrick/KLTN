<%@page import="bean.LoaiPhong"%>
<%@page import="bean.KhachHangbean"%>
<%@page import="bean.KhuyenMaibean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.Phong"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Homepage</title>
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

					<li class="nav-item"><a class="nav-link me-2" href="#">Liên hệ</a></li>

				</ul>
				<%
				KhachHangbean KH = (KhachHangbean) session.getAttribute("dn");
				if (KH == null) {
				%>
				<form class="d-flex" action="LoginController">

					<button class="btn btn-outline-success me-2" type="submit">Đăng nhập</button>
					<a href = "Register"><button class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#LoginModal">Đăng ký</button></a>
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
						<li><a class="dropdown-item" href="WishListController">Ưa
								thích</a></li>
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

	<!-- Tieu de -->

</header>
<!--Main Navigation-->

<!--Main layout-->
<main>
	<section class="home">
		<div class="content">
			<div class="owl-carousel owl-theme">
				<div class="item">
					<img alt="" src="images/giuongdoi1.jpg">
					<div class="text">
						<h1>Chào mừng đến với Khách sạn Century</h1>
						<p>Khám phá không gian đẳng cấp và dịch vụ hoàn hảo tại trái
							tim thành phố Huế.</p>
						<div class="flex">
							<a href="Rooms"><button class="primary-btn">Đặt
									phòng ngay</button></a>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="" src="images/Main/pool1.jpg">
					<div class="text">
						<h1>Trải nghiệm Sang Trọng, Đẳng Cấp và Ấm Áp</h1>
						<p>Century Hotel - nơi kết nối giữa kiến trúc tinh tế và sự
							tiện nghi hiện đại.</p>
						<div class="flex">
							<a href="Rooms"><button class="primary-btn">Đặt
									phòng ngay</button></a>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="" src="images/Main/lobby1.jpg">
					<div class="text">
						<h1>Nơi Bắt Đầu Hành Trình Khám Phá Thành Phố</h1>
						<p>Century Hotel chào đón bạn với không gian lý tưởng để bắt
							đầu mỗi cuộc phiêu lưu.</p>
						<div class="flex">
							<a href="Rooms"><button class="primary-btn">Đặt
									phòng ngay</button></a>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="" src="images/Main/bar1.jpg">
					<div class="text">
						<h1>Tận Hưởng Giây Phút Yên Bình Giữa Thành Phố</h1>
						<p>Century Hotel mang đến cho bạn không gian nghỉ ngơi tĩnh
							lặng và thoải mái sau mỗi chuyến đi.</p>
						<div class="flex">
							<a href="Rooms"><button class="primary-btn">Đặt
									phòng ngay</button></a>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="" src="images/Main/buffet1.jpg">
					<div class="text">
						<h1>Đẳng Cấp và Dịch Vụ Tinh Tế</h1>
						<p>Century Hotel cam kết mang đến cho quý khách trải nghiệm
							lưu trú đáng nhớ nhất.</p>
						<div class="flex">
							<a href="Rooms"><button class="primary-btn">Đặt
									phòng ngay</button></a>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="" src="images/vip1.jpg">
					<div class="text">
						<h1>Thưởng Thức Cuộc Sống Đẳng Cấp tại Century</h1>
						<p>Nơi bạn được tận hưởng sự tiện nghi, dịch vụ tuyệt vời và
							không gian thoải mái, tạo nên trải nghiệm lưu trú không thể quên.</p>
						<div class="flex">
							<a href="Rooms"><button class="primary-btn">Đặt
									phòng ngay</button></a>
						</div>
					</div>
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
		$('.owl-carousel').owlCarousel({
			loop : true,
			margin : 10,
			nav : false,
			dots : false,
			autoplay : true,
			autoplayTimeout : 5000,
			autoplayHoverPause : true,
			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 1
				},
				1000 : {
					items : 1
				}
			}
		})
	</script>
	<!-- Book -->

	<section class="book">
		<div class="container flex_space">
			<div class="text me-2">
				<h1>
					<span>Tìm kiếm</span> Phòng
				</h1>
			</div>
			<div class="form">
				<form class="grid" action ="RoomSearch">
					<input type="date" placeholder="Ngày nhận phòng" name="DateCheckIn">
					<input type="date" placeholder="Ngày trả phòng" name="DateCheckOut">
					<div class="input-group">
						<select class="SL__NguoiLon" id="input" name="SoLuongNguoiLon"
							style="padding: 20px; width: 100%">
							<option value="1">Người lớn: 1</option>
							<option value="2" selected>Người lớn: 2</option>
							<option value="3">Người lớn: 3</option>
							<option value="4">Người lớn: 4</option>
							<option value="5">Người lớn: 5+</option>
						</select>

					</div>
					<div class="input-group">
						<select class="SL__TreEm" id="input" name="SoLuongTreEm"
							style="padding: 20px; width: 100%">
							<option value="0" selected>Trẻ em: 0</option>
							<option value="1">Trẻ em: 1</option>
							<option value="2">Trẻ em: 2</option>
							<option value="3">Trẻ em: 3+</option>
						</select>

					</div>

					<input type="submit" value="Tìm kiếm">
				</form>
			</div>
		</div>
	</section>

	<!-- Rooms -->
	<%
	ArrayList<Phong> dsPhong = (ArrayList<Phong>) session.getAttribute("dsPhong");
	ArrayList<LoaiPhong> dsLoai = (ArrayList<LoaiPhong>) session.getAttribute("dsLoai");
	%>
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
					for (Phong item : dsPhong) {
						if(item.getTrangThai()){
					%>
					<div class="items">
						<div class="image">
							<img alt="" src="images/<%=item.getAnh()%>">
						</div>
						<div class="text">
							<a href="RoomDetail?IdPhong=<%=item.getIdPhong()%>"
								class="text-decoration-none">
								<h2><%=item.getTenPhong()%></h2>
							</a>
							<div class="ratting mb-4">
								<h6 class="mb-1">Đánh giá</h6>

								<span class="badge rounded-pill bg-light text-dark text-wrap">
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
								</span> <span class="text-muted"><%=item.getSoLanDuocDat()%> Số
									lần được đặt</span>

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



	<section class="counter top bg-primary">
		<div class="container grid">
			<div class="box">
				<h1>2500+</h1>
				<hr>
				<span>Người đã sử dụng</span>
			</div>
			<div class="box">
				<h1>1250</h1>
				<hr>
				<span>Khách hàng hài lòng</span>
			</div>
			<div class="box">
				<h1>200</h1>
				<hr>
				<span>Chương trình giảm giá</span>
			</div>
			<div class="box">
				<h1>100+</h1>
				<hr>
				<span>Nhân Viên phục vụ</span>
			</div>

		</div>
	</section>

	<%
	ArrayList<KhuyenMaibean> dsKhuyenMai = (ArrayList<KhuyenMaibean>) session.getAttribute("dsKhuyenMai");
	%>
	<section class="discount">
		<div class="container top">
			<div class="heading">
				<h1>Ưu đãi giảm giá</h1>
				<h2>Discount</h2>
			</div>

			<div class="content mtop">
				<div class="slide-discounts owl-carousel owl-theme">
					<%
					for (KhuyenMaibean item : dsKhuyenMai) {
					%>
					<div class="items">
						<div class="image">
							<img alt="" src="banner/<%=item.getBanner()%>">
						</div>
						<div class="text">
							<h2><%=item.getTenKhuyenMai()%></h2>

							<p><%=item.getMoTa()%></p>
							<div class="button flex">
								<a href="RoomDetail.jsp"><button class="primary-btn">Chi
										tiết</button></a>
								<h3>
									Giảm
									<%=(int) item.getChietKhau()%>
									%<span><br>Từ ngày <%=
									item.getNgayBatDau()
									%><br> đến ngày <%=item.getNgayKetThuc()%></span>
								</h3>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$('.slide-discounts').owlCarousel({
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

	<section class="services top">
		<div class="container">
			<div class="heading">
				<h1>Dịch vụ cao cấp</h1>
				<h2>SERVICES</h2>

			</div>
			<div class="content flex_space">
				<div class="left grid2">
					<div class="box">
						<div class="text">
							<i class="fa fa-champagne-glasses"></i>
							<h3>Ẩm thực phong phú</h3>
						</div>
					</div>
					<div class="box">
						<div class="text">
							<i class="fa fa-person-biking"></i>
							<h3>Thuê xe</h3>
						</div>
					</div>
					<div class="box">
						<div class="text">
							<i class="fa fa-utensils"></i>
							<h3>Đồ ăn tại phòng</h3>
						</div>
					</div>
					<div class="box">
						<div class="text">
							<i class="fa fa-spa"></i>
							<h3>Spa thư giãn</h3>
						</div>
					</div>
				</div>
				<div class="right">
					<img
						src="http://brghospitality.vn/century/wp-content/uploads/sites/9/2019/10/Banner-web_Century_trang-chu_2-1.jpg">
				</div>
			</div>
		</div>
	</section>

	<section class="customers top" style="background-color: cyan">
		<div class="container">
			<div class="slide-customers owl-carousel owl-theme">
				<div class="item">
					<i class="fa fa-quote-right"></i>
					<p>Tháng 11-12 hơi lạnh, xin hỏi phòng deluxe hướng sông có hệ
						thống sưởi, hoặc điều hoà 2 chiều không ạ</p>
					<h3>Trần Huy</h3>
					<label>Kính chào Qúy khách, Xin thông báo đến Qúy khách là
						khách sạn có điều hòa 2 chiều ạ. Mong Qúy khách yên tâm nhé.</label>
				</div>
				<div class="item">
					<i class="fa fa-quote-right"></i>
					<p>Which rooms have a private balcony, please? Do you have
						Airport pick-up service? What is the cost</p>
					<h3>Dũng Nguyễn</h3>
					<label>Dear Sir/Madam, Please be informed that the room
						with River View all have private balcony. Thanks and Best Regards.</label>
				</div>
				<div class="item">
					<i class="fa fa-quote-right"></i>
					<p>hi.... I like to visit hue... do you have a room with Review
						with a double bed including breakfast... 19th of May 4 for 7
						nights...thank you</p>
					<h3>Matin Jacob</h3>
					<label>Dear Sir/Madam, Please send me a mail that we can
						send you all informations you need about our Hotel.</label>
				</div>
				<div class="item">
					<i class="fa fa-quote-right"></i>
					<p>Which rooms have a private balcony, please? Do you have
						Airport pick-up service? What is the cost</p>
					<h3>Patrick Moi</h3>
					<label>Dear Sir/Madam, Please be informed that the room
						with River View all have private balcony. Thanks and Best Regards.</label>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$('.slide-customers').owlCarousel({
			loop : true,
			margin : 10,
			nav : false,
			dots : true,
			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 1
				},
				1000 : {
					items : 1
				}
			}
		})
	</script>

	<section class="about top">
		<div class="container flex">
			<div class="left">
				<div class="heading">
					<h1>WELCOME</h1>
					<h2>Century Hotel</h2>
				</div>

				<p>Toạ lạt tại 43 Lê Lợi, Tp Huế, Thừa Thiên Huế. Khách sạn nằm
					ngày trong lòng thành phố, giúp các bạn có thể đến với các điểm
					tham quan di tích và lựa chọn ăn uống thích hợp.</p>
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3826.098307069636!2d107.59088907659651!3d16.470559128566343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3141a14a308cc41b%3A0x77f1b53690b10888!2sCentury%20Riverside%20Hotel%20Hue!5e0!3m2!1svi!2s!4v1711624070644!5m2!1svi!2s"
					width="600" height="450"
					style="border: 0; justify-content: center;" allowfullscreen=""
					loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				<br>
				<p class="note note-light">Tọa lạc tại một vị trí trung tâm trên
					bờ sông Hương, Century Riverside Hue nằm cách Ga Tàu Huế 2 km. Sân
					bay Quốc tế Phú Bài cách đó 20 phút lái xe.</p>
				<p>Các phòng nghỉ trang nhã ở đây mang chủ đề Việt Nam và có ban
					công, máy lạnh cũng như quạt máy. Ngoài ra còn đi kèm minibar và
					máy pha trà/cà phê.</p>
				<p>Khách có thể rèn luyện sức khỏe tại trung tâm thể dục hoặc
					chơi tennis. Dịch vụ mát-xa được cung cấp tại spa, nơi có bồn tắm
					nước nóng và phòng xông hơi khô. Khách sạn còn có dịch vụ cho thuê
					xe hơi và xe đạp.</p>
				<p>Ẩm thực châu Á, Việt Nam và phương Tây được phục vụ tại các
					nhà hàng Terrace Restaurant và Riverside Restaurant. Trong khoảng
					cách đi bộ từ khách sạn du khách cũng có thể tìm thấy nhiều quán
					cafe và nhà hàng.</p>
				<p>
					Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm <strong>9,2</strong>
					cho kỳ nghỉ dành cho 2 người.
				</p>

				<div class="facilities mb-4">
					<p>
						<strong>Các tiện nghi được ưa chuộng nhất:</strong>
					</p>
					<span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-person-swimming me-2"></i>Hồ bơi ngoài trời
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-wifi me-2"></i>Wifi miễn phí
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-car-side me-2"></i>Xe đưa đón từ sân bay
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-people-group me-2"></i>Phòng gia đình
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-ban-smoking me-2"></i>Phòng không hút thuốc
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-dumbbell me-2"></i>Gym
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-spa me-2"></i>Spa
					</span> <span class="badge rounded-pill bg-light text-dark text-wrap">
						<i class="fa-solid fa-square-parking me-2"></i>Nơi đỗ xe miễn phí
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
								<i class="fa-solid fa-utensils"></i> <strong> Nhà hàng</strong>
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
								<i class="fa-solid fa-earth-americas"></i> <strong> Di
									tích lịch sử</strong>
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
								<i class="fa-solid fa-train"></i> <strong> Phương tiện
									công cộng</strong>
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
</main>
<!--Main layout-->
<!-- JS -->

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
					<h6 class="text-uppercase text-white fw-bold mb-2">Phòng</h6>
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
						<i class="flag-united-kingdom flag m-0 me-1"></i>Tiếng việt
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
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		// Lấy tất cả các thẻ <a> có class 'dropdown-item' trong dropdown-menu
		var dropdownItems = document
				.querySelectorAll('.dropdown-menu a.dropdown-item');

		// Bắt sự kiện click trên từng mục trong dropdown
		dropdownItems.forEach(function(item) {
			item.addEventListener('click', function(e) {
				e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

				// Lấy giá trị từ thuộc tính data-value
				var selectedValue = this.getAttribute('data-value');

				// In ra giá trị đã chọn (hoặc bạn có thể thực hiện các hành động khác ở đây)
				console.log(selectedValue);

				// Điều hướng đến URL đã được chỉ định trong thuộc tính href
				window.location.href = this.getAttribute('href');
			});
		});
	});
</script>
</html>
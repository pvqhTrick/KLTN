<%@page import="bo.PhongBo"%>
<%@page import="bo.KhachHangbo"%>
<%@page import="bean.Booking"%>
<%@page import="bean.KhachHangbean"%>
<%@page import="bean.Phong"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
			ArrayList<Phong> dsPhong = (ArrayList<Phong>) session.getAttribute("dsPhong");
			ArrayList<KhachHangbean> dsKH = (ArrayList<KhachHangbean>) session.getAttribute("dsKH");
			ArrayList<Booking> dsDatPhong = (ArrayList<Booking>) session.getAttribute("dsDatPhong");
			ArrayList<Phong> dsPhongTrong = (ArrayList<Phong>) session.getAttribute("dsPhongTrong");
			ArrayList<Phong> dsPhongDangSuDung = (ArrayList<Phong>) session.getAttribute("dsPhongDangSuDung");
			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Admin Xác nhận</title>
<!-- Font Awesome -->
<link href="dist/css/adminlte.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-3HhcQ/0eSf4lt2MEU0X5ytdeUnrfbwjcdO6oKr+0Pv9hzYL65oUeQoq6R8daBX+eG1VwM56OEQbCUBlGq4H9x6g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<link
	href="http://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
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
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<!-- Brand Logo -->
		<a href="Homepage" class="brand-link"> <img src="images/logo.jpg"
			alt="Logo" class="brand-image img-circle elevation-3"
			style="opacity: .8"> <span class="brand-text font-weight-light">Century
				ADMIN</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->


			<!-- SidebarSearch Form -->
			<div class="form-inline">
				<div class="input-group" data-widget="sidebar-search">
					<input class="form-control form-control-sidebar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-sidebar">
							<i class="fas fa-search fa-fw"></i>
						</button>
					</div>
				</div>
			</div>

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					<li class="nav-item  menu-open"><a href="#"
						class="nav-link active"> <i
							class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								Admin <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="AdminQLP" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Quản lý Phòng</p>
							</a></li>
							<li class="nav-item "><a href="AdminQLKH" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Quản lý Khách Hàng</p>
							</a></li>
							<li class="nav-item"><a href="AdminQLKM" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Quản lý Khuyến mãi</p>
							</a></li>
							<li class="nav-item"><a href="AdminQLNV" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Quản lý Nhân viên</p>
							</a></li>
						</ul></li>

					<li class="nav-item menu-open"><a href="AdminXacNhan"
						class="nav-link active"> <i class="nav-icon fas fa-copy"></i>
							<p>
								Xác nhận đặt phòng <span class="badge badge-info right"><%=dsDatPhong.size()
								%></span>
							</p>
					</a></li>
					<li class="nav-item"><a href="AdminThongKe" class="nav-link">
							<i class="nav-icon fas fa-chart-pie"></i>
							<p>
								Thống kê doanh số</i>
							</p>
					</a></li>


					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon far fa-envelope"></i>
							<p>
								Đánh giá khách hàng <i class="fas fa-angle-left right"></i>
							</p>
					</a></li>

				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
	<style>
.note {
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 5px;
	width: 100%;
	height: 100%;
	display: block;
}
</style>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->

		<!-- Main content -->
		<section class="content-header">
			
			<div class="row">
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-info">
						<div class="inner">
							<h3><%=dsPhongTrong.size()%></h3>

							<p>Phòng Còn trống</p>
						</div>
						<div class="icon">
							<i class="fa fa-bed"></i>
						</div>
						<a href="AdminQLP?TrangThai=true" class="small-box-footer">Xem
							thêm <i class="fas fa-arrow-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-success">
						<div class="inner">
							<h3>
								<%=session.getAttribute("DoanhThu")%><sup
									style="font-size: 20px">$</sup>
							</h3>

							<p>Doanh Thu</p>
						</div>
						<div class="icon">
							<i class="fa fa-chart-line"></i>
						</div>
						<a href="AdminThongKe" class="small-box-footer">Xem thêm<i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-warning">
						<div class="inner">
							<h3><%=dsKH.size()%></h3>

							<p>Khách Hàng</p>
						</div>
						<div class="icon">
							<i class="fa fa-user"></i>
						</div>
						<a href="AdminQLKH" class="small-box-footer">Xem Thêm <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-danger">
						<div class="inner">
							<h3><%=dsPhongDangSuDung.size()%></h3>

							<p>Phòng đang sử dụng</p>
						</div>
						<div class="icon">
							<i class="fa fa-heart"></i>
						</div>
						<a href="AdminQLP?TrangThai=false" class="small-box-footer">Xem
							thêm <i class="fas fa-arrow-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- ./col -->
			</div>
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Quản lý Khách hàng</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="Homepage">Home</a></li>
							<li class="breadcrumb-item active">Quản lý khách hàng</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<div class="row">
			<div class="col-md-12">
				<!-- The time line -->
				<div class="timeline">
					<!-- timeline time label -->
					<%
					for (Booking item : dsDatPhong) {
					%>
					<div class="time-label">
						<%
						if (item.getTinhTrangXacNhan()) {
							if (item.getTinhTrangThanhToan()) {
						%>
						<span class="bg-green"><%=item.getNgayTao()%> </span>
						<%
						} else {
						%>
						<span class="bg-yellow"><%=item.getNgayTao()%> </span>
						<%
						}
						} else {
						%>
						<span class="bg-yellow"><%=item.getNgayTao()%> </span>
						<%
						}
						%>


					</div>
					<!-- /.timeline-label -->
					<!-- timeline item -->
					<div>
						<i class="fas fa-envelope bg-blue"></i>
						<div class="timeline-item">
							<h3 class="timeline-header">
								<%
								KhachHangbo kbo = new KhachHangbo();
								KhachHangbean kh = kbo.xemChiTiet(item.getIDKhachHang());
								PhongBo pbo = new PhongBo();
								Phong p = pbo.XemChiTiet(item.getIDPhong());
								%>
								<a href="UserProfile?Id=<%=kh.getIdKhachHang()%>"> <%=kh.getHoTen()%>
								</a> Đã đặt <a href="RoomProfile?IdPhong=<%=p.getIdPhong()%>"> <%=p.getTenPhong()%>
								</a>
							</h3>

							<div class="timeline-body" style="display: flex">
								<div style="width: 70%">
									<ul>
										<li>Ngày nhận phòng: <%=item.getThoiGianDat()%></li>
										<li>Ngày trả phòng: <%=item.getThoiGianThanhToan()%></li>
										<li>Trạng thái thanh toán: <%
										if (item.getTinhTrangThanhToan()) {
										%> <span class="text-success">Đã thanh toán</span> <%
 } else {
 %> <span class="text-warning">Chưa thanh toán</span> <%
 }
 %>
										</li>
										<li>Trạng thái xác nhận: <%
										if (item.getTinhTrangXacNhan()) {
										%> <span class="text-success">Đã xác nhận</span> <%
 } else {
 %> <span class="text-warning">Chưa xác nhận</span> <%
 }
 %>
										</li>
									</ul>
									<h2>
										Tổng chi phí:
										<%=item.getTongThanhToan()%>
										$
									</h2>
								</div>
								<div style="width: 30%">
									<span class="note"> Ghi chú: <%=item.getNote()%></span>
								</div>
							</div>
							<div class="timeline-footer">
								<a class="btn btn-primary btn-sm"
									href="XacNhan?IdDatPhong=<%=item.getIDBooking()%>">Xác nhận</a>
								<a class="btn btn-danger btn-sm"
									href="HuyXacNhan?IdDatPhong=<%=item.getIDBooking()%>">Hủy</a>
								<a class="btn btn-warning btn-sm"
									href="ThanhToan?IdDatPhong=<%=item.getIDBooking()%>">Thanh toán</a>
							</div>
						</div>
					</div>
					<%
					}
					%>

					<div class="time-label">
						<span class="bg-green">2024-1-1 </span>
					</div>


					<div>
						<i class="fas fa-clock bg-gray"></i>
					</div>
				</div>
			</div>
			<!-- /.col -->
		</div>
	</div>
	<!-- /.timeline -->

</body>
</html>
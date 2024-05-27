<%@page import="bean.Booking"%>
<%@page import="bean.Phong"%>
<%@page import="bean.KhachHangbean"%>
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
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin Quản lý khách hàng</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="dist/css/adminlte.min.css" rel="stylesheet" />

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
							<li class="nav-item"><a href="AdminQLP" class="nav-link ">
									<i class="far fa-circle nav-icon"></i>
									<p>Quản lý Phòng</p>
							</a></li>
							<li class="nav-item"><a href="AdminQLKH"
								class="nav-link active"> <i class="far fa-circle nav-icon"></i>
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

					<li class="nav-item"><a href="AdminXacNhan"
						class="nav-link active"> <i class="nav-icon fas fa-copy"></i>
							<p>
								Xác nhận đặt phòng <span class="badge badge-info right"><%=dsDatPhong.size() %></span>
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


	<!-- Hien thi danh sach khach hang -->
	<div class="content-wrapper">
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
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Danh sách khách hàng</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th>Họ tên</th>
											<th>Số điện thoại</th>
											<th>Giới tính</th>
											<th>Căn cước công dân</th>
											<th>Email</th>
											<th>Địa Chỉ</th>
											<th>Tên đăng nhập</th>
											<th>Password</th>
											<th></th>
											<th></th>
											<th><button type="button" class="btn btn-primary"
													data-bs-toggle="modal" data-bs-target="#myModal">
													<i class="fa fa-plus"></i> Add
												</button></th>
										</tr>
									</thead>

									<%
									for (KhachHangbean item : dsKH) {
									%>
									<tbody>
										<tr>
											<th scope="row"><%=item.getIdKhachHang()%></th>
											<td><%=item.getHoTen()%></td>
											<td><%=item.getSDT()%></td>
											<%
											if (item.getGioiTinh() == null) {
											%>
											<td>Khác</td>
											<%
											} else {
											%>
											<%
											if (item.getGioiTinh() == true) {
											%>
											<td>Nam</td>
											<%
											} else {
											%>
											<td>Nữ</td>
											<%
											}
											}
											%>
											<td><%=item.getCCCD()%></td>
											<td><%=item.getEmail()%></td>
											<td><%=item.getDiaChi()%></td>
											<td><%=item.getTendn()%></td>
											<td><%=item.getPassword()%></td>
											<td>
												<button type="button" class="btn btn-primary"
													data-bs-toggle="modal" data-bs-target="#myModal2">
													<i class="fa fa-pen"></i> Edit
												</button>
											</td>

											<td><a href="UserProfile?Id=<%=item.getIdKhachHang()%>"><button
														type="button" class="btn btn-primary">
														<i class="fa fa-info"></i> Detail
													</button></a></td>
											<td><a href="XoaKhachHang?Id=<%=item.getIdKhachHang()%>"><button
														type="button" class="btn btn-primary">
														<i class="fa fa-minus"></i> Delete
													</button></a></td>
										</tr>

									</tbody>
									<%
									}
									%>

								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>


	</div>

	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Form để nhập thông tin -->

					<form action="KhachHangThem" class="signin-form" method="post">
						<div class="mb-3">
							<label for="HoTen" class="form-label">Họ và Tên </label> <input
								type="text" class="form-control" id="HoTen" name="txtHoTen"
								placeholder="Tên người đặt" required>
						</div>
						<div class="mb-3">
							<label for="Email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="Email" name="txtEmail"
								placeholder="name@example.com" required>
						</div>
						<div class="mb-3">
							<label for="sdt" class="form-label">Số điện thoại</label> <input
								type="text" class="form-control" id="sdt" name="txtsdt" required>
						</div>
						<div class="mb-3">
							<label for="sdt" class="form-label">Giới tính</label> <select
								name="cbbGioiTinh" id="cbbGioiTinh">
								<option value="true">Nam</option>
								<option value="false">Nữ</option>
								<option value="null">Khác</option>
							</select><br>
						</div>
						<div class="mb-3">
							<label for="cccd" class="form-label">Căn cước công dân</label> <input
								type="text" class="form-control" id="cccd" name="txtcccd"
								required>
						</div>
						<div class="mb-3">
							<label for="DateCheckIn" class="form-label">Địa chỉ</label> <input
								type="text" class="form-control" id="DateCheckIn"
								name="DateCheckIn" required>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">
								<i class="fa fa-ban"></i> Hủy
							</button>
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-plus"></i>Thêm
							</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sửa</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Form để nhập thông tin -->

					<form action="KhachHangThem" class="signin-form" method="post">
						<div class="mb-3">
							<label for="HoTen" class="form-label">Họ và Tên </label> <input
								type="text" class="form-control" id="HoTen" name="txtHoTen"
								placeholder="Tên người đặt" required value="">
						</div>
						<div class="mb-3">
							<label for="Email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="Email" name="txtEmail"
								placeholder="name@example.com" required>
						</div>
						<div class="mb-3">
							<label for="sdt" class="form-label">Số điện thoại</label> <input
								type="text" class="form-control" id="sdt" name="txtsdt" required>
						</div>
						<div class="mb-3">
							<label for="sdt" class="form-label">Giới tính</label> <select
								name="cbbGioiTinh" id="cbbGioiTinh">
								<option value="true">Nam</option>
								<option value="false">Nữ</option>
								<option value="null">Khác</option>
							</select><br>
						</div>
						<div class="mb-3">
							<label for="cccd" class="form-label">Căn cước công dân</label> <input
								type="text" class="form-control" id="cccd" name="txtcccd"
								required>
						</div>
						<div class="mb-3">
							<label for="DateCheckIn" class="form-label">Địa chỉ</label> <input
								type="text" class="form-control" id="DateCheckIn"
								name="DateCheckIn" required>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">
								<i class="fa fa-ban"></i> Hủy
							</button>
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-plus"></i>Sửa
							</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
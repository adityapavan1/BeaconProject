<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="BeaconApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script>var csrf_token = '${_csrf.token}'</script>
<script src="<c:url value='/static/js/pagination.js' />"></script>
<script src="<c:url value='/static/js/script.js' />"></script>
<script src="<c:url value='/static/js/factory.js' />"></script>
<script src="<c:url value='/static/js/controller.js' />"></script>
<script src="<c:url value='/static/js/admin_template.js' />"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style>
.username.ng-valid {
	background-color: green;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: blue;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}

table.table-style-two {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #3A3A3A;
	border-collapse: collapse;
}

table.table-style-two th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #517994;
	background-color: #B2CFD8;
}

table.table-style-two tr:hover td {
	background-color: #DFEBF1;
}

table.table-style-two td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #517994;
	background-color: #ffffff;
}

.topcorner {
	position: absolute;
	top: 25px;
	right: 300px;
	background-color: #B2CFD8
}

.add {
	top: 0px;
	left: 40px;
}

.search {
	position:relative;
	top: 0px;
	right: 0px;
	
}
.reset{
	position:relative;
	top: 0px;
	right:100px;

}

.filter {
	position:relative;
	top: 0px;
	right: 0px;
	
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	-o-box-sizing: border-box;
	box-sizing: border-box;
}

html {
	width: 100%;
	height: 100%;
	overflow: scroll;
}

body {
	width: 100%;
	height: 100%;
	font-family: 'Open Sans', sans-serif;
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4)
		10%, rgba(138, 114, 76, 0) 40%),
		-moz-linear-gradient(top, rgba(57, 173, 219, .25) 0%,
		rgba(42, 60, 87, .4) 100%),
		-moz-linear-gradient(-45deg, #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4)
		10%, rgba(138, 114, 76, 0) 40%),
		-webkit-linear-gradient(top, rgba(57, 173, 219, .25) 0%,
		rgba(42, 60, 87, .4) 100%),
		-webkit-linear-gradient(-45deg, #670d10 0%, #092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4)
		10%, rgba(138, 114, 76, 0) 40%),
		-o-linear-gradient(top, rgba(57, 173, 219, .25) 0%,
		rgba(42, 60, 87, .4) 100%),
		-o-linear-gradient(-45deg, #670d10 0%, #092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4)
		10%, rgba(138, 114, 76, 0) 40%),
		-ms-linear-gradient(top, rgba(57, 173, 219, .25) 0%,
		rgba(42, 60, 87, .4) 100%),
		-ms-linear-gradient(-45deg, #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104, 128, 138, .4)
		10%, rgba(138, 114, 76, 0) 40%),
		linear-gradient(to bottom, rgba(57, 173, 219, .25) 0%,
		rgba(42, 60, 87, .4) 100%),
		linear-gradient(135deg, #670d10 0%, #092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D',
		endColorstr='#092756', GradientType=1);
}

</style>
</head>


</head>
<body ng-controller="myController as ctrl">
	
	<div class="container">
		<div class="topcorner">
			<a href="/api/logout">Logout</a>
		</div>
		
		
		<form class="well form-horizontal" id="contact_form" ng-submit="ctrl.submit()" name="myForm">
			<fieldset>
				<!-- Form Name -->
				<legend>User Registration Form</legend>

				<div class="form-group">
					<label class="col-md-4 control-label">User Name</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="uname"
								placeholder="User Name" class="form-control" 
								type="text" ng-model="ctrl.user.userName" id="uname" ng-minlength=4 required>
						</div>
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.uname.$error.required">This is a required field</span> 
									<span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span> 
									<span ng-show="myForm.uname.$invalid">This field is invalid </span>
								</div>
						
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">First Name</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="first_name"
								placeholder="First Name" class="form-control" type="text" 
								ng-model="ctrl.user.firstName" id="first_name"
								ng-required="true" ng-minlength=2>
							</div>
								<div class="has-error" ng-show="myForm.$dirty">
								<span ng-show="myForm.last_name.$error.required">This is a required field.</span>
							</div>
						
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Last Name</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="last_name"
								placeholder="Last Name" class="form-control" type="text" ng-model="ctrl.user.lastName" id="last_name">
						</div>
						<div class="has-error" ng-show="myForm.$dirty">
						<span ng-show="myForm.last_name.$error.required">This is a required field.</span>
                       
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Password</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-asterisk"></i></span> <input name="password"
								placeholder="Password" class="form-control" type="text" ng-model="ctrl.user.password" id="password" ng-minlength=3 required>			
						</div>
						<div class="has-error" ng-show="myForm.$dirty">
						<span ng-show="myForm.password.$error.required">This is a required field.</span>
                        <span ng-show="myForm.password.$invalid">This field is invalid </span>
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">E-Mail</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input name="email"
								placeholder="E-Mail Address" class="form-control" type="text" 
								ng-model="ctrl.user.email" id="email"
								required>
						</div>
								<div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field.</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                 </div>
								
						
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Phone #</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input name="phoneNum"
								placeholder="Phone Number" class="form-control" 
								type="text" ng-model="ctrl.user.phoneNum" id="phoneNum"
								ng-maxlength="10" ng-minlength="10" ng-pattern="/^\d{10}$/" required>		
						</div>
						<div class="has-error" ng-show="myForm.$dirty">
						<span ng-show="myForm.phoneNum.$error.required">This is a required field.</span>
                        <span ng-show="myForm.phoneNum.$invalid">Enter 10 digits </span>
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Address</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-home"></i></span> <input name="address"
								placeholder="Address" class="form-control" type="text" ng-model="ctrl.user.address" id="address">
						</div>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div >
						<input type="submit"
								value="{{!ctrl.user.userName? 'Add' : 'Update'}}" ng-disabled="myForm.$invalid" class="btn btn-warning">
					</div>
					<div class="col-md-3" style="left: 450px; bottom:33px;">
						<button ng-click="ctrl.reset()" type="submit" class="btn btn-warning" ng-disabled="myForm.$pristine">
							Reset 
						</button>
					</div>
				</div>

			</fieldset>
		</form>

		<div class="well form-horizontal">
			
			<div class="form-group">
			<div class="col-md-3">
			<h3 >List of Users</h3>
			</div>
			<div class="col-md-3" style="top:20px;">
				Search:<input type="text" placeholder="Search Patients"
					ng-model="searchText">
			</div>
			<div class="col-md-3" style="top: 20px;">
				Rows to Display:<input type="number" step="1" min="1" max="4"
					ng-model="rowLimit">
			</div>
			</div>
			<table class="table-style-two">
				<thead>
					<tr>
						<th>UserName</th>
						<th>Password</th>
						<th>Address</th>
						<th>Email</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Phone Number</th>
						<th width="20%"></th>
					</tr>
				</thead>
				<tbody>
					<tr
						dir-paginate="user in ctrl.users|filter:searchText|itemsPerPage:rowLimit">
						<td><span ng-bind="user.userName"></span></td>
						<td><span ng-bind="user.password"></span></td>
						<td><span ng-bind="user.address"></span></td>
						<td><span ng-bind="user.email"></span></td>
						<td><span ng-bind="user.firstName"></span></td>
						<td><span ng-bind="user.lastName"></span></td>
						<td><span ng-bind="user.phoneNum"></span></td>
						<td>
							<button type="button" ng-click="ctrl.edit(user.userName)"
								class="btn btn-warning btn-sm">Edit</button>
							<button type="button" ng-click="ctrl.remove(user.userName)"
								class="btn btn-warning btn-sm">Remove</button>
						</td>
					</tr>
				</tbody>
			</table>
			<dir-pagination-controls max-size="3" direction-links="true"
				boundary-links="true"> </dir-pagination-controls>

		</div>




	</div>

</body>
</html>
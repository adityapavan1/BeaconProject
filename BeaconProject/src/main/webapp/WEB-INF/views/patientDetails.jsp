<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="BeaconApp">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script>var csrf_token='${_csrf.token}'</script>
<script src="<c:url value='/static/js/pagination.js' />"></script>
<script src="<c:url value='/static/js/script.js' />"></script>
<script src="<c:url value='/static/js/factory.js' />"></script>
<script src="<c:url value='/static/js/controller.js' />"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

.heading{
width:200px;
color: white;
font:bold 20px Tahoma;

}

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


.topcorner{
    position:absolute;
    top:15px;
    right: 40px;
    background-color: #B2CFD8
    
 }
 
 .add{
 	position:absolute;
    top:500px;
    left: 40px;
 
 }
 
 .search{
    position:absolute;
    top:440px;
    right: 800px;
    background-color: #B2CFD8
    
 }
 
 .filter{
    position:absolute;
    top:440px;
    right: 1100px;
    background-color: #B2CFD8
    
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
	overflow: hidden;
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body ng-app="BeaconApp" class="ng-cloak">


<%-- <c:url value="j_spring_security_logout" var="logoutUrl"></c:url>
<form action="${logoutUrl}" method="post" id="logoutForm">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form> --%>

	<div class="topcorner">
	<a href="/api/logout">Logout</a>
	</div>

	

	<div class="generic-container" ng-controller="myController as ctrl">
		<div class="search">
			Search:<input type="text" placeholder="Search Patients" ng-model="searchText">
		</div>
		
		<div class="filter">
			Rows to Display:<input type="number" step="1" min="1" max="4" ng-model="rowLimit">
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">User Registration Form </span>
			</div>
			<br/>
			
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal">
					<input type="hidden" ng-model="ctrl.user.userName" />
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="uname">User Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.userName" id="uname"
									class="username form-control input-sm"
									placeholder="Enter a unique username" required ng-minlength="5" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.uname.$error.required">This is a required field</span> 
									<span ng-show="myForm.uname.$error.minlength">Minimum length required is 5</span> 
									<span ng-show="myForm.uname.$invalid">This field is invalid </span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="password">Password</label>
							<div class="col-md-7">
								<input type="password" ng-model="ctrl.user.password" id="password"
									class="form-control input-sm"
									placeholder="Enter your Password. " />
							</div>
						</div>
					</div>

 
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="address">Address</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.address" id="address"
									class="form-control input-sm"
									placeholder="Enter your Address. " />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="email">Email</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.email" id="email"
									class="form-control input-sm" placeholder="Enter your Email." />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="FirstName">First
								Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.firstName" id="FirstName"
									class="form-control input-sm"
									placeholder="Enter your FirstName" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="LastName">Last
								Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.lastName" id="LastName"
									class="form-control input-sm" placeholder="Enter your LastName" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="phonenum">Phone
								Number</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.phoneNum" id="phonenum"
									class="form-control input-sm"
									placeholder="Enter your Phone Number" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit"
								value="{{!ctrl.user.userName? 'Add' : 'Update'}}" ng-disabled="myForm.$invalid" class="btn btn-primary btn-sm">
							<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
								Form</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
			<!-- Default panel contents -->
			<!-- <div class="panel-heading">
				<span class="lead">List of Users </span>
			</div> -->
			
			<h2 class="heading">List of Users</h2>
			
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
						<tr dir-paginate="user in ctrl.users|filter:searchText|itemsPerPage:rowLimit">
							<td><span ng-bind="user.userName"></span></td>
						    <td><span ng-bind="user.password"></span></td>
							<td><span ng-bind="user.address"></span></td>
							<td><span ng-bind="user.email"></span></td>
							<td><span ng-bind="user.firstName"></span></td>
							<td><span ng-bind="user.lastName"></span></td>
							<td><span ng-bind="user.phoneNum"></span></td>
							<td>
								<button type="button" ng-click="ctrl.edit(user.userName)" class="btn btn-warning btn-sm">Edit
								</button>
								<button type="button" ng-click="ctrl.remove(user.userName)" class="btn btn-primary btn-sm">Remove
								</button>
							</td>
						</tr>
					</tbody>
				</table>
		<dir-pagination-controls max-size="2" direction-links="true"
			boundary-links="true"> </dir-pagination-controls>

	</div>


</body>
</html>
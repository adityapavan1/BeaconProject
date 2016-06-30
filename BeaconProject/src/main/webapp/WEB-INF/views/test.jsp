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
<script src="<c:url value='/assets/js/jquery-1.11.1.min.js' />"></script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/assets/js/jquery.backstretch.min.js' />"></script>
<script src="<c:url value='/assets/js/scripts.js' />"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">       
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
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
		
			<div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
     
        				<h3 class="modal-title" id="modal-register-label">User Registration</h3>
        				
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form ng-submit="ctrl.submit()" role="form"  class="registration-form" name="myForm">
	                    	
							<div class="form-group">
	                    		<label class="sr-only" for="form-user-name">User Name</label>
	                        	<input type="text" ng-model="ctrl.user.userName" id="uname" name="form-user-name" placeholder="User Name..." class="form-first-name form-control">
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.uname.$error.required">This is a required field</span> 
									<span ng-show="myForm.uname.$error.minlength">Minimum length required is 5</span> 
									<span ng-show="myForm.uname.$invalid">This field is invalid </span>
								</div>
	                        </div>
							
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">Password</label>
	                        	<input type="text" name="form-password" placeholder="Password..." class="form-password form-control" ng-model="ctrl.user.password" id="password">
	                        </div>
							
							<div class="form-group">
	                    		<label class="sr-only" for="form-first-name">First name</label>
	                        	<input type="text" name="form-first-name" placeholder="First name..." class="form-first-name form-control" ng-model="ctrl.user.firstName" id="FirstName">
	                        </div>
							
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-last-name">Last name</label>
	                        	<input type="text" name="form-last-name" placeholder="Last name..." class="form-last-name form-control" ng-model="ctrl.user.lastName" id="LastName">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-email">Email</label>
	                        	<input type="text" name="form-email" placeholder="Email..." class="form-email form-control" ng-model="ctrl.user.email" id="email">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-about-yourself">Address</label>
	                        	<textarea name="form-about-yourself" placeholder="Address..." 
	                        				class="form-about-yourself form-control" ng-model="ctrl.user.address" id="address"></textarea>
	                        </div>
							<div class="form-group">
	                        	<label class="sr-only" for="form-email">Phone Number</label>
	                        	<input type="text" name="form-email" placeholder="Phone Number..." class="form-email form-control" ng-model="ctrl.user.phoneNum" id="phoneNum">
	                        </div>
	                        <button type="submit" class="btn">Sign me up!</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>
				
			
			
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
								<div class="top-big-link">
                            	<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-register">Launch modal</a>
                            	</div>
                            	<!-- <button type="button" ng-click="ctrl.edit(user.userName)" class="btn btn-success custom-width">Edit
								</button> -->
								<button type="button" ng-click="ctrl.remove(user.userName)" class="btn btn-danger custom-width">Remove
								</button>
							</td>
						</tr>
					</tbody>
				</table>
		<dir-pagination-controls max-size="3" direction-links="true"
			boundary-links="true"> </dir-pagination-controls>

	</div>


</body>
</html>
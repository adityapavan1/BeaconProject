<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href="static/css/normalize.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script>var csrf_token='${_csrf.token}'</script>
<script src="<c:url value='/static/js/pagination.js' />"></script>
<script src="<c:url value='/static/js/script.js' />"></script>
<script src="<c:url value='/static/js/factory.js' />"></script>
<script src="<c:url value='/static/js/controller.js' />"></script>

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(http://fonts.googleapis.com/css?family=Open+Sans);

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

h2{
color: white
}

.topcorner{
    position:absolute;
    top:15px;
    right: 40px;
    background-color: #B2CFD8
    
 }

</style>


<script src="static/js/prefixfree.min.js"></script>
<script src="static/js/index.js"></script>



<title>Insert title here</title>
</head>
<body ng-app="BeaconApp">
	
	<br/>
	<br/>
	
	
	<h2>Your Details</h2>
	
	<div class="topcorner">
	<a href="/api/logout">Logout</a>
	</div>
	
	<div ng-controller="myController as ctrl" ng-init="ctrl.fetchUser('${pageContext.request.userPrincipal.name}')">

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
				</tr>
			</thead>
			<tbody>
				<tr>
							<td><span ng-bind="ctrl.users.userName"></span></td>
						    <td><span ng-bind="ctrl.users.password"></span></td>
							<td><span ng-bind="ctrl.users.address"></span></td>
							<td><span ng-bind="ctrl.users.email"></span></td>
							<td><span ng-bind="ctrl.users.firstName"></span></td>
							<td><span ng-bind="ctrl.users.lastName"></span></td>
							<td><span ng-bind="ctrl.users.phoneNum"></span></td>
							
				</tr>
			</tbody>
		</table>



	</div>
</body>
</html>
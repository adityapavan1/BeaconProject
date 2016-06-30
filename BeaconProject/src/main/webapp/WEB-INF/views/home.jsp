<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html ng-app="myApp">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/static/js/script1.js'/>"></script>

<title>Home</title>
</head>
<body ng-controller="myController">
	<div>
	<input type="text" ng-model="message">
	{{message}}
	
	<br/>
	<br/>
	<input type="checkbox" ng-model="hideSalary">Hide Salary
	<br/>
	Rows to Display<input type="number" step="1" min="0" max="3" ng-model="rowLimit" >
	<br/>
	Search:<input type="text" placeholder="Search Employees" ng-model="searchText">
	<br/>
	<br/>
	<table border = "1">
	<thead>
	<tr>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Date of Birth</th>
	<th ng-hide="hideSalary">Salary</th>
	</tr>
	</thead>
	
	<!-- <tbody ng-repeat="employee in employees|limitTo:rowLimit">
	 -->
	 <!-- <tbody ng-repeat="employee in employees | orderBy:'salary':false">
	 --> 
	<tbody ng-repeat="employee in employees | filter:searchText"> 
	<tr>
	<td>{{employee.firstName | uppercase}}</td>
	<td>{{employee.lastName | date:"dd/mm/yy"}}</td>
	<td>{{employee.dob}}</td>
	<td ng-hide="hideSalary">{{employee.salary}}</td>
	</tr>
	
	</tbody>
	</table>
	
	<br/>
	<br/>
	
	<table border="1">
	<thead>
	<tr>
	<th>name</th>
	<th>likes</th>
	<th>dislikes</th>
	<th>like/dislike</th>
	</tr>
	</thead>
	<tbody ng-repeat="technology in technologies">
	<tr>
	<td>{{technology.name}}</td>
	<td>{{technology.likes}}</td>
	<td>{{technology.dislikes}}</td>
	<td>
	<input type="submit" value = "like" 
							ng-click="incrementLikes(technology)">
	<input type="submit" value = "dislike" 
							ng-click="incrementDislikes(technology)">
	</td>
	</tr>
	
	</tbody>
	
	
	</table>
	
	
	
	</div>
</body>
</html>

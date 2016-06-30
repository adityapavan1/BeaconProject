var myApp = angular.module('myApp',[]);

myApp.controller("myController",function($scope){
	$scope.message = "Howdy";
	var employees = [
			
			{firstName:"Aditya" , lastName : "kolli",dob:new Date("May 12 1991"),salary:85000},
			{firstName:"Taylor" , lastName : "Swift",dob:new Date("May 5 1989"),salary:59000},
			{firstName:"Adele" , lastName : "Adkins",dob:new Date("May 28 1988"),salary:69000}
			
			
			
			
	];
	
	var technologies = [
	            {name:"java", likes:0,dislikes:0},
	            {name:"javascript", likes:0,dislikes:0},
	            {name:"C", likes:0,dislikes:0}
	                    
	                    ];
	$scope.technologies = technologies;
	$scope.incrementLikes = function(technology){
		technology.likes++;
		
	}
	$scope.incrementDislikes = function(technology){
		
		technology.dislikes++;
	}
	
	
	
	$scope.employees = employees;
	$scope.rowLimit = 1;
});


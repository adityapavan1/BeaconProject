'use strict';
BeaconApp.controller("myController",['$scope', 'UserService',function($scope,UserService){
	
	var self = this;
	self.user={userName:'',password:'',email:'',firstName:'',address:'',lastName:'',phoneNum:''};
    self.users=[];

    $scope.rowLimit = 2;
    
    self.fetchUser = function(userName){
    	console.log("inside fetch user function" + userName)
        UserService.fetchUserByName(userName)
            .then(
                         function(d) {
                        	 console.log(d);
                              self.users = d;
                         },
                          function(errResponse){
                              console.error('Error while fetching users');
                          }
                 );
    };
    
    
    self.fetchAllUsers = function(){
        UserService.fetchAllUsers()
            .then(
                         function(d) {
                              self.users = d;
                         },
                          function(errResponse){
                              console.error('Error while fetching users');
                          }
                 );
    };
      
    self.createUser = function(user){
        UserService.createUser(user)
                .then(
                self.fetchAllUsers, 
                        function(errResponse){
                             console.error('Error while creating User.');
                        } 
            );
    };

   self.updateUser = function(user, userName){
        UserService.updateUser(user, userName)
                .then(
                        self.fetchAllUsers, 
                        function(errResponse){
                             console.error('Error while updating User.');
                        } 
            );
    };

   self.deleteUser = function(userName){
        UserService.deleteUser(userName)
                .then(
                        self.fetchAllUsers, 
                        function(errResponse){
                             console.error('Error while deleting User.');
                        } 
            );
    };

    self.fetchAllUsers();

    self.submit = function() {
    	self.fetchAllUsers();
    	var flag=1;
    	
    	for(var i = 0; i < self.users.length ; i++){
    		console.log("user" + self.user.userName);
    		console.log("fetched" + self.users[i].userName);
    		if(self.users[i].userName == self.user.userName){
    			
    			self.updateUser(self.user, self.user.userName);
                console.log('User updated with UserName ', self.user.userName);
                flag=0;
                break;
    		}
    		
    	}
    	
    	if(flag==1){
		console.log('Saving New User', self.user);    
        self.createUser(self.user);
        alert("Successfully Created")
		}
    	
        self.reset();
    };
         
    self.edit = function(userName){
        console.log('name to be edited', userName);
        for(var i = 0; i < self.users.length; i++){
            if(self.users[i].userName === userName) {
               self.user = angular.copy(self.users[i]);
               break;
            }
        }
    };
         
    self.remove = function(userName){
        console.log('userName to be deleted', userName);
        if(self.user.userName === userName) {//clean form if the user to be deleted is shown there.
           self.reset();
        }
        self.deleteUser(userName);
    };

     
    self.reset = function(){
        self.user={userName:'',password:'',email:'',firstName:'',address:'',lastName:'',phoneNum:''};
        $scope.myForm.$setPristine(); //reset Form
    };

}]);
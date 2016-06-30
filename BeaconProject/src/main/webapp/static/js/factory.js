'use strict';
BeaconApp.factory('UserService', ['$http', '$q', function($http, $q){
	
	
	return {
         
         fetchAllUsers: function() {
        	 		return	$http({
        	 				method:'GET',
        	 				url:'http://localhost:8080/api/patients/',
        	 				headers:{
        	 					'content-Type':undefined,
        	 					'X-CSRF-Token':csrf_token
        	 				}
        	 			}) .then(function(response){
                                     return response.data;
                                 }, 
                                 function(errResponse){
                                     console.error('Error while fetching users');
                                     return $q.reject(errResponse);
                                 }
                         );
         },
          
         createUser: function(user){
        	 
        	return $http({
	 				method:'POST',
	 				url:'http://localhost:8080/api/patients/',
	 				headers:{			
	 					'Content-Type':"application/json",
	 					'X-CSRF-Token':csrf_token
	 				},
        	 		
        	 		data:user
	 			})
                         .then(
                                 function(response){
                                     return response.data;
                                 }, 
                                 function(errResponse){
                                     console.error('Error while creating user');
                                     return $q.reject(errResponse);
                                 }
                         );
         },
         
         updateUser: function(user,userName){
        	 
         	return $http({
 	 				method:'PUT',
 	 				url:'http://localhost:8080/api/patients/' + userName,
 	 				headers:{			
 	 					'Content-Type':"application/json",
 	 					'X-CSRF-Token':csrf_token
 	 				},
         	 		
         	 		data:user
 	 			})
                          .then(
                                  function(response){
                                      return response.data;
                                  }, 
                                  function(errResponse){
                                      console.error('Error while creating user');
                                      return $q.reject(errResponse);
                                  }
                          );
          },
         
         
         /*updateUser: function(user, userName){
                 return $http.put('http://localhost:8080/api/patients/'+userName, user)
                         .then(
                                 function(response){
                                     return response.data;
                                 }, 
                                 function(errResponse){
                                     console.error('Error while updating user');
                                     return $q.reject(errResponse);
                                 }
                         );
         },*/
          
         /*deleteUser: function(userName){
        	 return $http.delete('http://localhost:8080/api/patients/'+userName)
                     .then(
                             function(response){
                                 return response.data;
                             }, 
                             function(errResponse){
                                 console.error('Error while deleting user');
                                 return $q.reject(errResponse);
                             }
                     );
     }*/
          
          
          deleteUser: function(userName){
         	 
           	return $http({
   	 				method:'DELETE',
   	 				url:'http://localhost:8080/api/patients/' + userName,
   	 				headers:{			
   	 					'Content-Type':"application/json",
   	 					'X-CSRF-Token':csrf_token
   	 				},
           	 		
           	 		
   	 			})
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating user');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            
            
            fetchUserByName: function(userName){
            	 
               	return $http({
       	 				method:'GET',
       	 				url:'http://localhost:8080/api/patient/' + userName,
       	 				headers:{			
       	 					'Content-Type':"application/json",
       	 					'X-CSRF-Token':csrf_token
       	 				},
               	 		
               	 		
       	 			})
                                .then(
                                        function(response){
                                            return response.data;
                                        }, 
                                        function(errResponse){
                                            console.error('Error while creating user');
                                            return $q.reject(errResponse);
                                        }
                                );
                },
           
  
};

}]);
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="/resources/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<link
	href="/resources/css/style.css"
	rel="stylesheet" >
	<script type="text/javascript" src="/resources/js/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module("myModule", []);
	app.controller("myController", myFunction);
	function myFunction($scope, $http) {
		var getURL = "http://localhost:8080/allemp";
		$http.get(getURL).then(function(response) {
			console.log(response.data);
			$scope.employees = response.data;
		});
		$scope.addResigerEmployees = function() {
			var empObj = {
					"empID" : $scope.empID,
					"firstName" : $scope.firstName,
					"lastName" : $scope.lastName,
					"salary" : parseFloat($scope.salary),
					"userID" : $scope.userId,
					"password" : $scope.password
			};
			console.log(empObj);
			$http({
				method : 'POST',
				url : 'http://localhost:8080/save',
				headers : {
					'Content-Type' : 'application/json'
				},
				data : empObj
			}).then(function(data) {
				$scope.empID = '';
				$scope.firstName = '';
				$scope.lastName = '';
				$scope.userId = '';
				$scope.password = '';
				$scope.salary ='';
				$http.get(getURL).then(function(response) {
					$scope.employees = response.data;
				});
			});
		};
		$scope.editEmpDetails = function(employee) {
	        console.log(employee);
			$scope.empID  = employee.empID;
			$scope.firstName = employee.firstName;
			$scope.lastName = employee.lastName;
			$scope.salary = employee.salary;
			$scope.userId = employee.lastName;
			$scope.password = employee.password;
		};
		$scope.updateResigerEmployees = function(){
			var empObj = {
				"empID" : $scope.empID,
				"firstName" : $scope.firstName,
				"lastName" : $scope.lastName,
				"salary" : parseFloat($scope.salary),
				"userID" : $scope.userId,
				"password" : $scope.password
			};
			console.log(empObj);
			$http({
				method : 'PUT',
				url : 'http://localhost:8080/update',
				headers : {
					'Content-Type' : 'application/json'
				},
				data : empObj
			}).then(function(data) {
				$scope.empID = '';
				$scope.firstName = '';
				$scope.lastName = '';
				$scope.userId = '';
				$scope.password = '';
				$scope.salary = '';
				$http.get(getURL).then(function(response) {
					$scope.employees = response.data;
				});
			});
		}
		 $scope.deleteEmployee = function(empId){
			   var deleteURL = "http://localhost:8080/delete/"+empId;
			   $http.delete(deleteURL).then(function (response) {
				   $http.get(getURL)
				    .then(function(response) {
				    	$scope.employees = response.data;
				    });
			});
		   }
		$scope.filterValue = function($event) {
			if (isNaN(String.fromCharCode($event.keyCode))) {
				$event.preventDefault();
			}
		};
	}
</script>
</head>
<body>

	<div class="container" ng-controller="myController">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<h3>Spring boot CRUD with angular 1</h3>
						</div>
						<hr>
						<div class="panel-body">
							<div class="row">
								<div class="form-group col-lg-6">
									<input type="text" ng-model="empID" class="form-control" ng-keypress="filterValue($event)"
										placeholder="Employee ID" value="">
								</div>
								<div class="form-group col-lg-6">
									<input type="text" class="form-control" ng-model="firstName"
										placeholder="First Name" value="">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-6">
									<input type="text" class="form-control" placeholder="last Name"
										ng-model="lastName">
								</div>
								<div class="form-group col-lg-6">
									<input type="text" class="form-control" placeholder="User Id "
										ng-model="userId">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-6">
									<input type="password" class="form-control"
										placeholder="Password " ng-model="password">
								</div>
								<div class="form-group col-lg-6">
									<input type="text" class="form-control" placeholder="Salary " ng-keypress="filterValue($event)"
										ng-model="salary">
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-3 col-sm-offset-3">
										<input type="button" id="register-submit"
											ng-click="addResigerEmployees();" tabindex="4"
											class="form-control btn btn-success" value="Register Now">
									</div>
									<div class="col-sm-3 ">
										<input type="button"  
											ng-click="updateResigerEmployees();" tabindex="4"
											class="form-control btn btn-primary" value="Update">
									</div>
								</div>
							</div>

							<div class="panel-heading">
								<div class="col-sm-offset-10 col-sm-2">
									<input ng-model="searchtxt" type="text" class="form-control"
										placeholder="Flter key">
								</div>
							</div>
							<div class="panel-body">
								<table class="table table-bordered" at-table at-paginated
									at-list="list" at-config="config">
									<thead>
										<tr>
											<th>Employee ID</th>
											<th>Name</th>
											<th>Salary</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr class="success"
											ng-repeat="employee in employees  | filter : searchtxt">
											<td>{{employee.empID}}</td>
											<td>{{employee.firstName}} - {{employee.lastName}}</td>
											<td>{{employee.salary}}</td>
											<td>
											<a href="#" class="btn btn-default"
									ng-click="editEmpDetails(employee)" role="button">Edit</a> <a
									href="#" class="btn btn-danger"
									ng-click="deleteEmployee(employee.empID)" role="button" style="color: white;">Delete</a>
								
											</td>
										</tr>
									</tbody>
								</table>
								<!-- <at-pagination at-list="list" at-config="config"></at-pagination> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




	</div>
</body>
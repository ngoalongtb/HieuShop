var StudentApp = angular.module('StudentApp', [])

StudentApp.controller('StudentController', function ($scope) {

    $scope.message = false;

});
StudentApp.factory('StudentService', ['$http', function ($http) {

    var StudentService = {};
    StudentService.getStudents = function () {
        return $http.get('/Demo/demo');
    };
    return StudentService;

}]);
StudentApp.controller('StudentController', function ($scope, StudentService) {

    getStudents();
    function getStudents() {
        StudentService.getStudents()
            .success(function (studs) {
                $scope.students = studs;
                console.log($scope.students);
            })
            .error(function (error) {
                $scope.status = 'Unable to load customer data: ' + error.message;
                console.log($scope.status);
            });
    }
    
    
    $scope.editEmployee = function (r) {
        debugger;
        var getData = myService.getEmployee(r.Id);
        getData.then(function (emp) {
            $scope.employeeId = employee.Id;
            $scope.employeeName = employee.name;
            $scope.Action = "Update";
            $scope.divEmployee = true;
        },
        function () {
            alert('Error in getting records');
        });
    }
    });

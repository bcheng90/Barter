// change the routes
angular.module('barter', ['ngNewRouter', 'ngResource']);

//Tell angular to use the CSRF token rails provides on the page
// TODO: Ask Steven what this actually does
angular.module('barter').config(function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
});

angular.module('barter').controller('AppController', ['$router', '$http', AppController]);

angular.module('directives', []).directive('file', function() {
  return {
    restrict: 'AE',
    scope: {
      file: '@'
    },
    link: function(scope, el, attrs){
      el.bind('change', function(event){
        var files = event.target.files;
        var file = files[0];
        scope.file = file;
        scope.$parent.file = file;
        scope.$apply();
      });
    }
  };
});

function AppController ($router, $http) {
  $router.config([
    {path: '/', component: 'welcome' },
    {path: '/timeslots', component: 'timeslots' },
    {path: "/talents", component: "talents"},
    {path: '/users/:id', component: 'users' }
  ]);

  $http.get('/current_user').success(function(data) {
    this.current_user = data;
  }.bind(this));
  this.time = new Date();

}

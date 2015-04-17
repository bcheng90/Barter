// change the routes
angular.module('barter', ['ngNewRouter', 'ngResource']);
angular.module('barter').controller('AppController', ['$router', AppController]);

function AppController ($router) {
  $router.config([
    {path: '/', component: 'welcome' },
    {path: '/timeslots', component: 'timeslots' },
    {path: "/talents", component: "talents"}
  ]);
}

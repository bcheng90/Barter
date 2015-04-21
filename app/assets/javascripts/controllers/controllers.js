angular.module('barter')
  .controller('WelcomeController', ['$routeParams', "UserService", "TalentService", function($routeParams, UserService, TalentService ){
    this.tals = [];
    this.persons = [];
    this.selectedCategory = 'Art & Music';

     UserService.query(function(data) {
      this.persons = data;
     }.bind(this));

     TalentService.query(function(data) {
      this.tals = data;
     }.bind(this));

     this.filterFunction = function(array, key){
       for(var i = 0; i < array.length; i++){
         if (array[i].type === key){
           return true
         }
       };
      return false;
     };

     // var rep = function(persons) {
     //  for(var i = 0; i < persons.length; i++){
     //    persons[i].reputation =
     //  }
     // };
     this.myVar = false;
     this.toggle = function() {
        this.myVar = true;
     };
     this.clear = function() {
        this.myVar = false;
     };



}]);
angular.module('barter')
.controller('UsersController', ['$http', '$routeParams', 'UserService', "TalentService", "OfferService", function($http, $routeParams, UserService, TalentService, OfferService){

  this.categories = ["Art & Music", "Sports", "Fitness & Nutrition", "Cooking & Baking", "Computers & Electronics", "Education & Careers", "Home Improvement"];
  this.experiences = ["Novice", "Intermediate", "Expert"];
  this.ratings = [1, 2, 3, 4, 5];

  this.loadUserGraph = function() {
     UserService.get({id: $routeParams.id}, function(data){
       this.user = data;
       this.talent = {user_id: this.user.id}
       this.user.reputation = {user_id: this.user.id};
     }.bind(this));
   }

   this.loadUserGraph();

  this.saveUser = function(user) {
    UserService.update(user);
  };

  this.updateTalent = function(talent) {
    var that = this;
    $http.put('/talents/' + talent.id, talent)
    .success(function(response){
      that.loadUserGraph();
    });
  };


  this.saveRating = function(){
    $http.post('/reputations', this.user.reputation);
    this.loadUserGraph();
  };

  this.saveTalent = function(){
    $http.post('/talents', this.talent);
    this.loadUserGraph();
  };

  this.toggleTalentShown = function(talent) {
    talent.isShown = ! talent.isShown;
  };

  this.loadTalentsForUser = function(user) {
    $http.get('/talents/for_user/' + user.id).
     success(function(data, status, headers, config) {
      this.talents = data;
    });
  };

  this.acceptOffer = function(offer) {
    var that = this;
    offer.status = true;
    $http.put('/offers/' + offer.id, offer)
    .success(function(data, status){
      that.loadUserGraph();
    });
  };

  this.declineOffer = function(offer) {
    var that = this;
    $http.delete('/offers/' + offer.id, offer)
    .success(function(response){
      that.loadUserGraph();
    }).error(function(response){
    });
  };

  function insertOffer(newOffer, user) {
    var slots = user.timeslots;
    slots.forEach(function(slot) {
      if (slot.id === newOffer.timeslot_id) {
        slot.offers.push(newOffer);
      }
    })
  }

  function removeOffer(offer, user) {
    var slots = user.timeslots;
    slots.forEach(function(slot) {
      if (slot.id === offer.timeslot_id) {
        var index = slot.offers.indexOf(offer);
        if (index > -1) {
            slot.offers.splice(index, 1);
        }
      }
    });
  }

  this.deleteTimeslot = function(timeslot) {
    var that = this;
    $http.delete('/timeslots/' + timeslot.id, timeslot)
    .success(function(response){
       that.loadUserGraph();
    });
  }

  this.createTimeslot = function(day, hour) {
    var that = this;
    var dayHour = {
      day: day,
      hour: hour
    };
    console.log(dayHour);
    $http.post('/timeslots', dayHour)
    .success(function(response){
      console.log("in success");
      console.log(response);
       that.loadUserGraph();
    }).error(function(response){
      console.log("in error");
    });
  }


  this.createOffer = function(timeslot) {
    var that = this;
    $http.post('/offers', timeslot)
    .success(function(response){
      var newOffer = response;
      insertOffer(newOffer, that.user);
    }).error(function(response){
      console.log("not in success but getting there!!!");
    });
  };

  this.isClosed = function(timeslot) {
     for( var i = 0; i < timeslot.offers.length; i++) {
        if (timeslot.offers[i].status === true) {
          return true;
        }
     }
  };

}]);




angular.module('barter').controller('TimeslotsController', ['UserService', function(UserService){

   UserService.get({id:4}, function(jsonResponse) {
     this.user = jsonResponse;
   }.bind(this));
}]);

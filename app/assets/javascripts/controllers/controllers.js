angular.module('barter')
  .controller('WelcomeController', ['$routeParams', "UserService", "TalentService", function($routeParams, UserService, TalentService ){
    this.tals = [];
    this.persons = [];
    this.selectedCategory = 'Music';

     UserService.query(function(data) {
      this.persons = data;
      console.log("response", data);
     }.bind(this));

     TalentService.query(function(data) {
      this.tals = data;
      console.log("response", data);
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

  this.categories = ["Art & Music", "Food", "Sport", "Computer"];
  this.experiences = ["novice", "intermediate", "expert"];
  this.ratings = [1, 2, 3, 4, 5];

  this.loadUserGraph = function() {
     UserService.get({id: $routeParams.id}, function(data){
       this.user = data;
       this.user.reputation = {user_id: this.user.id};
     }.bind(this));
   }

   this.loadUserGraph();

  this.saveUser = function(user) {
    console.log(user);
    UserService.update(user);
  };


  this.saveRating = function(){
    $http.post('/reputations', this.user.reputation);
    this.loadUserGraph();
  };

  this.talent = {};
  this.saveTalent = function(){
    TalentService.save(this.talent);
    this.loadUserGraph();
  };

  this.toggleTalentShown = function(talent) {
    talent.isShown = ! talent.isShown;
  };

  this.loadTalentsForUser = function(user) {
    console.log('Hello');
    $http.get('/talents/for_user/' + user.id).
     success(function(data, status, headers, config) {
      this.talents = data;
      console.log(this.talents);
    });
  };

  this.acceptOffer = function(offer) {
    var that = this;
    offer.status = true;
    $http.put('/offers/' + offer.id, offer)
    .success(function(data, status){
      that.loadUserGraph();
      console.log(data);
      console.log(status);
    });
  };

  this.declineOffer = function(offer) {
    var that = this;
    $http.delete('/offers/' + offer.id, offer)
    .success(function(response){
      that.loadUserGraph();
    }).error(function(response){
      console.log(response);
      console.log("we failed");
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

  // his.declineOffer = function(offer) {
  //   var that = this;
  //   $http.delete('/offers/' + offer.id, offer)
  //   .success(function(response){
  //     that.loadUserGraph();
  //   }).error(function(response){
  //     console.log(response);
  //     console.log("we failed");
  //   });
  // };

  this.deleteTimeslot = function(timeslot) {
    console.log(timeslot.id);
    var that = this;
    $http.delete('/timeslots/' + timeslot.id, timeslot)
    .success(function(response){
       that.loadUserGraph();
    });
  }


  this.createOffer = function(timeslot) {
    var that = this;
    console.log("creating offer");
    $http.post('/offers', timeslot)
    .success(function(response){
      var newOffer = response;
      insertOffer(newOffer, that.user);
      console.log(that.user.timeslots);
      console.log("success!!!");
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
  }



  this.convertType = function(type) {
    if (type == "artMusic") {
      return "Art & Music";
    } else if (type == "sport") {
      return "Sports";
    } else if (type == "nuFit") {
      return "Nutrition & Fitness";
    } else if (type == "food") {
      return "Cooking & Baking";
    } else if (type == "compEle") {
      return "Computers & Electronics";
    } else if (type == "homeImp") {
      return "Home Improvement";
    }
  };

}]);




angular.module('barter').controller('TimeslotsController', ['UserService', function(UserService){
   // here you'd put code to e.g.
   // load the timeslots from a service, handle form subsmissions etc
   console.log('TimeslotsController instantiated');
   this.slots = [ "a", "b", "c", "d" ]

   UserService.get({id:4}, function(jsonResponse) {
     this.user = jsonResponse;
     console.log('response', jsonResponse);
   }.bind(this));
}]);

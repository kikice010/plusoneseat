$(document).ready(function() {
    if (typeof $.p1s === 'undefined') {
        $.p1s = {};
    }
    if (typeof $.p1s.user === 'undefined') {
        $.p1s.user = {}
        $.p1s.user.id = 1;
    }
    if (typeof $.p1s.myprofile === 'undefined') {
        $.p1s.myprofile = {};
    }
    if (typeof $.p1s.myprofile.url === 'undefined') {
        $.p1s.myprofile.url = {};
        $.p1s.myprofile.url.fetch_user = "../php/php/api/getProfile.php";
        $.p1s.myprofile.url.fetch_user_meals = "../php/php/api/getMealOfferByHost.php"
    }

    var get_user = $.get( $.p1s.myprofile.url.fetch_user, { id: $.p1s.user.id } );

    // Put the results in a div
    get_user.done(function( data ) {
        var response = jQuery.parseJSON(data);
        var success = response.success;
        if(success) {
            var user = response.user;
            var user_name = user.firstname;
            $.p1s.user.name = user_name;
            var user_last_name = user.lastname;
            user_last_name = user_last_name.substring(0,1) + ".";
            $("#user-name").html(user.firstname + " " + user_last_name);
            $.p1s.user.location = user.city+","+user.country;
            $("#user-location").html($.p1s.user.location);
            $("#user-about").html(user.description);
            $("#user-home-town").html(user.birth_location);
            $("#user-gender").html(user.gender);
            var date = new Date(user.birthday);
            var newDate = date.toString('MMM YYYY');
            $("#user-birthday").val(newDate);

            var languages = response.user_languages;
            languages.forEach(processLanguages);

            var interests = response.user_interests;
            interests.forEach(processInterests);

            var education = response.user_education;
            education.forEach(processEducation)

            var work = response.user_work;
            work.forEach(processWork);
        }
    });



    var get_meals = $.post( $.p1s.myprofile.url.fetch_user_meals, { id: $.p1s.user.id });

    get_meals.done(function( data ) {
        var meals = jQuery.parseJSON(data);
        meals.forEach(processMeal);
        meals.forEach(addPictures);
    });

    function processLanguages(item, index) {
        innerHTML = "<div class='item horizontal-center'><div class='language'>"
        innerHTML += item.language;
        innerHTML += "</div><div class='value'>";
        innerHTML += item.level;
        innerHTML += "</div></div>";
        $('#user-languages').append(innerHTML);                 
    }

    function processInterests(item, index) {
        innerHTML = "<div class='item'>"
        innerHTML += item.interest;
        innerHTML += "</div>";
        if(index%2==0) {
            $('#user-interests-left').append(innerHTML); 
        } else {
            $('#user-interests-right').append(innerHTML); 
        }               
    }

    function processEducation(item, index) {
        innerHTML = "<div class='item'><div class='degree'>"
        innerHTML += item.degree;
        innerHTML += "</div><div class='location'>";
        innerHTML += item.university;
        innerHTML += "</div></div>";
        $('#user-education').append(innerHTML);                 
    }

    function processWork(item, index) {
        innerHTML = "<div class='item'><div class='position'>"
        innerHTML += item.job;
        innerHTML += "</div><div class='location'>";
        innerHTML += item.city+","+item.country;
        innerHTML += "</div></div>";
        $('#user-work').append(innerHTML);                 
    }

    function processMeal(item, index) {
        var innerHTML =  '<div class="result-item" id="user-meal-'+index+'"><div class="item-header"><div class="header-title vertical-center">'
        innerHTML += item.name;
        innerHTML += '</div><div class="price vertical-center">€';
        innerHTML += item.price.price;
        innerHTML += '</div></div><div class="meal-picture"><div class="user-picture"></div><div class="rating"><div class="average">';
        innerHTML += 9;
        innerHTML += '</div><div class="rating-title">Host Rate</div><div class="rew-number">';
        innerHTML += 10;
        innerHTML += ' Reviews</div></div></div><div class="info"><div class="upper"><div class="user"><div class="hosted"><p class="gray-out">Hosted by</p><p class="name">';
        innerHTML += $.p1s.user.name;
        innerHTML += '</p></div><div class="location">';
        innerHTML += $.p1s.user.location;
        innerHTML += '</div></div><div class="donation"><div class="gray-out">Donations</div><div class="value"><div class="chair"></div><div class="number">';
        innerHTML += item.price.number_of_donations;
        innerHTML += '</div><div class="plus">+</div></div></div></div><div class="separator"></div><div class="lower"><div class="cell cell-title">Meal Type</div><div class="cell cell-title">Cuisine</div><div class="cell cell-title">Main Dish Type</div><div class="cell cell-title">Available Seats</div></div><div class="lower"><div class="cell value">';
        innerHTML += getTypeFromInt(parseInt(item.type));
        innerHTML += '</div><div class="cell value">';
        innerHTML += item.cuisine.country;
        innerHTML += '</div><div class="cell value">';
        innerHTML += "To be fixed";
        innerHTML += '</div><div class="cell value">';
        innerHTML += -1;
        innerHTML += '/';
        innerHTML += item.seats.max;
        innerHTML += '</div></div></div></div>';
        $('#other-meals-container').append(innerHTML);
    }

    function addPictures(item, index) {
        var j = Math.round(Math.random()*(item.photo.length - 1));
        var picture = item.photo[j];
        if(typeof picture !== 'undefined') {
            $("#user-meal-"+index+" .meal-picture").attr('style', "background : url(\""+picture+"\") 50% 50% no-repeat;");
        }        
    }

    function getTypeFromInt(number) {
        switch (number) {
            case 1:
                return "Breakfast";
                break;
            case 2:
                return "Brunch";
                break;
            case 3:
                return "Lunch";
                break;
            case 4:
                return "Dinner";
                break;
        }
    }

});

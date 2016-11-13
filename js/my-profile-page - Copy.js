$(document).ready(function() {
    if (typeof $.p1s === 'undefined') {
        $.p1s = {};
    }
    if (typeof $.p1s.userID === 'undefined') {
        $.p1s.userID = 1;
    }
    if (typeof $.p1s.myprofile === 'undefined') {
        $.p1s.myprofile = {};
    }
    if (typeof $.p1s.myprofile.url === 'undefined') {
        $.p1s.myprofile.url = {};
    }
    if (typeof $.p1s.myprofile.url.fetch === 'undefined') {
        $.p1s.myprofile.url.fetch = "http://localhost:8080/plusoneseat/php/php/api/getProfile.php";
    }

    var posting = $.get( $.p1s.myprofile.url.fetch, { id: $.p1s.userID } );

    // Put the results in a div
    posting.done(function( data ) {
        var response = jQuery.parseJSON(data);
        var success = response.success;
        if(success) {
            var user = response.user;
            var user_name = user.firstname;
            var user_last_name = user.lastname;
            user_last_name = user_last_name.substring(0,1) + ".";
            $("#user-name").html(user.firstname + " " + user_last_name);
            $("#user-location").html(user.city+","+user.country);
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

});

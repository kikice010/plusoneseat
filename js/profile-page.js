$(document).ready(function() {
    $(".past-offer").click(function(event) {
        $("#current-past-offer").val("#"+this.id);
        $("#current-past-offer-hide").val("no");
        $("#"+this.id).find(".tabs").show();
    });

    $("html").click(function() {
        if($("#current-past-offer-hide").val() === "yes") {
            $($("#current-past-offer").val()).find(".tabs").hide();
        }
        $("#current-past-offer-hide").val("yes");       
    });

    //to be removed latter
    $.p1s = {}; 
    $.p1s.userID = 1;
    $.p1s.profile = {};
    $.p1s.profile.url = {};
    $.p1s.profile.url.fetch = "../php/php/api/getProfile.php";
    $.p1s.profile.url.save =  "../php/php/api/updateProfile.php";
    $.p1s.profile.country_codes =  $.parseJSON('[{"nicename":"Afghanistan","phonecode":"93"}, {"nicename":"Albania","phonecode":"355"}, {"nicename":"Algeria","phonecode":"213"}, {"nicename":"American Samoa","phonecode":"1684"}, {"nicename":"Andorra","phonecode":"376"}, {"nicename":"Angola","phonecode":"244"}, {"nicename":"Anguilla","phonecode":"1264"}, {"nicename":"Antarctica","phonecode":"0"}, {"nicename":"Antigua and Barbuda","phonecode":"1268"}, {"nicename":"Argentina","phonecode":"54"}, {"nicename":"Armenia","phonecode":"374"}, {"nicename":"Aruba","phonecode":"297"}, {"nicename":"Australia","phonecode":"61"}, {"nicename":"Austria","phonecode":"43"}, {"nicename":"Azerbaijan","phonecode":"994"}, {"nicename":"Bahamas","phonecode":"1242"}, {"nicename":"Bahrain","phonecode":"973"}, {"nicename":"Bangladesh","phonecode":"880"}, {"nicename":"Barbados","phonecode":"1246"}, {"nicename":"Belarus","phonecode":"375"}, {"nicename":"Belgium","phonecode":"32"}, {"nicename":"Belize","phonecode":"501"}, {"nicename":"Benin","phonecode":"229"}, {"nicename":"Bermuda","phonecode":"1441"}, {"nicename":"Bhutan","phonecode":"975"}, {"nicename":"Bolivia","phonecode":"591"}, {"nicename":"Bosnia and Herzegovina","phonecode":"387"}, {"nicename":"Botswana","phonecode":"267"}, {"nicename":"Bouvet Island","phonecode":"0"}, {"nicename":"Brazil","phonecode":"55"}, {"nicename":"British Indian Ocean Territory","phonecode":"246"}, {"nicename":"Brunei Darussalam","phonecode":"673"}, {"nicename":"Bulgaria","phonecode":"359"}, {"nicename":"Burkina Faso","phonecode":"226"}, {"nicename":"Burundi","phonecode":"257"}, {"nicename":"Cambodia","phonecode":"855"}, {"nicename":"Cameroon","phonecode":"237"}, {"nicename":"Canada","phonecode":"1"}, {"nicename":"Cape Verde","phonecode":"238"}, {"nicename":"Cayman Islands","phonecode":"1345"}, {"nicename":"Central African Republic","phonecode":"236"}, {"nicename":"Chad","phonecode":"235"}, {"nicename":"Chile","phonecode":"56"}, {"nicename":"China","phonecode":"86"}, {"nicename":"Christmas Island","phonecode":"61"}, {"nicename":"Cocos (Keeling) Islands","phonecode":"672"}, {"nicename":"Colombia","phonecode":"57"}, {"nicename":"Comoros","phonecode":"269"}, {"nicename":"Congo","phonecode":"242"}, {"nicename":"Congo, the Democratic Republic of the","phonecode":"242"}, {"nicename":"Cook Islands","phonecode":"682"}, {"nicename":"Costa Rica","phonecode":"506"}, {"nicename":"Cote D\'Ivoire","phonecode":"225"}, {"nicename":"Croatia","phonecode":"385"}, {"nicename":"Cuba","phonecode":"53"}, {"nicename":"Cyprus","phonecode":"357"}, {"nicename":"Czech Republic","phonecode":"420"}, {"nicename":"Denmark","phonecode":"45"}, {"nicename":"Djibouti","phonecode":"253"}, {"nicename":"Dominica","phonecode":"1767"}, {"nicename":"Dominican Republic","phonecode":"1809"}, {"nicename":"Ecuador","phonecode":"593"}, {"nicename":"Egypt","phonecode":"20"}, {"nicename":"El Salvador","phonecode":"503"}, {"nicename":"Equatorial Guinea","phonecode":"240"}, {"nicename":"Eritrea","phonecode":"291"}, {"nicename":"Estonia","phonecode":"372"}, {"nicename":"Ethiopia","phonecode":"251"}, {"nicename":"Falkland Islands (Malvinas)","phonecode":"500"}, {"nicename":"Faroe Islands","phonecode":"298"}, {"nicename":"Fiji","phonecode":"679"}, {"nicename":"Finland","phonecode":"358"}, {"nicename":"France","phonecode":"33"}, {"nicename":"French Guiana","phonecode":"594"}, {"nicename":"French Polynesia","phonecode":"689"}, {"nicename":"French Southern Territories","phonecode":"0"}, {"nicename":"Gabon","phonecode":"241"}, {"nicename":"Gambia","phonecode":"220"}, {"nicename":"Georgia","phonecode":"995"}, {"nicename":"Germany","phonecode":"49"}, {"nicename":"Ghana","phonecode":"233"}, {"nicename":"Gibraltar","phonecode":"350"}, {"nicename":"Greece","phonecode":"30"}, {"nicename":"Greenland","phonecode":"299"}, {"nicename":"Grenada","phonecode":"1473"}, {"nicename":"Guadeloupe","phonecode":"590"}, {"nicename":"Guam","phonecode":"1671"}, {"nicename":"Guatemala","phonecode":"502"}, {"nicename":"Guinea","phonecode":"224"}, {"nicename":"Guinea-Bissau","phonecode":"245"}, {"nicename":"Guyana","phonecode":"592"}, {"nicename":"Haiti","phonecode":"509"}, {"nicename":"Heard Island and Mcdonald Islands","phonecode":"0"}, {"nicename":"Holy See (Vatican City State)","phonecode":"39"}, {"nicename":"Honduras","phonecode":"504"}, {"nicename":"Hong Kong","phonecode":"852"}, {"nicename":"Hungary","phonecode":"36"}, {"nicename":"Iceland","phonecode":"354"}, {"nicename":"India","phonecode":"91"}, {"nicename":"Indonesia","phonecode":"62"}, {"nicename":"Iran, Islamic Republic of","phonecode":"98"}, {"nicename":"Iraq","phonecode":"964"}, {"nicename":"Ireland","phonecode":"353"}, {"nicename":"Israel","phonecode":"972"}, {"nicename":"Italy","phonecode":"39"}, {"nicename":"Jamaica","phonecode":"1876"}, {"nicename":"Japan","phonecode":"81"}, {"nicename":"Jordan","phonecode":"962"}, {"nicename":"Kazakhstan","phonecode":"7"}, {"nicename":"Kenya","phonecode":"254"}, {"nicename":"Kiribati","phonecode":"686"}, {"nicename":"Korea, Democratic People\'s Republic of","phonecode":"850"}, {"nicename":"Korea, Republic of","phonecode":"82"}, {"nicename":"Kuwait","phonecode":"965"}, {"nicename":"Kyrgyzstan","phonecode":"996"}, {"nicename":"Lao People\'s Democratic Republic","phonecode":"856"}, {"nicename":"Latvia","phonecode":"371"}, {"nicename":"Lebanon","phonecode":"961"}, {"nicename":"Lesotho","phonecode":"266"}, {"nicename":"Liberia","phonecode":"231"}, {"nicename":"Libyan Arab Jamahiriya","phonecode":"218"}, {"nicename":"Liechtenstein","phonecode":"423"}, {"nicename":"Lithuania","phonecode":"370"}, {"nicename":"Luxembourg","phonecode":"352"}, {"nicename":"Macao","phonecode":"853"}, {"nicename":"Macedonia, the Former Yugoslav Republic of","phonecode":"389"}, {"nicename":"Madagascar","phonecode":"261"}, {"nicename":"Malawi","phonecode":"265"}, {"nicename":"Malaysia","phonecode":"60"}, {"nicename":"Maldives","phonecode":"960"}, {"nicename":"Mali","phonecode":"223"}, {"nicename":"Malta","phonecode":"356"}, {"nicename":"Marshall Islands","phonecode":"692"}, {"nicename":"Martinique","phonecode":"596"}, {"nicename":"Mauritania","phonecode":"222"}, {"nicename":"Mauritius","phonecode":"230"}, {"nicename":"Mayotte","phonecode":"269"}, {"nicename":"Mexico","phonecode":"52"}, {"nicename":"Micronesia, Federated States of","phonecode":"691"}, {"nicename":"Moldova, Republic of","phonecode":"373"}, {"nicename":"Monaco","phonecode":"377"}, {"nicename":"Mongolia","phonecode":"976"}, {"nicename":"Montserrat","phonecode":"1664"}, {"nicename":"Morocco","phonecode":"212"}, {"nicename":"Mozambique","phonecode":"258"}, {"nicename":"Myanmar","phonecode":"95"}, {"nicename":"Namibia","phonecode":"264"}, {"nicename":"Nauru","phonecode":"674"}, {"nicename":"Nepal","phonecode":"977"}, {"nicename":"Netherlands","phonecode":"31"}, {"nicename":"Netherlands Antilles","phonecode":"599"}, {"nicename":"New Caledonia","phonecode":"687"}, {"nicename":"New Zealand","phonecode":"64"}, {"nicename":"Nicaragua","phonecode":"505"}, {"nicename":"Niger","phonecode":"227"}, {"nicename":"Nigeria","phonecode":"234"}, {"nicename":"Niue","phonecode":"683"}, {"nicename":"Norfolk Island","phonecode":"672"}, {"nicename":"Northern Mariana Islands","phonecode":"1670"}, {"nicename":"Norway","phonecode":"47"}, {"nicename":"Oman","phonecode":"968"}, {"nicename":"Pakistan","phonecode":"92"}, {"nicename":"Palau","phonecode":"680"}, {"nicename":"Palestinian Territory, Occupied","phonecode":"970"}, {"nicename":"Panama","phonecode":"507"}, {"nicename":"Papua New Guinea","phonecode":"675"}, {"nicename":"Paraguay","phonecode":"595"}, {"nicename":"Peru","phonecode":"51"}, {"nicename":"Philippines","phonecode":"63"}, {"nicename":"Pitcairn","phonecode":"0"}, {"nicename":"Poland","phonecode":"48"}, {"nicename":"Portugal","phonecode":"351"}, {"nicename":"Puerto Rico","phonecode":"1787"}, {"nicename":"Qatar","phonecode":"974"}, {"nicename":"Reunion","phonecode":"262"}, {"nicename":"Romania","phonecode":"40"}, {"nicename":"Russian Federation","phonecode":"70"}, {"nicename":"Rwanda","phonecode":"250"}, {"nicename":"Saint Helena","phonecode":"290"}, {"nicename":"Saint Kitts and Nevis","phonecode":"1869"}, {"nicename":"Saint Lucia","phonecode":"1758"}, {"nicename":"Saint Pierre and Miquelon","phonecode":"508"}, {"nicename":"Saint Vincent and the Grenadines","phonecode":"1784"}, {"nicename":"Samoa","phonecode":"684"}, {"nicename":"San Marino","phonecode":"378"}, {"nicename":"Sao Tome and Principe","phonecode":"239"}, {"nicename":"Saudi Arabia","phonecode":"966"}, {"nicename":"Senegal","phonecode":"221"}, {"nicename":"Serbia and Montenegro","phonecode":"381"}, {"nicename":"Seychelles","phonecode":"248"}, {"nicename":"Sierra Leone","phonecode":"232"}, {"nicename":"Singapore","phonecode":"65"}, {"nicename":"Slovakia","phonecode":"421"}, {"nicename":"Slovenia","phonecode":"386"}, {"nicename":"Solomon Islands","phonecode":"677"}, {"nicename":"Somalia","phonecode":"252"}, {"nicename":"South Africa","phonecode":"27"}, {"nicename":"South Georgia and the South Sandwich Islands","phonecode":"0"}, {"nicename":"Spain","phonecode":"34"}, {"nicename":"Sri Lanka","phonecode":"94"}, {"nicename":"Sudan","phonecode":"249"}, {"nicename":"Suriname","phonecode":"597"}, {"nicename":"Svalbard and Jan Mayen","phonecode":"47"}, {"nicename":"Swaziland","phonecode":"268"}, {"nicename":"Sweden","phonecode":"46"}, {"nicename":"Switzerland","phonecode":"41"}, {"nicename":"Syrian Arab Republic","phonecode":"963"}, {"nicename":"Taiwan, Province of China","phonecode":"886"}, {"nicename":"Tajikistan","phonecode":"992"}, {"nicename":"Tanzania, United Republic of","phonecode":"255"}, {"nicename":"Thailand","phonecode":"66"}, {"nicename":"Timor-Leste","phonecode":"670"}, {"nicename":"Togo","phonecode":"228"}, {"nicename":"Tokelau","phonecode":"690"}, {"nicename":"Tonga","phonecode":"676"}, {"nicename":"Trinidad and Tobago","phonecode":"1868"}, {"nicename":"Tunisia","phonecode":"216"}, {"nicename":"Turkey","phonecode":"90"}, {"nicename":"Turkmenistan","phonecode":"7370"}, {"nicename":"Turks and Caicos Islands","phonecode":"1649"}, {"nicename":"Tuvalu","phonecode":"688"}, {"nicename":"Uganda","phonecode":"256"}, {"nicename":"Ukraine","phonecode":"380"}, {"nicename":"United Arab Emirates","phonecode":"971"}, {"nicename":"United Kingdom","phonecode":"44"}, {"nicename":"United States","phonecode":"1"}, {"nicename":"United States Minor Outlying Islands","phonecode":"1"}, {"nicename":"Uruguay","phonecode":"598"}, {"nicename":"Uzbekistan","phonecode":"998"}, {"nicename":"Vanuatu","phonecode":"678"}, {"nicename":"Venezuela","phonecode":"58"}, {"nicename":"Viet Nam","phonecode":"84"}, {"nicename":"Virgin Islands, British","phonecode":"1284"}, {"nicename":"Virgin Islands, U.s.","phonecode":"1340"}, {"nicename":"Wallis and Futuna","phonecode":"681"}, {"nicename":"Western Sahara","phonecode":"212"}, {"nicename":"Yemen","phonecode":"967"}, {"nicename":"Zambia","phonecode":"260"}, {"nicename":"Zimbabwe","phonecode":"263"}, {"nicename":"Serbia","phonecode":"381"}, {"nicename":"Asia \/ Pacific Region","phonecode":"0"}, {"nicename":"Montenegro","phonecode":"382"}, {"nicename":"Aland Islands","phonecode":"358"}, {"nicename":"Bonaire, Sint Eustatius and Saba","phonecode":"599"}, {"nicename":"Curacao","phonecode":"599"}, {"nicename":"Guernsey","phonecode":"44"}, {"nicename":"Isle of Man","phonecode":"44"}, {"nicename":"Jersey","phonecode":"44"}, {"nicename":"Kosovo","phonecode":"381"}, {"nicename":"Saint Barthelemy","phonecode":"590"}, {"nicename":"Saint Martin","phonecode":"590"}, {"nicename":"Sint Maarten","phonecode":"1"}, {"nicename":"South Sudan","phonecode":"211"}]');
    $.p1s.profile.languages = $.parseJSON('[{"name":"Finnish"}, {"name":"Fiji"}, {"name":"Faeroese"}, {"name":"French"}, {"name":"Frisian"}, {"name":"Irish"}, {"name":"Scots\/Gaelic"}, {"name":"Galician"}, {"name":"Guarani"}, {"name":"Gujarati"}, {"name":"Hausa"}, {"name":"Hindi"}, {"name":"Croatian"}, {"name":"Hungarian"}, {"name":"Armenian"}, {"name":"Interlingua"}, {"name":"Interlingue"}, {"name":"Inupiak"}, {"name":"Indonesian"}, {"name":"Icelandic"}, {"name":"Italian"}, {"name":"Hebrew"}, {"name":"Japanese"}, {"name":"Yiddish"}, {"name":"Javanese"}, {"name":"Georgian"}, {"name":"Kazakh"}, {"name":"Greenlandic"}, {"name":"Cambodian"}, {"name":"Kannada"}, {"name":"Korean"}, {"name":"Kashmiri"}, {"name":"Kurdish"}, {"name":"Kirghiz"}, {"name":"Latin"}, {"name":"Lingala"}, {"name":"Laothian"}, {"name":"Lithuanian"}, {"name":"Latvian\/Lettish"}, {"name":"Malagasy"}, {"name":"Maori"}, {"name":"Macedonian"}, {"name":"Malayalam"}, {"name":"Mongolian"}, {"name":"Moldavian"}, {"name":"Marathi"}, {"name":"Malay"}, {"name":"Maltese"}, {"name":"Burmese"}, {"name":"Nauru"}, {"name":"Nepali"}, {"name":"Dutch"}, {"name":"Norwegian"}, {"name":"Occitan"}, {"name":"(Afan)\/Oromoor\/Oriya"}, {"name":"Punjabi"}, {"name":"Polish"}, {"name":"Pashto\/Pushto"}, {"name":"Portuguese"}, {"name":"Quechua"}]');
    $.p1s.profile.language_levels = $.parseJSON('[{"level":"Beginner"},{"level":"Elementary"},{"level":"Intermediate"},{"level":"Upper Intermediate"},{"level":"Advanced"},{"level":"Proficient"},{"level":"Mother Tongue"}]');
    $.p1s.profile.interests = $.parseJSON('[{"interest":"Sports"}, {"interest":"Music"}, {"interest":"Science"}, {"interest":"Technology"}, {"interest":"Education"}, {"interest":"Games"}, {"interest":"Animals"}, {"interest":"Art"}, {"interest":"Design"}, {"interest":"Automobiles"}, {"interest":"Economics"}, {"interest":"Movies"}, {"interest":"Social"}, {"interest":"Responsibilities"}, {"interest":"Entettainment"}, {"interest":"Food"}, {"interest":"Politics"}, {"interest":"All"}]');
    $.p1s.profile.user = {};
    $.p1s.profile.user.languages_number = 0;
    $.p1s.profile.user.phones_number = 0;
    $.p1s.profile.user.interests_number = 0;
    $.p1s.profile.user.works_number = 0;
    $.p1s.profile.user.educations_number = 0;
    $.p1s.profile.user.photo = "";
});

$(function(){
    $('#profile>a').click(function() {
        var contentLoaded = $.p1s.profile.contentLoaded;
        if(contentLoaded==null) {

            var posting = $.get( $.p1s.profile.url.fetch, { id: $.p1s.userID } );
 
            // Put the results in a div
            posting.done(function( data ) {
                var response = jQuery.parseJSON(data);
                var success = response.success;
                if(success) {
                    var user = response.user;
                    $("#field-first-name").val(user.firstname);
                    $("#field-last-name").val(user.lastname);
                    $("#field-location").val(user.city+","+user.country);
                    $("#field-email").val(user.email);
                    $("#field-description").val(user.description);
                    $("#field-first-name").val(user.firstname);
                    $("#field-gender").val(user.gender);
                    $("#field-birth-place").val(user.birth_location);


                    var date = user.birthday;
                    var year = date.substring(0,4);
                    var month = date.substring(5,7);
                    var day = date.substring(8,11);

                    $("#field-year").val(year);
                    $("#field-month").val(month);
                    $("#field-day").val(day);

                    var education = response.user_education;
                    prepareEducationDOM(education.length+1);
                    education.forEach(processEducation);

                    var work = response.user_work;
                    prepareWorkDOM(work.length+1);
                    work.forEach(processWork);

                    var phones = response.user_phonenumbers;
                    preparePhonesDOM(phones.length+1);
                    phones.forEach(processPhones);

                    var languages = response.user_languages;
                    prepareLanguagesDOM(languages.length+1);
                    languages.forEach(processLanguages);

                    var interests = response.user_interests;
                    prepareInterestsDOM(interests.length+1);
                    interests.forEach(processInterests);

                    $.p1s.profile.user.languages_number = languages.length+1;
                    $.p1s.profile.user.phones_number = phones.length+1;
                    $.p1s.profile.user.interests_number = interests.length+1;
                    $.p1s.profile.user.works_number = work.length+1;
                    $.p1s.profile.user.educations_number = education.length+1;
                }
            });
        }
    });

    $('#uploadBtn').click(function(e) {
        $(this).find('input[type="file"]').click();
    });

    $('#uploadBtn input').click(function(e) {
        e.stopPropagation();
    });

    $('#picture-file-input').change(function() {
      var files = document.getElementById('picture-file-input').files;
      if (files.length > 0) {
        getBase64(files[0]);
      }
    });

    function getBase64(file) {
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            $.p1s.profile.user.photo = reader.result;
            $('.userImage-holder .userImage-back').attr('style', "background : url(\""+$.p1s.profile.user.photo+"\") 50% 50% no-repeat;");
            $('.userImage-holder .userImage-front').attr('style', "background : url(\""+$.p1s.profile.user.photo+"\") 50% 50% no-repeat;");
        }
        reader.onerror = function (error) {
            console.log('Error: ', error);
        };
    };

    $('#upload-button').click(function() {
        var data = {};
        data.user = {};
        data.user.firstname =  $("#field-first-name").val();
        data.user.lastname =  $("#field-last-name").val();
        data.user.location =  $("#field-location").val();
        data.user.email =  $("#field-email").val();
        data.user.description = $("#field-description").val();
        data.user.firstname = $("#field-first-name").val();
        data.user.gender = $("#field-gender").val();
        data.user.birth_location = $("#field-birth-place").val();
        data.user.birthday = $("#field-year").val() +"-"+ $("#field-month").val() +"-"+ $("#field-day").val();

        var item;
        var education = [];
        for(var i=0; i<$.p1s.profile.user.educations_number; i++) {
            item = {};
            item.degree = $("#field-degree-"+(i+1)).val();
            item.university$ = $("#field-university-"+(i+1)).val();
            education.push(item);
        }

        var index;
        var string;
        var work = [];
        for(var i=1; i<$.p1s.profile.user.works_number; i++) {
            item = {};
            item.job = $("#field-work-"+i).val();
            string = $("#field-work-location-"+i).val();
            index = string.indexOf(",");
            item.city = string.substring(0,index);
            item.country = string.substring(index+1,string.length);
            if(item.city.length > 0 && ite.country.length > 0 && item.job.length > 0) {
                work.push(item);
            }
        }

        var interests = [];
        for(var i=1; i<$.p1s.profile.user.interests_number+1; i++) {
            item = {};
            item.interest = $("#field-interest-"+i).val();
            if(item.interest.length > 0 ) {
                interests.push(item);
            }
        }

        var languages = [];
        for(var i=1; i<$.p1s.profile.user.languages_number+1; i++) {
            item = {};
            item.level = $("#field-language-level-"+i).val();
            item.language = $("#field-language-"+i).val();
            languages.push(item);
            if(item.level.length > 0 && ite.language.length > 0 ) {
                interests.push(item);
            }
        }

        var phones = [];
        for(var i=0; i<$.p1s.profile.user.phones_number; i++) {
            item = {};
            item.code = $("#field-country-code-"+i).val();
            item.phone = $("#field-phone-"+i).val();
            phones.push(item);
            if(item.level.length > 0 && ite.language.length > 0 ) {
                interests.push(item);
            }
        }

        data.user_education = education;
        data.user_work = work;
        data.user_phones = phones;
        data.user_languages = languages;
        data.user_interests = interests;

        $.get( $.p1s.profile.url.save,  data );
    });

    function prepareEducationDOM(size) {
        $('#educationSelectionContainer').html("<label for='educationSelection' class='col-xs-2'>Education</label>");
        for(var i=1; i<size+1; i++)
        {
            innerHTML = "<input type='text' id='field-degree-"+i+"' placeholder='Degree'>";  
            innerHTML += "<input type='text' id='field-university-"+i+"' placeholder='University'>";
            innerHTML += "<button type='button' class='close p1s-close' id='field-education-close-"+i+"' aria-label='Close'>";
            innerHTML += "<span aria-hidden='true'>&times;</span></button>";
            $('#educationSelectionContainer').append(innerHTML);

            $('#field-education-close-'+i).click(function() {
                var id = $(this).attr('id');
                var index = id.substring(22);
                $('#field-education-close-'+index).remove();
                $('#field-degree-'+index).remove();
                $('#field-university-'+index).remove();
            });
        }
    }

    function processEducation(item, index) {
        var logicalIndex = index+1;
        $("#field-degree-"+logicalIndex).val(item.degree);
        $("#field-university-"+logicalIndex).val(item.university);
    }

    function prepareWorkDOM(size) {
        $('#workSelectionContainer').html("<label for='educationSelection' class='col-xs-2'>Work</label>");
        for(var i=1; i<size+1; i++)
        {
            innerHTML = "<input type='text' id='field-work-"+i+"' placeholder='Degree'>";  
            innerHTML += "<input type='text' id='field-work-location-"+i+"' placeholder='University'>";
            innerHTML += "<button type='button' class='close p1s-close' id='field-work-close-"+i+"' aria-label='Close'>";
            innerHTML += "<span aria-hidden='true'>&times;</span></button>";
            $('#workSelectionContainer').append(innerHTML);

            $('#field-work-close-'+i).click(function() {
                var id = $(this).attr('id');
                var index = id.substring(17);
                $('#field-work-close-'+index).remove();
                $('#field-work-'+index).remove();
                $('#field-work-location-'+index).remove();
            });
        }   
    }

    function processWork(item, index) {
        var logicalIndex = index+1;
        $("#field-work-"+logicalIndex).val(item.job);
        $("#field-work-location-"+logicalIndex).val(item.city+","+item.country);
    }    

    function preparePhonesDOM(size) {
        $('#field-phones-group').html("");
        var innerHTML = "";
        var current;
        for(var i=1; i<size+1; i++) {
            innerHTML = "<select id='field-country-code-"+i+"'>";
            for(var j=0; j<$.p1s.profile.country_codes.length; j++) {
                current = $.p1s.profile.country_codes[j];
                innerHTML += "<option value=+"+current.phonecode+">"+current.nicename+"(+"+current.phonecode+")"+"</option>";
            }
            innerHTML += "</select>";  
            innerHTML += "<input type='text' id='field-phone-"+i+"'>";
            innerHTML += "<button type='button' class='close p1s-close' id='field-phone-close-"+i+"' aria-label='Close'>";
            innerHTML += "<span aria-hidden='true'>&times;</span></button>";
            $('#field-phones-group').append(innerHTML);            

            $('#field-phone-close-'+i).click(function() {
                var id = $(this).attr('id');
                var index = id.substring(18);
                $('#field-phone-close-'+index).remove();
                $('#field-phone-'+index).remove();
                $('#field-country-code-'+index).remove();
            });
        }
    }

    function processPhones(item, index) {
        var logicalIndex = index+1;
        $("#field-country-code-"+logicalIndex).val("+"+item.country_code);
        $("#field-phone-"+logicalIndex).val(item.number);
    } 

    function prepareLanguagesDOM(size) {
        $('#field-languages-group').html("");
        var innerHTML = "";
        var current;
        for(var i=1; i<size; i++) {
            innerHTML= "<select id='field-language-"+i+"'>";
            for(var j=0; j<$.p1s.profile.languages.length; j++) {
                current = $.p1s.profile.languages[j];
                innerHTML += "<option value="+current.name+">"+current.name+"</option>";
            }
            innerHTML += "</select>";
            innerHTML += "<select id='field-language-level-"+i+"'>";
            for(var j=0; j<$.p1s.profile.language_levels.length; j++) {
                current = $.p1s.profile.language_levels[j];
                innerHTML += "<option value="+current.level+">"+current.level+"</option>";
            }
            innerHTML += "</select>";  
            innerHTML += "<button type='button' class='close p1s-close' id='field-language-close-"+i+"' aria-label='Close'>";
            innerHTML += "<span aria-hidden='true'>&times;</span></button>";
            $('#field-languages-group').append(innerHTML);            

            $('#field-language-close-'+i).click(function() {
                var id = $(this).attr('id');
                var index = id.substring(22);
                $('#field-language-close-'+index).remove();
                $('#field-language-'+index).remove();
                $('#field-language-level-'+index).remove();
            });
        }        
    }

    function processLanguages(item, index) {
        var logicalIndex = index+1;
        $("#field-language-level-"+logicalIndex).val(item.level);
        $("#field-language-"+logicalIndex).val(item.language);
    }

    function prepareInterestsDOM(size) {
        $('#field-interests-group').html("");
        var innerHTML = "";
        var current;
        for(var i=1; i<size+1; i++) {
            innerHTML="<select id='field-interest-"+i+"'>";
            for(var j=0; j<$.p1s.profile.interests.length; j++) {
                current = $.p1s.profile.interests[j];
                innerHTML=innerHTML+"<option value="+current.interest+">"+current.interest+"</option>";
            }
            innerHTML=innerHTML+"</select>";
            innerHTML += "<button type='button' class='close p1s-close' id='field-interest-close-"+i+"' aria-label='Close'>";
            innerHTML += "<span aria-hidden='true'>&times;</span></button>";
            $('#field-interests-group').append(innerHTML);            

            $('#field-interest-close-'+i).click(function() {
                var id = $(this).attr('id');
                var index = id.substring(21);
                $('#field-interest-close-'+index).remove();
                $('#field-interest-'+index).remove();
            });
        }
    }

    function processInterests(item, index) {
        var logicalIndex = index+1;
        $("#field-interest-"+logicalIndex).val(item.interest);
    } 

    $('#phoneNumberBtn').click(function() {
        var innerHTML = "<select class='col-xs-3' id='field-country-code-";
        innerHTML += $.p1s.profile.user.phones_number+"'>";
        for(var j=0; j<$.p1s.profile.country_codes.length; j++) {
            current = $.p1s.profile.country_codes.countries[j];
            innerHTML += "<option value="+current.phonecode+">"+current.nicename+"("+current.phonecode+")"+"</option>";
        }
        innerHTML += "</select>";  
        innerHTML += "<input type='text' class='col-xs-2' id='field-phone-'";
        innerHTML += $.p1s.profile.user.phones_number+"'>";
        innerHTML += "<button type='button' class='close p1s-close' id='field-phone-close-";
        innerHTML += $.p1s.profile.user.phones_number;
        innerHTML += "' aria-label='Close'>";
        innerHTML += "<span aria-hidden='true'>&times;</span></button>"; 
        $('#phoneSelectionContainer').append(innerHTML);

        var select = $('#field-country-code-'+$.p1s.profile.user.languages_number);
        var level = $('#field-phone-'+$.p1s.profile.user.languages_number);
        var close = $('#field-phone-close-'+$.p1s.profile.user.languages_number);
        close.click(function() {
            select.remove();
            level.remove();
            close.remove();
        }); 
        $.p1s.profile.user.phones_number++;
    });

    $('#languageBtn').click(function() {
        innerHTML= "<select id='field-language-"+$.p1s.profile.user.languages_number+"'>";
        for(var j=0; j<$.p1s.profile.languages.length; j++) {
            current = $.p1s.profile.languages[j];
            innerHTML += "<option value="+current.name+">"+current.name+"</option>";
        }
        innerHTML += "</select>";
        innerHTML += "<select id='field-language-level-"+$.p1s.profile.user.languages_number+"'>";
        for(var j=0; j<$.p1s.profile.language_levels.length; j++) {
            current = $.p1s.profile.language_levels[j];
            innerHTML += "<option value="+current.level+">"+current.level+"</option>";
        }
        innerHTML += "</select>";  
        innerHTML += "<button type='button' class='close p1s-close' id='field-phone-close-"+$.p1s.profile.user.languages_number+"' aria-label='Close'>";
        innerHTML += "<span aria-hidden='true'>&times;</span></button>";
        $('#field-languages-group').append(innerHTML);

        var select = $('#field-language-'+$.p1s.profile.user.languages_number);
        var level = $('#field-language-level-'+$.p1s.profile.user.languages_number);
        var close = $('#field-language-close-'+$.p1s.profile.user.languages_number);
        close.click(function() {
            select.remove();
            level.remove();
            close.remove();
        });  
        $.p1s.profile.user.languages_number++; 
    });

    $('#interestsBtn').click(function() {
        var innerHTML;
        innerHTML = "<select class='interest-select' id='field-interest-";
        innerHTML += $.p1s.profile.user.interests_number+"'>";
        for(var j=0; j<$.p1s.profile.interests.length; j++) {
            current = $.p1s.profile.interests[j];
            innerHTML=innerHTML+"<option value="+current.interest+">"+current.interest+"</option>";
        }
        innerHTML=innerHTML+"</select>";
        innerHTML += "<button type='button' class='close p1s-close' id='field-interest-close-";
        innerHTML += $.p1s.profile.user.interests_number;
        innerHTML += "' aria-label='Close'>";
        innerHTML += "<span aria-hidden='true'>&times;</span></button>";
        $('#field-interests-group').append(innerHTML);

        var select = $('#field-interest-'+$.p1s.profile.user.interests_number);
        var close = $('#field-interest-close-'+$.p1s.profile.user.interests_number);
        close.click(function() {
            select.remove();
            close.remove();
        });
        $.p1s.profile.user.interests_number++; 
    });

    $('#educationBtn').click(function() {
        var innerHTML;
        innerHTML = "<input type='text' id='field-degree-";
        innerHTML += $.p1s.profile.user.educations_number;
        innerHTML += "' placeholder='Degree'>"; 
        innerHTML += "<input type='text' id='field-university-";
        innerHTML += $.p1s.profile.user.educations_number;
        innerHTML += "' placeholder='University'>";
        innerHTML += "<button type='button' class='close p1s-close' id='field-education-close-";
        innerHTML += $.p1s.profile.user.educations_number;
        innerHTML += "' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
        $('#educationSelectionContainer').append(innerHTML);

        var degree = $('#field-degree-'+$.p1s.profile.user.educations_number);
        var university = $('#field-university-'+$.p1s.profile.user.educations_number);
        var close = $('#field-education-close-'+$.p1s.profile.user.educations_number);
        close.click(function() {
            degree.remove();
            university.remove();
            close.remove();
        });
        $.p1s.profile.user.educations_number++; 
    });

    $('#workBtn').click(function() {
        var innerHTML;
        innerHTML = "<input type='text' id='field-work-";
        innerHTML += $.p1s.profile.user.works_number;
        innerHTML += "' placeholder='Position'>"; 
        innerHTML += "<input type='text' id='field-work-location-";
        innerHTML += $.p1s.profile.user.works_number;
        innerHTML += "' placeholder='Office location'>";
        innerHTML += "<button type='button' class='close p1s-close' id='field-work-close-";
        innerHTML += $.p1s.profile.user.works_number;
        innerHTML += "' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";       
        $('#workSelectionContainer').append(innerHTML);

        var work = $('#field-work-'+$.p1s.profile.user.works_number);
        var location = $('#field-work-location-'+$.p1s.profile.user.works_number);
        var close = $('#field-work-close-'+$.p1s.profile.user.works_number);
        close.click(function() {
            work.remove();
            location.remove();
            close.remove();
        });

        $.p1s.profile.user.works_number++; 
    });
});

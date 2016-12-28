$(document).ready(function() {
    if (typeof $.p1s === 'undefined') {
        $.p1s = {};
    }
    if (typeof $.p1s.userID === 'undefined') {
        $.p1s.userID = 1;
    }
    if (typeof $.p1s.createmeal === 'undefined') {
        $.p1s.createmeal = {};
    }
    if (typeof $.p1s.createmeal.url === 'undefined') {
        $.p1s.createmeal.url = {};
        $.p1s.createmeal.url.fetch = "http://localhost:8080/plusoneseat/php/php/api/getProfile.php";
    }
    if (typeof $.p1s.createmeal.data === 'undefined') {
        $.p1s.createmeal.data = {};
    }
    if (typeof $.p1s.createmeal.data.countries === 'undefined') {
        $.p1s.createmeal.data.countries = {};
        $.p1s.createmeal.data.countries.africa = $.parseJSON('[{"nicename":"Algeria"}, {"nicename":"Angola"}, {"nicename":"Benin"}, {"nicename":"Botswana"}, {"nicename":"British Indian Ocean Territory"}, {"nicename":"Burkina Faso"}, {"nicename":"Burundi"}, {"nicename":"Cameroon"}, {"nicename":"Cape Verde"}, {"nicename":"Central African Republic"}, {"nicename":"Chad"}, {"nicename":"Comoros"}, {"nicename":"Congo"}, {"nicename":"Congo, the Democratic Republic of the"}, {"nicename":"Cote D`Ivoire"}, {"nicename":"Djibouti"}, {"nicename":"Egypt"}, {"nicename":"Equatorial Guinea"}, {"nicename":"Eritrea"}, {"nicename":"Ethiopia"}, {"nicename":"Gabon"}, {"nicename":"Gambia"}, {"nicename":"Ghana"}, {"nicename":"Guinea"}, {"nicename":"Guinea-Bissau"}, {"nicename":"Kenya"}, {"nicename":"Lesotho"}, {"nicename":"Liberia"}, {"nicename":"Libyan Arab Jamahiriya"}, {"nicename":"Madagascar"}, {"nicename":"Malawi"}, {"nicename":"Mali"}, {"nicename":"Mauritania"}, {"nicename":"Mauritius"}, {"nicename":"Morocco"}, {"nicename":"Mozambique"}, {"nicename":"Namibia"}, {"nicename":"Niger"}, {"nicename":"Nigeria"}, {"nicename":"Reunion"}, {"nicename":"Rwanda"}, {"nicename":"Saint Helena"}, {"nicename":"Sao Tome and Principe"}, {"nicename":"Senegal"}, {"nicename":"Seychelles"}, {"nicename":"Sierra Leone"}, {"nicename":"Somalia"}, {"nicename":"South Africa"}, {"nicename":"Sudan"}, {"nicename":"Swaziland"}, {"nicename":"Tanzania, United Republic of"}, {"nicename":"Togo"}, {"nicename":"Uganda"}, {"nicename":"Western Sahara"}, {"nicename":"Zambia"}, {"nicename":"Zimbabwe"}, {"nicename":"South Sudan"}]');
        $.p1s.createmeal.data.countries.antarctica = $.parseJSON('[{"nicename":"Antarctica"}, {"nicename":"French Southern Territories"}, {"nicename":"Heard Island and Mcdonald Islands"}, {"nicename":"South Georgia and the South Sandwich Islands"}]');
        $.p1s.createmeal.data.countries.asia = $.parseJSON('[{"nicename":"Afghanistan"}, {"nicename":"Bahrain"}, {"nicename":"Bangladesh"}, {"nicename":"Bhutan"}, {"nicename":"Brunei Darussalam"}, {"nicename":"Cambodia"}, {"nicename":"China"}, {"nicename":"Hong Kong"}, {"nicename":"India"}, {"nicename":"Indonesia"}, {"nicename":"Iran, Islamic Republic of"}, {"nicename":"Iraq"}, {"nicename":"Israel"}, {"nicename":"Japan"}, {"nicename":"Jordan"}, {"nicename":"Kazakhstan"}, {"nicename":"Korea, Democratic People`s Republic of"}, {"nicename":"Korea, Republic of"}, {"nicename":"Kuwait"}, {"nicename":"Kyrgyzstan"}, {"nicename":"Lao People`s Democratic Republic"}, {"nicename":"Lebanon"}, {"nicename":"Macao"}, {"nicename":"Malaysia"}, {"nicename":"Maldives"}, {"nicename":"Mayotte"}, {"nicename":"Mongolia"}, {"nicename":"Myanmar"}, {"nicename":"Nepal"}, {"nicename":"Oman"}, {"nicename":"Pakistan"}, {"nicename":"Palestinian Territory, Occupied"}, {"nicename":"Philippines"}, {"nicename":"Qatar"}, {"nicename":"Saudi Arabia"}, {"nicename":"Singapore"}, {"nicename":"Sri Lanka"}, {"nicename":"Syrian Arab Republic"}, {"nicename":"Taiwan, Province of China"}, {"nicename":"Tajikistan"}, {"nicename":"Thailand"}, {"nicename":"Timor-Leste"}, {"nicename":"Tunisia"}, {"nicename":"Turkmenistan"}, {"nicename":"United Arab Emirates"}, {"nicename":"Uzbekistan"}, {"nicename":"Vietnam"}, {"nicename":"Yemen"}, {"nicename":"Asia / Pacific Region"}]');
        $.p1s.createmeal.data.countries.australia = $.parseJSON('[{"nicename":"American Samoa"}, {"nicename":"Australia"}, {"nicename":"Christmas Island"}, {"nicename":"Cocos (Keeling) Islands"}, {"nicename":"Cook Islands"}, {"nicename":"Fiji"}, {"nicename":"French Polynesia"}, {"nicename":"Guam"}, {"nicename":"Kiribati"}, {"nicename":"Marshall Islands"}, {"nicename":"Micronesia, Federated States of"}, {"nicename":"Nauru"}, {"nicename":"New Caledonia"}, {"nicename":"New Zealand"}, {"nicename":"Niue"}, {"nicename":"Norfolk Island"}, {"nicename":"Northern Mariana Islands"}, {"nicename":"Palau"}, {"nicename":"Papua New Guinea"}, {"nicename":"Pitcairn"}, {"nicename":"Samoa"}, {"nicename":"Solomon Islands"}, {"nicename":"Tokelau"}, {"nicename":"Tonga"}, {"nicename":"Tuvalu"}, {"nicename":"United States Minor Outlying Islands"}, {"nicename":"Vanuatu"}, {"nicename":"Wallis and Futuna"}]');
        $.p1s.createmeal.data.countries.europe = $.parseJSON('[{"nicename":"Albania"}, {"nicename":"Andorra"}, {"nicename":"Armenia"}, {"nicename":"Austria"}, {"nicename":"Azerbaijan"}, {"nicename":"Belarus"}, {"nicename":"Belgium"}, {"nicename":"Bosnia and Herzegovina"}, {"nicename":"Bouvet Island"}, {"nicename":"Bulgaria"}, {"nicename":"Croatia"}, {"nicename":"Cyprus"}, {"nicename":"Czech Republic"}, {"nicename":"Denmark"}, {"nicename":"Estonia"}, {"nicename":"Faroe Islands"}, {"nicename":"Finland"}, {"nicename":"France"}, {"nicename":"Georgia"}, {"nicename":"Germany"}, {"nicename":"Gibraltar"}, {"nicename":"Greece"}, {"nicename":"Holy See (Vatican City State)"}, {"nicename":"Hungary"}, {"nicename":"Iceland"}, {"nicename":"Ireland"}, {"nicename":"Italy"}, {"nicename":"Latvia"}, {"nicename":"Liechtenstein"}, {"nicename":"Lithuania"}, {"nicename":"Luxembourg"}, {"nicename":"Macedonia, the Former Yugoslav Republic of"}, {"nicename":"Malta"}, {"nicename":"Moldova, Republic of"}, {"nicename":"Monaco"}, {"nicename":"Netherlands"}, {"nicename":"Norway"}, {"nicename":"Poland"}, {"nicename":"Portugal"}, {"nicename":"Romania"}, {"nicename":"Russian Federation"}, {"nicename":"San Marino"}, {"nicename":"Serbia and Montenegro"}, {"nicename":"Slovakia"}, {"nicename":"Slovenia"}, {"nicename":"Spain"}, {"nicename":"Svalbard and Jan Mayen"}, {"nicename":"Sweden"}, {"nicename":"Switzerland"}, {"nicename":"Turkey"}, {"nicename":"Ukraine"}, {"nicename":"United Kingdom"}, {"nicename":"Serbia"}, {"nicename":"Montenegro"}, {"nicename":"Aland Islands"}, {"nicename":"Guernsey"}, {"nicename":"Isle of Man"}, {"nicename":"Jersey"}, {"nicename":"Kosovo"}]');
        $.p1s.createmeal.data.countries.north_america = $.parseJSON('[{"nicename":"Anguilla"}, {"nicename":"Antigua and Barbuda"}, {"nicename":"Aruba"}, {"nicename":"Bahamas"}, {"nicename":"Barbados"}, {"nicename":"Belize"}, {"nicename":"Bermuda"}, {"nicename":"Canada"}, {"nicename":"Cayman Islands"}, {"nicename":"Costa Rica"}, {"nicename":"Dominica"}, {"nicename":"Dominican Republic"}, {"nicename":"Greenland"}, {"nicename":"Grenada"}, {"nicename":"Guadeloupe"}, {"nicename":"Guatemala"}, {"nicename":"Haiti"}, {"nicename":"Honduras"}, {"nicename":"Jamaica"}, {"nicename":"Martinique"}, {"nicename":"Mexico"}, {"nicename":"Montserrat"}, {"nicename":"Netherlands Antilles"}, {"nicename":"Nicaragua"}, {"nicename":"Panama"}, {"nicename":"Puerto Rico"}, {"nicename":"Saint Kitts and Nevis"}, {"nicename":"Saint Lucia"}, {"nicename":"Saint Pierre and Miquelon"}, {"nicename":"Saint Vincent and the Grenadines"}, {"nicename":"Trinidad and Tobago"}, {"nicename":"Turks and Caicos Islands"}, {"nicename":"United States"}, {"nicename":"Virgin Islands, British"}, {"nicename":"Virgin Islands, U.s."}, {"nicename":"Curacao"}, {"nicename":"Saint Barthelemy"}, {"nicename":"Saint Martin"}, {"nicename":"Sint Maarten"}]');
        $.p1s.createmeal.data.countries.south_america = $.parseJSON('[{"nicename":"Argentina"}, {"nicename":"Bolivia"}, {"nicename":"Brazil"}, {"nicename":"Chile"}, {"nicename":"Colombia"}, {"nicename":"Cuba"}, {"nicename":"Ecuador"}, {"nicename":"El Salvador"}, {"nicename":"Falkland Islands (Malvinas)"}, {"nicename":"French Guiana"}, {"nicename":"Guyana"}, {"nicename":"Paraguay"}, {"nicename":"Peru"}, {"nicename":"Suriname"}, {"nicename":"Uruguay"}, {"nicename":"Venezuela"}, {"nicename":"Bonaire, Sint Eustatius and Saba"}]');
    }
    if (typeof $.p1s.createmeal.data.course_options === 'undefined') {
        $.p1s.createmeal.data.course_options = $.parseJSON('[{"id":"1","course_option":"Single Course"}, {"id":"2","course_option":"Starter/Desert | Main Course"}, {"id":"3","course_option":"Starter | Main Course | Desert"}, {"id":"4","course_option":"Starter | Main Course | Desert | Custom Name"}]');
    }  
    if (typeof $.p1s.createmeal.data.meal_types === 'undefined') {
        $.p1s.createmeal.data.meal_types = $.parseJSON('[{"type_name":"Breakfast","id":"1"}, {"type_name":"Brunch","id":"2"}, {"type_name":"Lunch","id":"3"}, {"type_name":"Dinner","id":"4"}]');
    } 
    if (typeof $.p1s.createmeal.data.dish_types === 'undefined') {
        $.p1s.createmeal.data.dish_types = $.parseJSON('[{"id":"1","name":"Red Meat","parent":"","has_children":"1"}, {"id":"2","name":"White Meat","parent":"","has_children":"1"}, {"id":"3","name":"Seafood","parent":"","has_children":"0"}, {"id":"4","name":"Vegetables","parent":"","has_children":"0"}, {"id":"5","name":"Fabaceae","parent":"","has_children":"0"}, {"id":"6","name":"Veal","parent":"Red Meat","has_children":"0"}, {"id":"7","name":"Lamb","parent":"Red Meat","has_children":"0"}, {"id":"8","name":"Beef","parent":"Red Meat","has_children":"0"}, {"id":"9","name":"Any","parent":"Red Meat","has_children":"0"}, {"id":"10","name":"Pork","parent":"White Meat","has_children":"0"}, {"id":"11","name":"Fish","parent":"White Meat","has_children":"0"}, {"id":"12","name":"Poultry","parent":"White Meat","has_children":"1"}, {"id":"13","name":"Chicken","parent":"Poultry","has_children":"0"}, {"id":"14","name":"Turkey","parent":"Poultry","has_children":"0"}, {"id":"15","name":"Geese","parent":"Poultry","has_children":"0"}, {"id":"16","name":"Duck","parent":"Poultry","has_children":"0"}]');
    } 
    if (typeof $.p1s.createmeal.data.numberof === 'undefined') {
        $.p1s.createmeal.data.numberof = {};
        $.p1s.createmeal.data.numberof.starter = 1;
        $.p1s.createmeal.data.numberof.main = 1;
        $.p1s.createmeal.data.numberof.desert = 1;
        $.p1s.createmeal.data.numberof.custom = 1;
        $.p1s.createmeal.data.numberof.photos = 1;
    } 
    if (typeof $.p1s.createmeal.data.photos === 'undefined') {
        $.p1s.createmeal.data.photos = [];
    }

    prepareMealTypeDOM();
    prepareCourseOptionsDOM();
    $("#mealTypeSelection").val(4);
    $("#cuisineContinentSelection").val("Europe");
    $("#cuisineContinentSelection").change();
    $("#cuisineCountrySelection").val("Italy");
    $("#courseOptionsSelection").val("Starter | Main Course | Desert");
    $("#courseOptionsSelection").change();
    $("#min-seats-input").val(1);
    $("#max-seats-input").val(4);
    $("#DonationSelection").change();


    function prepareMealTypeDOM() {
        var types = $.p1s.createmeal.data.meal_types;
        var inner_html = "";
        for(var i=0; i<types.length; i++) {
            inner_html += "<option value='";
            inner_html += types[i].id;
            inner_html += "'>";
            inner_html += types[i].type_name;
            inner_html += "</option>";
        }
        $("#mealTypeSelection").html(inner_html);
    }

    function prepareCourseOptionsDOM() {
        var options = $.p1s.createmeal.data.course_options;
        var inner_html = "";
        for(var i=0; i<options.length; i++) {
            inner_html += "<option value='";
            inner_html += options[i].course_option;
            inner_html += "'>";
            inner_html += options[i].course_option;
            inner_html += "</option>";
        }
        $("#courseOptionsSelection").html(inner_html);
    }

});

function getIntFromContinent(name) {
    if (name === "Africa") return 1;
    if (name === "Antarctica") return 2;
    if (name === "Asia") return 3;
    if (name === "Australia") return 4;
    if (name === "Europe") return 5;
    if (name === "North America") return 6;
    if (name === "South America") return 7;
}

$("#cuisineContinentSelection").change(function() {
    var selected  = getIntFromContinent($(this).val());
    var countries = [];
    switch (selected) {
        case 1:
            countries = $.p1s.createmeal.data.countries.africa;
            break;
        case 2:
            countries = $.p1s.createmeal.data.countries.antarctica;
            break;
        case 3:
            countries = $.p1s.createmeal.data.countries.asia;
            break;
        case 4:
            countries = $.p1s.createmeal.data.countries.australia;
            break;
        case 5:
            countries = $.p1s.createmeal.data.countries.europe;
            break;
        case 6:
            countries = $.p1s.createmeal.data.countries.north_america;
            break;
        case 7:
            countries = $.p1s.createmeal.data.countries.south_america;
            break;
    }
    var country_select = $("#cuisineCountrySelection");
    var inner_html = "";
    for(var i=0; i<countries.length; i++) {
        inner_html += "<option value='";
        inner_html += countries[i].nicename;
        inner_html += "'>";
        inner_html += countries[i].nicename;
        inner_html += "</option>";
    }
    country_select.html(inner_html);
});

function getIntFromOption(name) {
    if (name === "Single Course") return 1;
    if (name === "Starter/Desert | Main Course") return 2;
    if (name === "Starter | Main Course | Desert") return 3;
    if (name === "Starter | Main Course | Desert | Custom Name") return 4;
}

$("#courseOptionsSelection").change(function() {
    var selected  = getIntFromOption($(this).val());
    var container = $("#menu-content-section");
    var header_p = "<p class='header-p col-xs-12'>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor accumsan mattis. Aliquam a eros nec nunc aliquam egestas. Curabitur porta, ex in viverra mollis, risus nunc rutrum dolor, ac euismod neque massa eu tortor. In tincidunt molestie neque, a convallis nisl efficitur nec.</p>";
    var single_course_label = "<label class='col-xs-2'>Single Course</label>";
    var starter_desert_label = "<label class='col-xs-2'>Starter/Desert</label>";
    var starter_label = "<label class='col-xs-2'>Starter</label>";
    var main_course_label = "<label class='col-xs-2'>Main Course</label>";
    var desert_label = "<label class='col-xs-2'>Desert</label>";
    var custom_label = "<label class='col-xs-2'>Custom</label>";
    $.p1s.createmeal.data.numberof.starter = 1;
    $.p1s.createmeal.data.numberof.main = 1;
    $.p1s.createmeal.data.numberof.desert = 1;
    $.p1s.createmeal.data.numberof.custom = 1;

    var inner_html = "";
    switch (selected) {
        case 1:
            inner_html += header_p + single_course_label + generateInputContainer("starter");
            break;
        case 2:
            inner_html += header_p + starter_desert_label + generateInputContainer("starter");
            inner_html += header_p + main_course_label + generateInputContainer("main");
            break;
        case 3:
            inner_html = header_p + starter_label + generateInputContainer("starter");
            inner_html += header_p + main_course_label + generateInputContainer("main");
            inner_html += header_p + desert_label + generateInputContainer("desert");
            break;
        case 4:
            inner_html = header_p + starter_label + generateInputContainer("starter");
            inner_html += header_p + main_course_label + generateInputContainer("main");
            inner_html += header_p + desert_label + generateInputContainer("desert");
            inner_html += header_p + custom_label + generateInputContainer("custom");
            break;
    }
    container.html(inner_html);
    addButtonListeners(selected);
    addTagInputListeners(selected);
});

function generateInputContainer(id_prefix) {
    var name_p = "<p>Nullam nec nibh arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc ac sollicitudin erat, at rutrum dui. Nam in molestie felis.</p>";
    var ingredients_p = "<p>Sed venenatis facilisis quam, sit amet egestas risus euismod vitae. Nullam ac risus pretium mauris varius hendrerit. Sed mauris erat, molestie ultricies vulputate et, volutpat sit amet quam. Etiam ipsum quam, semper ut est vulputate, lacinia consequat ante.</p>";
    var add_button_p = "<p class='col-xs-offset-2 col-xs-10'>Praesent consectetur laoreet metus, vel fringilla diam malesuada in. Vivamus aliquam urna odio, sit amet tempor tellus ultricies eget. Proin bibendum sodales mattis.</p>";
    var dish_type_select = generateDishTypeSelect(id_prefix);
    
    var input_container = "<div class='col-xs-10 input-container' id='" + id_prefix + "-input-container'><input type='text' class='" + id_prefix + "-dish-name' id='"+id_prefix+"-dish-1' placeholder='Dish Name'>" + dish_type_select + name_p + "<div class='tags-input-field " + id_prefix + "-ingredients' id='"+id_prefix+"-tags-input-field-ingredients-1'><div class='tags'></div><input type='text'/></div>"+ ingredients_p + "</div><div class='col-xs-3 col-xs-offset-2 addBtn' id='" + id_prefix + "-add-dish-button' ><span style='font-size: 3em; margin-right:0.2em;'>+</span>Add a dish</div>" + add_button_p;
    return input_container;
};

function generateDishTypeSelect(id_prefix) {
    var res = "<select class='col-xs-2 "+ id_prefix +"-dish-type' id=" + id_prefix + "-dish-type-" + $.p1s.createmeal.data.numberof.starter +"'>";
    var types = $.p1s.createmeal.data.dish_types;
    for(var i=0; i<types.length; i++) {
        res += "<option value='";
        res += types[i].name;
        res += "'>";
        res += types[i].name;
        res += "</option>";
    }
    res += "</select>";
    return res;
}

function addButtonListeners(selected) {
    var name_p = "<p>Nullam nec nibh arcu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc ac sollicitudin erat, at rutrum dui. Nam in molestie felis.</p>";
    var ingredients_p = "<p>Sed venenatis facilisis quam, sit amet egestas risus euismod vitae. Nullam ac risus pretium mauris varius hendrerit. Sed mauris erat, molestie ultricies vulputate et, volutpat sit amet quam. Etiam ipsum quam, semper ut est vulputate, lacinia consequat ante.</p>";
    if(selected>=1) {
        $("#starter-add-dish-button").click(function() {
            $.p1s.createmeal.data.numberof.starter++;
            var new_input = "<input type='text' class='starter-dish-name' id='starter-dish-" + $.p1s.createmeal.data.numberof.starter + "' placeholder='Dish Name'>" + generateDishTypeSelect("starter") + name_p + "<div class='tags-input-field starter-ingredients' id='starter-tags-input-field-ingredients-"+ $.p1s.createmeal.data.numberof.starter +"'><div class='tags'></div><input type='text'/></div>"+ ingredients_p+"</p>";
            $("#starter-input-container").append(new_input);
            $("#starter-tags-input-field-ingredients-"+$.p1s.createmeal.data.numberof.starter+">input").keyup(keyupTagInput);
        });
    }
    if(selected>=2) {
        $("#main-add-dish-button").click(function() {
            $.p1s.createmeal.data.numberof.main++;
            var new_input = "<input type='text' class='main-dish-name' id='main-dish-" + $.p1s.createmeal.data.numberof.main + "' placeholder='Dish Name'>" + generateDishTypeSelect("main") + name_p + "<div class='tags-input-field main-ingredients' id='main-tags-input-field-ingredients-"+ $.p1s.createmeal.data.numberof.main +"'><div class='tags'></div><input type='text'/></div>"+ ingredients_p + "</p>";
            $("#main-input-container").append(new_input);
            $("#main-tags-input-field-ingredients-"+$.p1s.createmeal.data.numberof.main+">input").keyup(keyupTagInput);
        });
    }
    if(selected>=3) {
        $("#desert-add-dish-button").click(function() {
            $.p1s.createmeal.data.numberof.desert++;
            var new_input = "<input type='text' class='desert-dish-name' id='desert-dish-" + $.p1s.createmeal.data.numberof.desert + "' placeholder='Dish Name'>" + generateDishTypeSelect("desert") + name_p + "<div class='tags-input-field desert-ingredients' id='desert-tags-input-field-ingredients-"+ $.p1s.createmeal.data.numberof.desert +"'><div class='tags'></div><input type='text'/></div>"+ ingredients_p + "</p>";
            $("#desert-input-container").append(new_input);
            $("#desert-tags-input-field-ingredients-"+$.p1s.createmeal.data.numberof.desert+">input").keyup(keyupTagInput);
        });
    }
    if(selected==4) {
        $("#custom-add-dish-button").click(function() {
            $.p1s.createmeal.data.numberof.custom++;
            var new_input = "<input type='text' class='custom-dish-name' id='custom-dish-" + $.p1s.createmeal.data.numberof.custom + "' placeholder='Dish Name'>" + generateDishTypeSelect("custom") + name_p + "<div class='tags-input-field custom-ingredients' id='custom-tags-input-field-ingredients-"+ $.p1s.createmeal.data.numberof.custom +"'><div class='tags'></div><input type='text'/></div>"+ ingredients_p + "</p>";
            $("#custom-input-container").append(new_input);
            $("#custom-tags-input-field-ingredients-"+$.p1s.createmeal.data.numberof.custom+">input").keyup(keyupTagInput);
        });
    } 
};

function addTagInputListeners(selected) {
    
    if(selected>=1) {
        $("#starter-tags-input-field-ingredients-1>input").keyup(keyupTagInput);
    }
    if(selected>=2) {
        $("#main-tags-input-field-ingredients-1>input").keyup(keyupTagInput);
    }
    if(selected>=3) {
        $("#desert-tags-input-field-ingredients-1>input").keyup(keyupTagInput);
    }
    if(selected==4) {
        $("#custom-tags-input-field-ingredients-1>input").keyup(keyupTagInput);
    } 
};

function keyupTagInput(event) {
    var keycode = (event.keyCode ? event.keyCode : event.which);
    var tag;
    var tags;
    if(keycode == '13'){
        tag = "<span class='tag'>" + $(this).val() + "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span></span>";
        $(this).parent().find(".tags").append(tag);
        $(this).val("");
        tags = $(this).parent().find(".tag");
        $(tags[tags.length-1]).find(".glyphicon").click(tag_close_click);
    }
    if(keycode == '188'){
        tag = "<span class='tag'>" + $(this).val().substr(0, $(this).val().length-1) + "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span></span>";
        $(this).parent().find(".tags").append(tag);
        $(this).val("");
        tags = $(this).parent().find(".tag");
        $(tags[tags.length-1]).find(".glyphicon").click(tag_close_click);
    }
    if(keycode == '8'){
        if($(this).val() === "") {
           tags = $(this).parent().find(".tag"); 
           tag = tags[tags.length-1].innerText;
           $(tags[tags.length-1]).remove();
           $(this).val(tag);
        }
    }
}

function tag_close_click(e) {
    $(this).parent().remove();
    $(this).remove(); 
}


$("#saveBtn").click(function(){
    var meal = {};
    meal.type = $("#mealTypeSelection").val();
    meal.name = $("#mealNameField").val();
    meal.description = $("#descriptionCourseField").val();
    meal.seats = {};
    meal.seats.min =  $("#min-seats-input").val();
    meal.seats.max =  $("#max-seats-input").val();
    meal.cuisine = {};
    meal.cuisine.continent =  $("#cuisineContinentSelection").val();
    meal.cuisine.country =  $("#cuisineCountrySelection").val();
    meal.course_option = $("#courseOptionsSelection").val();
    meal.courses = [];
    var starters = {};
    starters.type = "Starter";
    starters.dishes = [];
    var starter_names = $(".starter-dish-name");
    var starter_types = $(".starter-dish-type");
    var starter_ingredients = $(".starter-ingredients");
    for(var i=0; i<starter_names.length; i++) {
        starters.dishes.push({
            dish_type : starter_types[i].value,
            dish_name : starter_names[i].value,
            main_dish : false,
            ingredients : getIngredientsString(starter_ingredients[i])
        }); 
    }
    meal.courses.push(starters);
    var main = {};
    main.type = "Main";
    main.dishes = [];
    var main_names = $(".main-dish-name");
    var main_tupes = $(".main-dish-type");
    var main_ingredients = $(".main-ingredients");
    for(var i=0; i<main_names.length; i++) {
        main.dishes.push({
            dish_type : main_tupes[i].value,
            dish_name : main_names[i].value,
            main_dish : false,
            ingredients : getIngredientsString(main_ingredients[i])
        }); 
    }
    meal.courses.push(main);
    var deserts = {};
    deserts.type = "Desert";
    deserts.dishes = [];
    var desert_names = $(".desert-dish-name");
    var desert_types = $(".desert-dish-type");
    var desert_ingredients = $(".desert-ingredients");
    for(var i=0; i<desert_names.length; i++) {
        deserts.dishes.push({
            dish_type : desert_types[i].value,
            dish_name : desert_names[i].value,
            main_dish : false,
            ingredients : getIngredientsString(desert_ingredients[i])
        }); 
    }
    meal.courses.push(deserts);
    var custom = {};
    custom.type = "Custom";
    custom.dishes = [];
    var custom_names = $(".custom-dish-name");
    var custom_types = $(".custom-dish-type");
    var custom_ingredients = $(".custom-ingredients");
    for(var i=0; i<custom_names.length; i++) {
        custom.dishes.push({
            dish_type : custom_types[i].value,
            dish_name : custom_names[i].value,
            main_dish : false,
            ingredients : getIngredientsString(custom_ingredients[i])
        }); 
    }
    meal.courses.push(custom);
    meal.photos = $.p1s.createmeal.data.photos;
    meal.price = {};
    meal.price.seat = $("#perSeatField").val();
    meal.price.donations = $("#donations-number").val();
    meal.price.type = $("#DonationSelection").val();
    meal.price.currency = "euro";
    var calendar = $('#create-meal-input-group-datepicker').data("DateTimePicker");
    var d = new Date(calendar.date());
    var curr_date = d.getDate();
    var curr_month = d.getMonth();
    curr_month++;
    var curr_year = d.getFullYear();
    meal.date = curr_date + "/" + curr_month + "/" + curr_year;
    var start = $('#create-meal-input-group-timepicker-start').data("DateTimePicker");
    d = new Date(start.date());
    var curr_hour = d.getHours();
    var curr_min = d.getMinutes();
    meal.start_time = curr_hour + ":" + curr_min;
    var end = $('#create-meal-input-group-timepicker-end').data("DateTimePicker");
    d = new Date(end.date());
    curr_hour = d.getHours();
    curr_min = d.getMinutes();
    meal.end_time = curr_hour + ":" + curr_min;
    meal.host = $.p1s.userID;
    meal.drinks = ["Wine"];
    postRequest("../php/php/api/createMeal.php",{"json":JSON.stringify(meal)});
});

function getIngredientsString(ingredients) {
    if(typeof ingredients !== 'undefined') {
        var ingredients_list = $(ingredients).find(".tag");
        var res = "";
        for(var i=0; i<ingredients_list.length; i++) {
            res += ingredients_list[i].innerText + ";";
        }
        return res.substring(0, res.length -1);
    }
    return "";
};

$(function () {
    $('#create-meal-input-group-datepicker').datetimepicker({ 
        format: 'MM/DD/YYYY',
        debug: true,
        inline: true
    });
});

$(function () {
    $('#create-meal-input-group-timepicker-start').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true
    });
    $('#create-meal-input-group-timepicker-end').datetimepicker({
        format: 'LT',
        stepping: 15,
        debug: true,
        useCurrent: false
    });

    $('#create-meal-input-group-timepicker-start').on("dp.change", function (e) {
        var start = $('#create-meal-input-group-timepicker-start').data("DateTimePicker");
        var end = $('#create-meal-input-group-timepicker-end').data("DateTimePicker");
        end.minDate(e.date);
    });
    $('#create-meal-input-group-timepicker-end').on("dp.change", function (e) {
        var start = $('#create-meal-input-group-timepicker-start').data("DateTimePicker");
        var end = $('#create-meal-input-group-timepicker-end').data("DateTimePicker");
        start.maxDate(e.date);
    });
    
});


$(function () {
    $('body').click(function() {
        $('#create-meal-input-group-timepicker-start').data("DateTimePicker").hide();
        $('#create-meal-input-group-timepicker-end').data("DateTimePicker").hide();
    });

    $("#create-meal-input-group-timepicker-start").click(function(e){
        e.stopPropagation();
        $("#create-meal-input-group-timepicker-end").data("DateTimePicker").hide();
    });

    $('#create-meal-input-group-timepicker-start').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#create-meal-input-group-timepicker-start').data("DateTimePicker").show();
    });

    $('#create-meal-input-group-timepicker-start').find('.sb-input').click(function(e){
        $('#create-meal-input-group-timepicker-start').data("DateTimePicker").toggle();
    });

     $("#create-meal-input-group-timepicker-end").click(function(e){
        e.stopPropagation();
        $("#create-meal-input-group-timepicker-start").data("DateTimePicker").hide();
    });

    $('#create-meal-input-group-timepicker-end').find('.bootstrap-datetimepicker-widget').click(function(e){
        e.stopPropagation();
        $('#create-meal-input-group-timepicker-end').data("DateTimePicker").show();
    });

    $('#create-meal-input-group-timepicker-end').find('.sb-input').click(function(e){
        $('#create-meal-input-group-timepicker-end').data("DateTimePicker").toggle();
    });
});


$('#picture-upload-button').click(function(e) {
    $(this).find('input[type="file"]').click();
});

$('#picture-upload-button input').click(function(e) {
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
        //var picture= reader.result.substring(reader.result.indexOf(',')+1);
        var picture= reader.result;
        $.p1s.createmeal.data.photos.push(picture);
        var element = "<div class='photo' id='create-meal-photo-" + $.p1s.createmeal.data.numberof.photos + "'  style='background: url(\""+picture+"\") 50% 50% no-repeat;'><button type='button' class='btn close-photo-button' aria-label='Close' id='photo-close-button"+$.p1s.createmeal.data.numberof.photos+"'><span class='glyphicon glyphicon glyphicon-remove' aria-hidden='true'></span></button></div>";
        $('#uploaded-pictures').append(element);
        $('#photo-close-button'+$.p1s.createmeal.data.numberof.photos).click(function() {
            $(this).parent().remove();
            $(this).remove();
            var number = parseInt($(this).attr("id").substr(18));
            for(var i=number-1; i<$.p1s.createmeal.data.photos.length-1; i++) {
                $.p1s.createmeal.data.photos[i]=$.p1s.createmeal.data.photos[i+1];
            }
            $.p1s.createmeal.data.photos[$.p1s.createmeal.data.photos.length-1] = "";
            $.p1s.createmeal.data.photos.length--;
        });
        $.p1s.createmeal.data.numberof.photos++;
   };
   reader.onerror = function (error) {
     console.log('Error: ', error);
   };
};


$("#DonationSelection").change(function() {
    var selected = $(this).val();
    if(selected === "golden") {
        $("#donations-number").parent().hide();
        $("#donations-number-label").parent().hide();
    } else {
        $("#donations-number").parent().show();
        $("#donations-number-label").parent().show();
    }
});

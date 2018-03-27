// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

// ingredients = document.getElementsByClassName("ingredient");
//
// function myFunction() {
//     // Declare variables
//     var input, filter, ul, li, a, i;
//     input = document.getElementById('myInput');
//     filter = input.value.toUpperCase();
//     ul = document.getElementById("myUL");
//     li = ul.getElementsByTagName('li');
//
//     // Loop through all list items, and hide those who don't match the search query
//     // should be able to add hidden to each element by default and then remove it here instead of hiding the others.
//
//     for (i = 0; i < li.length; i++) {
//         a = li[i].getElementsByTagName("a")[0];
//         if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
//             li[i].style.display = "";
//         } else {
//             li[i].style.display = "none";
//         }
//     }
// }
//
// function addIngredient(name) {
//   console.log(name);
// }
//
// for (var i=0;i< ingredients.length;i++){
//   ingredients[i].addEventListener('click', function() {
//     console.log(this.dataset.id)
//     })
// }
$( document ).ready(function() {
// *************************NAV BAR*********************************

$('.current_list_button').on('click', (event) =>{
  $('#list_dropdown').toggleClass('arrow_active');
  $('#list_overlay').toggleClass('hide');
});

// *************************RECIPES*********************************

$('.add-ingredient').on('click', (event) =>{
  event.preventDefault();
  let ingredient_name = $('#ingredient_name').val();
  let ingredient_quantity = $('#ingredient_quantity').val();
  let recipeId = $('#recipe_id_field').val();
  let address = $('#recipe_route').val();
  let request = $.ajax({
    method: 'PATCH',
    data: { id: recipeId, iname: ingredient_name, iquantity: ingredient_quantity},
    url: address
  });

  request.done(() => {
   $('#ingredients-list').append('<li>' + ingredient_name + ', ' + ingredient_quantity + '</li>');
   $('#ingredient_name').val('');
   $('#ingredient_quantity').val('');
 });
});

$('.add-recipe-to-list').on('click', (event) =>{
  let recipeId = event.target.dataset.recipeId;
  let listId = event.target.dataset.listId;
  let action = event.target.dataset.action;
  let address = $('#list_route').val();
  let request = $.ajax({
    method: 'PATCH',
    data: {id: listId, recipe_id: recipeId, list_action: action},
    url: address
  });

  request.done((items) =>{
    $('#list_overlay').removeClass('hide');
    $('#list_dropdown').addClass('arrow_active');
    items[0].forEach(function(element) {
      $('#line_items').append('<li><img class="delete_img" data-item-id="' + element[1] + '" data-list-id="' + listId + '" src="/assets/xsmall-222eb3bfd95571286a3da1f06aff3b5d3507c58ec056c84089fe70c455bde292.jpg" alt="Xsmall">_<div class="item_aisle">' + element[3] + '</div>_ <div class="item_listing">' + element[2] + ' ' + element[0] + '</div></li>');
    });
  });
});

$('#favorite-icon').on('click', '#favorite_button', (event) =>{
  event.preventDefault();
  let recipeId = event.target.dataset.recipeId;
  let action = event.target.dataset.action;
  let address = event.target.dataset.address;
  let request = $.ajax({
    method: 'PATCH',
    data: {id: recipeId, heart_action: action},
    url: address
  });
  request.done(() =>{
    let icon_code = $('#favorite-icon');
    icon_code[0].innerHTML = ('<img id="unfavorite_button" class="heart" data-recipe-id="' + recipeId + '" data-action="unfavorite" data-address="/api/v1/recipes/1" src="/assets/heart-filled-92a4382eed0b3b1417747370c9229d12f4f4b41f790008e850d84f371826c5c9.png" alt="Heart filled">');
  });
});

$('#favorite-icon').on('click', '#unfavorite_button', (event) =>{
  event.preventDefault();
  let recipeId = event.target.dataset.recipeId;
  let action = event.target.dataset.action;
  let address = event.target.dataset.address;
  let request = $.ajax({
    method: 'PATCH',
    data: {id: recipeId, heart_action: action},
    url: address
  });
  request.done(() =>{

    let icon_code = $('#favorite-icon');
    icon_code[0].innerHTML = ('<img id="favorite_button" class="heart" data-recipe-id="' + recipeId + '" data-action="favorite" data-address="/api/v1/recipes/1" src="/assets/heart-blank-c876bb4abea6eabc6c618611ef3ceb32d2b8784c768449ec38a4bb546a2f73c7.png" alt="Heart blank">');
  });
});
// *************************LISTS*********************************

$('.add_item').on('click', (event) =>{
  event.preventDefault();
  let item_name = $('#item_name').val();
  let item_quantity = $('#item_quantity').val();
  let listId = $('#list_id_field').val();
  let action = event.target.dataset.action;
  let address = $('#list_route').val();
  let request = $.ajax({
    method: 'PATCH',
    data: { id: listId, iname: item_name, iquantity: item_quantity, list_action: action},
    url: address
  });
  request.done((element) => {
  $('#line_items').append('<li><img class="delete_img" data-item-id="' + element[0][1] + '" data-list-id="' + listId + '" src="/assets/xsmall-222eb3bfd95571286a3da1f06aff3b5d3507c58ec056c84089fe70c455bde292.jpg" alt="Xsmall">_<div class="item_aisle">' + element[0][3] + '</div>_<div class="item_listing">' + element[0][2] + ' ' + element[0][0] + '</div></li>');
   $('#item_name').val('');
   $('#item_quantity').val('');
 });

});

$('#line_items').on('click', '.delete_img', event =>{
  event.preventDefault();
  let itemId = event.target.dataset.itemId;
  let listId = event.target.dataset.listId;
  let address = $('#list_route').val();
  let action = "delete";
  let request = $.ajax({
    method: 'PATCH',
    data: { id: listId, item_id: itemId, list_action: action },
    url: address
  });
  request.done(() => {
    event.target.parentElement.remove();
  });
});

$('#update-aisles').on('click', (event) =>{
  event.preventDefault();
  let storeId = $('#store_id_field').val();
  let listId = $('#list_id_field').val();
  let address = $('#store_route').val();
  let entries = $('.aisle_entry');

  let pairs = [];
  Array.from(entries).forEach(function(entry){
    let value = $(entry).val();
    pairs.push([entry.dataset.itemId, value]);
  });

  let request = $.ajax({
    method: 'PATCH',
    data: { id: storeId, pairs: pairs, list_id:listId },
    url: address
  });
  request.done((path) => {
    window.location.reload();
  });
});

$('#new_list').on('click', (event) =>{
  event.preventDefault();
  let address = event.target.dataset.address;
  let request = $.ajax({
    method: 'GET',
    data: {},
    url: address
  });
  request.done(() =>{
  $('#line_items')[0].innerHTML = "";
  });
});

$('#sort_list').on('click', (event) =>{
  let aisles = $('#line_items')[0].children;

 let aisle_array = Array.from(aisles).sort(function(a, b) {

   let item1 = null;
   let item2 = null;
   if (a.children[1].innerHTML == "__") {
     item1 = 100;
   } else {
     item1 = parseInt(a.children[1].innerHTML);
   }
   if (b.children[1].innerHTML == "__") {
     item2 = 100;
   } else {
     item2 = parseInt(b.children[1].innerHTML);
   }

   if (item1 < item2) {
     return -1;
   }
   if (item1 > item2) {
     return 1;
   }

   return 0;
 });
  $('#line_items')[0].innerHTML = '';
  aisle_array.forEach(function(line) {
    $('#line_items').append(line);
  });
});
// *************************OTHER*********************************

  let $search = $('#searchInput');
  $search.on('keyup', function(){
    console.log($search.val());
  });

  $('#itemList').children().on('click', event => {
    console.log($(event.currentTarget).text());
  });

  $('.search_store').on('click', (event) =>{
    event.preventDefault();
    let storeName = $('#store_name').val();
    let storeAddress = $('#store_address').val();

    let request = $.ajax({
      url: 'https://api.foursquare.com/v2/venues/search',
        method: 'GET',
        data: {
          client_id: 'IXXGGDREOMC2LWHFFHFOPHTCJDC3E53CRZ2XZDAXG22MQJ55',
          client_secret: '0O5WIOYJLEJFLULDA5K5DANAJIASKBS15EKS1JH4XO4SPAG2',
          near: storeAddress,
          query: storeName,
          limit: 10,
          v: '20170801',
        }
    });
    request.done((result) =>{
      result.response.venues.forEach(function(store){
      let full_address = store.location.formattedAddress.join(', ')
      let coordinates = store.location.lat + ', ' + store.location.lng

      $('#store_search_results').append(`<div class="home_store_block">
      <img src="https://maps.googleapis.com/maps/api/staticmap?zoom=15&size=600x300&maptype=roadmap&markers=color:red|label:!|` + full_address + `&key=AIzaSyCwoIv_svzZ2pO14Eu_fQq3R-Ia1WGzQKg">
      <li>` + store.name + `: ` + full_address + `</li>
      <button type="button" class="set_home_store">Choose this store!</button>
      </div><br>`);
      })
    });
  });

  $('#store_search_results').on('click', '.set_home_store', event =>{
    let listing = event.target.previousElementSibling.innerText.split(': ');
    let storeName = listing[0];
    let storeAddress = listing[1];
    let id = $('#store_search_results')[0].dataset.userId;
    let address = '/api/v1/users/' + id + '/edit'
    let request = $.ajax({
      url: address,
      method: 'GET',
      data: { store_name: storeName, store_address: storeAddress, id: id }
    });
    request.done(() =>{
      $('#home_store_listing')[0].innerText = 'Home Store: ' + storeName + ', ' + storeAddress;
      alert("Home location changed!");
    });
  });


});

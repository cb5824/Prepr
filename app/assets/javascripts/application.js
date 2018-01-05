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

$('#list-dropdown').on('click', (event) =>{
  $('#list-dropdown').toggleClass('arrow-active')
  $('#list-overlay').toggleClass('hide')
})

// *************************RECIPES*********************************

$('.add-ingredient').on('click', (event) =>{
  event.preventDefault()
  let ingredient_name = $('#ingredient_name').val()
  let ingredient_quantity = $('#ingredient_quantity').val()
  let recipeId = $('#recipe_id_field').val()
  let address = $('#recipe_route').val()
  let request = $.ajax({
    method: 'PATCH',
    data: { id: recipeId, iname: ingredient_name, iquantity: ingredient_quantity},
    url: address
  })

  request.done(() => {
   $('#ingredients-list').append('<li>' + ingredient_name + ', ' + ingredient_quantity + '</li>')
   $('#ingredient_name').val('')
   $('#ingredient_quantity').val('')
 })
})

$('.recipe').on('click', (event) =>{
  let recipeId = event.target.dataset.recipeId;
  let listId = $('#list_id_field').val();
  let address = $('#list_route').val();
  let request = $.ajax({
    method: 'PATCH',
    data: {id: listId, recipe_id: recipeId},
    url: address
  });

  request.done((items) =>{
    items.forEach(function(element) {
      $('#line-items').append('<li><div class="item_listing">' + element[0] + ', ' + element[2] + '</div> <img class="delete_img" data-item-id="' + element[1] + '" data-list-id="' + listId + '" src="/assets/xsmall-222eb3bfd95571286a3da1f06aff3b5d3507c58ec056c84089fe70c455bde292.jpg" alt="Xsmall"> </li>')
    });
  });
});

$('#favorite-icon').on('click', '#favorite_button', (event) =>{
  event.preventDefault()
  let recipeId = event.target.dataset.recipeId;
  let action = event.target.dataset.action;
  let address = event.target.dataset.address;
  let request = $.ajax({
    method: 'PATCH',
    data: {id: recipeId, heart_action: action},
    url: address
  });
  request.done(() =>{
    let icon_code = $('#favorite-icon')
    icon_code[0].innerHTML = ('<img id="unfavorite_button" class="heart" data-recipe-id="' + recipeId + '" data-action="unfavorite" data-address="/api/v1/recipes/1" src="/assets/heart-filled-92a4382eed0b3b1417747370c9229d12f4f4b41f790008e850d84f371826c5c9.png" alt="Heart filled">')
  });
});

$('#favorite-icon').on('click', '#unfavorite_button', (event) =>{
  event.preventDefault()
  let recipeId = event.target.dataset.recipeId;
  let action = event.target.dataset.action;
  let address = event.target.dataset.address;
  let request = $.ajax({
    method: 'PATCH',
    data: {id: recipeId, heart_action: action},
    url: address
  });
  request.done(() =>{

    let icon_code = $('#favorite-icon')
    icon_code[0].innerHTML = ('<img id="favorite_button" class="heart" data-recipe-id="' + recipeId + '" data-action="favorite" data-address="/api/v1/recipes/1" src="/assets/heart-blank-c876bb4abea6eabc6c618611ef3ceb32d2b8784c768449ec38a4bb546a2f73c7.png" alt="Heart blank">')
  });
});
// *************************LISTS*********************************

$('.add-item').on('click', (event) =>{
  event.preventDefault()
  let item_name = $('#item_name').val()
  let item_quantity = $('#item_quantity').val()
  let listId = $('#list_id_field').val()
  let address = $('#list_route').val()
  let request = $.ajax({
    method: 'PATCH',
    data: { id: listId, iname: item_name, iquantity: item_quantity},
    url: address
  })

  request.done((element) => {
  $('#line-items').append('<li><div class="item_listing">' + element[0][0] + ', ' + element[0][2] + '</div> <img class="delete_img" data-item-id="' + element[0][1] + '" data-list-id="' + listId + '" src="/assets/xsmall-222eb3bfd95571286a3da1f06aff3b5d3507c58ec056c84089fe70c455bde292.jpg" alt="Xsmall"> </li>')
   $('#item_name').val('')
   $('#item_quantity').val('')
 })

})

$('#line-items').on('click', '.delete_img', event =>{
  event.preventDefault();
  let itemId = event.target.dataset.itemId;
  let listId = $('#list_id_field').val()
  let address = $('#list_route').val()

  let request = $.ajax({
    method: 'PATCH',
    data: { id: listId, item_id: itemId },
    url: address
  })
  request.done(() => {
    event.target.parentElement.remove()
  })
})

$('#update-isles').on('click', (event) =>{
  event.preventDefault();
  let storeId = $('#store_id_field').val()
  let listId = $('#list_id_field').val()
  let address = $('#store_route').val()
  let entries = $('.isle-entry');

  let pairs = []
  Array.from(entries).forEach(function(entry){
    let value = $(entry).val();
    pairs.push([entry.dataset.itemId, value])
  })

  let request = $.ajax({
    method: 'PATCH',
    data: { id: storeId, pairs: pairs, list_id:listId },
    url: address
  })
  request.done((path) => {
    window.location.reload();
  })

})
// *************************OTHER*********************************

  let $search = $('#searchInput')
  $search.on('keyup', function(){
    console.log($search.val());
  });

  $('#itemList').children().on('click', event => {
    console.log($(event.currentTarget).text())
  });

});

// $('#searchInput').on('change', function(){
//   console.log('testing...');
// });

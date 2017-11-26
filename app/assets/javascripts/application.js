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
//= require turbolinks
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
   // console.log('done')
   $('#ingredients-list').append('<li>' + ingredient_name + '</li>')
 })

})




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

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'jquery'
import 'bootstrap'
import 'popper.js'
import 'bootstrap/dist/js/bootstrap';

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
require("jquery-ui")
require("popper.js")
require("data-confirm-modal")
require("./claim.js")

require("bootstrap")
// require("direct_uploads.js")

console.log('Hello World from Webpacker')

// $(".confirm").confirm({
//     text: "Are you sure you want to delete that comment?",
//     title: "Confirmation required",
//     confirm: function (button) {
//         // delete ();
//     },
//     cancel: function (button) {
//         // nothing to do
//     },
//     confirmButton: "Yes I am",
//     cancelButton: "No",
//     post: true,
//     confirmButtonClass: "btn-primary",
//     cancelButtonClass: "btn-default",
//     dialogClass: "modal-dialog modal-lg" // Bootstrap classes for large modal
// });

// // $.rails.allowAction = function (link) {
// //     if (link.data("confirm") == undefined) {
//         return true;
//     }
//     $.rails.showConfirmationDialog(link);
//     return false;
// }
// //User click confirm button
// $.rails.confirmed = function (link) {
//     link.data("confirm", null);
//     link.trigger("click.rails");
// }
// //Display the confirmation dialog
// $.rails.showConfirmationDialog = function (link) {
//     var message = link.data("confirm");
//     $.fn.SimpleModal({
//         model: "modal",
//         title: "Please confirm",
//         contents: message
//     }).addButton("Confirm", "button primary", function () {
//         $.rails.confirmed(link);
//         this.hideModal();
//     }).addButton("Cancel", "button secondary").showModal();
// }

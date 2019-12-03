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

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("data-confirm-modal")
require("popper")
require("bootstrap")
require("jquery_ujs")

require("direct_uploads.js")
require("bootstrap-sprockets")

require("formvalidation/formValidation")
require("formvalidation/bootstrap4.min")

console.log('Hello World from Webpacker')

$.rails.allowAction = function (link) {
    if (link.data("confirm") == undefined) {
        return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
}
//User click confirm button
$.rails.confirmed = function (link) {
    link.data("confirm", null);
    link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function (link) {
    var message = link.data("confirm");
    $.fn.SimpleModal({
        model: "modal",
        title: "Please confirm",
        contents: message
    }).addButton("Confirm", "button alert", function () {
        $.rails.confirmed(link);
        this.hideModal();
    }).addButton("Cancel", "button secondary").showModal();
}

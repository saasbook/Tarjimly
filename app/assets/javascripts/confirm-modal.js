
// dataConfirmModal.setDefaults({
//     title: 'Confirm Request Deletion',
//     commit: 'Continue',
//     cancel: 'Cancel',
//     modalClass: 'custom-model'
// })

$(document).ready(function () {
    $.fn.twitter_bootstrap_confirmbox.defaults = {
        title: null,
        cancel: "Cancel",
        proceed: "OK",
        proceed_class: "btn proceed btn-primary"
    }
});
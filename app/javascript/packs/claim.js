// $(".confirm").confirm({
//     text: "Are you sure you want to delete that comment?",
//     title: "Confirmation required",
//     confirm: function (button) {
//         delete ();
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

// dataConfirmModal.setDefaults({
//     title: 'Confirm your action',
//     commit: 'Continue',
//     cancel: 'Cancel',
//     modalClass: 'custom-model'
// })

$(".destory").confirm({
    title: 'Confirm!',
    content: 'Simple confirm!',
    buttons: {
        confirm: function () {
            $.alert('Confirmed!');
        },
        cancel: function () {
            $.alert('Canceled!');
        },
        somethingElse: {
            text: 'Something else',
            btnClass: 'btn-blue',
            keys: ['enter', 'shift'],
            action: function () {
                $.alert('Something else?');
            }
        }
    },
    confirmButtonClass: "btn-primary",
    cancelButtonClass: "btn-default",
});
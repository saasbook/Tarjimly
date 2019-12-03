$(".confirm").confirm({
    text: "Are you sure you want to delete that comment?",
    title: "Confirmation required",
    confirm: function (button) {
        // delete ();
    },
    cancel: function (button) {
        // nothing to do
    },
    confirmButton: "Yes I am",
    cancelButton: "No",
    post: true,
    confirmButtonClass: "btn-primary",
    cancelButtonClass: "btn-default",
    dialogClass: "modal-dialog modal-lg" // Bootstrap classes for large modal
});
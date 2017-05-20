/**
 * Created by peter on 5/20/17.
 */
var formIsVisible = false;


$(document).ready(function () {
    $("#purchase-form").hide();
});


function showPurchaseForm() {
    $("#purchase-form").toggle();
    if (formIsVisible) {
        $('.purchase-button').html("Hide Purchase Form");
    } else {
        $('.purchase-button').html("Purchase");
    }
    formIsVisible = !formIsVisible;
}

function init() {
    new WOW().init();
    componentHandler.upgradeAllRegistered();
}

$(document).on("turbolinks:load", function () {
    init();
});
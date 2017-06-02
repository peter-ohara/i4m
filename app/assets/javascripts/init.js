function init() {
    new WOW().init();
    componentHandler.upgradeAllRegistered();
}

$(document).on("turbolinks:load", function () {
    console.log("Initing things...");
    init();
    console.log("Things were inited");
});

console.log("Something wicked this way comes");
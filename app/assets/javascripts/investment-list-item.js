function setClickListenerOnInvestments() {
    $(".investments-list .investment").click(function () {
        var link = $(this).data('href');
        location.href = link
    });
}

$(document).on("turbolinks:load", function () {
    if ($(".fixed_deposit_investments.index, .search.index").length == 0) return;
    setClickListenerOnInvestments();
});
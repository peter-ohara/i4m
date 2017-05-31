$(document).ready(function () {
    $(".investments-list .investment").click(function () {
        var link = $(this).data('href');
        location.href = link
    });


    $("[name=principal], [name=deposits], [name=duration], #duration_multiplier").blur(function () {
        updateList();
    });

    $("[name=principal], [name=deposits], [name=duration], #duration_multiplier").change(function () {
        updateList();
    });

    $("form[data-calculate-fixed_deposit-returns]").submit(function (event) {
        event.preventDefault();
    });

    updateList();
});

function updateList() {
    var principal = parseFloat($('[name=principal]').val());
    var deposits = parseFloat($('[name=deposits]').val());
    var duration = parseFloat($('[name=duration]').val());
    var duration_multiplier = parseFloat($('#duration_multiplier').find(":selected").val());
    var annual_compounding_frequency = 12;

    // Make an ajax call with the values so the session can be stored
    if (principal && deposits) {
        $.ajax({
            url: "/search/save",
            method: "post",
            data: {
                principal: principal,
                deposits: deposits,
                duration: duration,
                duration_multiplier: duration_multiplier,
                annual_compounding_frequency: annual_compounding_frequency
            }
        }).done(function () {
            console.log("saved search")
        });
    }

    console.log("principal", principal);
    console.log("deposits", deposits);
    console.log("duration", duration);
    console.log("annual_compounding_frequency", annual_compounding_frequency);
    console.log("duration_multiplier", duration_multiplier);

    var duration_in_years = duration / duration_multiplier;


    $(".investment").each(function (index, element) {
        var annual_interest_rate = parseFloat($(element).find('[name=annual_interest_rate]').val()) / 100;
        console.log("annual_interest_rate", annual_interest_rate);

        var finalBalance = getTompoundInterestWithDeposits(principal, deposits, annual_interest_rate,
            annual_compounding_frequency, duration_in_years);
        var totalDeposits = getTotalDeposits(deposits, annual_compounding_frequency, duration_in_years);
        var totalInterest = getTotalInterest(finalBalance, totalDeposits, principal);

        var finalBalanceString = "GHS " + finalBalance.toLocaleString();
        var totalDepositsString = "GHS " + totalDeposits.toLocaleString();
        var totalInterestString = "GHS " + totalInterest.toLocaleString();

        console.log("finalBalance", finalBalanceString);
        console.log("totalDeposits", totalDepositsString);
        console.log("totalInterest", totalInterestString);

        $(element).find('.final_balance').html(finalBalanceString);
        $(element).find('.total_interest').html(totalInterestString);
    });
}


function getCompoundInterest(principal, annual_interest_rate, annual_compounding_frequency, duration_in_years) {
    var P = principal;
    var r = annual_interest_rate;
    var n = annual_compounding_frequency;
    var t = duration_in_years;
    return P * Math.pow(1 + (r/n), n*t);
}

function getFutureValueOfASeries(monthly_deposits, annual_interest_rate,
                                 annual_compounding_frequency, duration_years) {
    var PMT = monthly_deposits;
    var r = annual_interest_rate;
    var n = annual_compounding_frequency;
    var t = duration_years;
    return PMT * (Math.pow(1 + (r/n), n*t) - 1) / (r/n);
}

function getTompoundInterestWithDeposits(principal, monthly_deposits, annual_interest_rate,
                                         annual_compounding_frequency, duration_in_years) {
    var P = principal;
    var PMT = monthly_deposits;
    var r = annual_interest_rate;
    var n = annual_compounding_frequency;
    var t = duration_in_years;
    return getCompoundInterest(P, r, n, t) + getFutureValueOfASeries(PMT, r, n, t) * (1+(r/n));
}

function getTotalDeposits(monthly_deposits, annual_compounding_frequency, duration_in_years) {
    return monthly_deposits * (annual_compounding_frequency * duration_in_years);
}

function getTotalInterest(finalBalance, totalDeposits, principal) {
    return finalBalance - (totalDeposits + principal);
}

// Start Animations
new WOW().init();


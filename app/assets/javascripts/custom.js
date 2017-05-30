$(document).ready(function () {
    // $("[name=principal], [name=deposits], [name=duration]").blur(updateList());
    $("[name=principal], [name=deposits], [name=duration]").blur(function () {
        updateList();
    });

    $("[name=principal], [name=deposits], [name=duration]").change(function () {
        updateList();
    });

    $("form[data-calculate-fixed_deposit-returns]").submit(function (event) {
        event.preventDefault();
    });

    updateList();
});

function updateList() {
    var principal = parseFloat($('[name=principal]').val());
    var monthly_deposits = parseFloat($('[name=deposits]').val());
    var duration_in_years = parseFloat($('[name=duration]').val());
    var annual_compounding_frequency = 12;

    console.log("principal", principal);
    console.log("monthly_deposits", monthly_deposits);
    console.log("duration_in_years", duration_in_years);
    console.log("annual_compounding_frequency", annual_compounding_frequency);


    $(".investment").each(function (index, element) {
        var annual_interest_rate = parseFloat($(element).find('[name=annual_interest_rate]').val()) / 100;
        console.log("annual_interest_rate", annual_interest_rate);

        var finalBalance = getTompoundInterestWithDeposits(principal, monthly_deposits, annual_interest_rate,
            annual_compounding_frequency, duration_in_years);
        var totalDeposits = getTotalDeposits(monthly_deposits, annual_compounding_frequency, duration_in_years);
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

$('input[type="range"]').rangeslider();

// Start Animations
new WOW().init();




$(document).ready(function () {
    $("form[data-calculate-fixed_deposit-returns]").submit(function( event ) {
        event.preventDefault();

        var principal = parseFloat($(this).find('[name=principal]').val());
        var monthly_deposits = parseFloat($(this).find('[name=deposits]').val());
        var duration_in_years = parseFloat($(this).find('[name=duration]').val());
        var annual_compounding_frequency = 12;

        console.log("principal", principal);
        console.log("monthly_deposits", monthly_deposits);
        console.log("duration_in_years", duration_in_years);
        console.log("annual_compounding_frequency", annual_compounding_frequency);


        $(".investment").each(function (index, element) {
            var annual_interest_rate = parseFloat($(element).find('[name=annual_interest_rate]').val());
            console.log("annual_interest_rate", annual_interest_rate);

            var finalBalance = getTompoundInterestWithDeposits(principal, monthly_deposits, annual_interest_rate,
                annual_compounding_frequency, duration_in_years);
            var totalDeposits = getTotalDeposits(monthly_deposits, annual_compounding_frequency, duration_in_years);
            var totalInterest = getTotalInterest(finalBalance, totalDeposits, principal);

            console.log("finalBalance", finalBalance);
            console.log("totalDeposits", totalDeposits);
            console.log("totalInterest", totalInterest);

            $(element).find('.final_balance').html(finalBalance);
            $(element).find('.total_interest').html(totalInterest);
        });
    });
});

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
    return getCompoundInterest(P, r, n, t) + getFutureValueOfASeries(PMT, r, n, t)// * (1+(r/n));
}

function getTotalDeposits(monthly_deposits, annual_compounding_frequency, duration_in_years) {
    return monthly_deposits * (annual_compounding_frequency * duration_in_years);
}

function getTotalInterest(finalBalance, totalDeposits, principal) {
    return finalBalance - (totalDeposits + principal);
}



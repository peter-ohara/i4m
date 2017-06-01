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

function getDataArray(duration, duration_multiplier, principal, deposits, annual_interest_rate, annual_compounding_frequency) {
    var dataArray = [
        ['Genre', 'Principal', 'Deposits', 'Interest', { role: 'annotation' } ]
    ];

    for (var period = 1; period <= duration; period++) {
        var duration_in_years = ((duration / duration_multiplier) / duration) * period;

        var finalBalance = getTompoundInterestWithDeposits(principal, deposits, annual_interest_rate,
            annual_compounding_frequency, duration_in_years);
        var totalDeposits = getTotalDeposits(deposits, annual_compounding_frequency, duration_in_years);
        var totalInterest = getTotalInterest(finalBalance, totalDeposits, principal);

        if (duration_multiplier === 12) {
            dataArray.push([ 'Month ' + parseInt(period), principal, totalDeposits, totalInterest, '']);
        } else {
            dataArray.push([ 'Year ' + parseInt(period), principal, totalDeposits, totalInterest, '']);
        }
    }
    return dataArray;
}



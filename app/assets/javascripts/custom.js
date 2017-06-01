$(document).ready(function () {
    $(".investments-list .investment").click(function () {
        var link = $(this).data('href');
        location.href = link
    });

    $("form[data-calculate-fixed_deposit-returns]").submit(function (event) {
        event.preventDefault();
    });

    $("#principal_slider, #inp_principal_text," +
        "#deposits_slider, #inp_deposits_text," +
        "#duration_slider, #inp_duration_text," +
        "#duration_multiplier").bind('input change keyup', function () {
        updateList();
    });

    updateList();
});

function updateList() {
    var principal = parseFloat($('#inp_principal_text').val());
    var deposits = parseFloat($('#inp_deposits_text').val());
    var duration = parseFloat($('#inp_duration_text').val());
    var duration_multiplier = parseFloat($('#duration_multiplier').find(":checked").val());
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

        var finalBalanceString = accounting.formatMoney(finalBalance, "", 2);
        var totalDepositsString = accounting.formatMoney(totalDeposits, "", 2);
        var totalInterestString = accounting.formatMoney(totalInterest, "", 2);

        console.log("finalBalance", finalBalanceString);
        console.log("totalDeposits", totalDepositsString);
        console.log("totalInterest", totalInterestString);

        $(element).find('.final_balance').html(finalBalanceString);
        $(element).find('.total_deposits').html(totalDepositsString);
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


$(document).ready(function () {
    $('#principal_slider').on('input',function(){
        $("#principal_text").get(0).MaterialTextfield.change(this.value);
    });
    $('#inp_principal_text').keyup(function() {
        $("#principal_slider").get(0).MaterialSlider.change($( '#inp_principal_text').val());
        console.dir($('#principal_slider'));
    });

    $('#deposits_slider').on('input',function(){
        $("#deposits_text").get(0).MaterialTextfield.change(this.value);
    });
    $('#inp_deposits_text').keyup(function() {
        $("#deposits_slider").get(0).MaterialSlider.change($( '#inp_deposits_text').val());
        console.dir($('#deposits_slider'));
    });

    $('#duration_slider').on('input',function(){
        $("#duration_text").get(0).MaterialTextfield.change(this.value);
    });
    $('#inp_duration_text').keyup(function() {
        $("#duration_slider").get(0).MaterialSlider.change($( '#inp_duration_text').val());
        console.dir($('#duration_slider'));
    });
});


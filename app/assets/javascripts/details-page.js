$(document).ready(function () {
    // Start Animations
    new WOW().init();
    setupCalculator();
    setClickListenerOnInvestments();
    setupRiskMeter();
});

function setupCalculator() {
    setupSliders();
    setupCalculatorInput();
}

function setupSliders() {
    $('#principal_slider').on('input', function () {
        $("#principal_text").get(0).MaterialTextfield.change(this.value);
    });
    $('#inp_principal_text').keyup(function () {
        $("#principal_slider").get(0).MaterialSlider.change($('#inp_principal_text').val());
        console.dir($('#principal_slider'));
    });

    $('#deposits_slider').on('input', function () {
        $("#deposits_text").get(0).MaterialTextfield.change(this.value);
    });
    $('#inp_deposits_text').keyup(function () {
        $("#deposits_slider").get(0).MaterialSlider.change($('#inp_deposits_text').val());
        console.dir($('#deposits_slider'));
    });

    $('#duration_slider').on('input', function () {
        $("#duration_text").get(0).MaterialTextfield.change(this.value);
    });
    $('#inp_duration_text').keyup(function () {
        $("#duration_slider").get(0).MaterialSlider.change($('#inp_duration_text').val());
        console.dir($('#duration_slider'));
    });
}

function setupCalculatorInput() {
    $("form[data-calculate-fixed_deposit-returns]").submit(function (event) {
        event.preventDefault();
    });

    $("#principal_slider, #inp_principal_text," +
        "#deposits_slider, #inp_deposits_text," +
        "#duration_slider, #inp_duration_text," +
        "#duration_multiplier").bind('input change keyup', function () {
        updateInvestmentList();
    });

    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(function () {
        updateInvestmentList();
    });
}

function setClickListenerOnInvestments() {
    $(".investments-list .investment").click(function () {
        var link = $(this).data('href');
        location.href = link
    });
}

function updateInvestmentList() {
    var principal = parseFloat($('#inp_principal_text').val());
    var deposits = parseFloat($('#inp_deposits_text').val());
    var duration = parseFloat($('#inp_duration_text').val());
    var duration_multiplier = parseFloat($('#duration_multiplier').find(":checked").val());
    var annual_compounding_frequency = 12;

    console.log("======================");
    console.log("principal", principal);
    console.log("deposits", deposits);
    console.log("duration", duration);
    console.log("annual_compounding_frequency", annual_compounding_frequency);
    console.log("duration_multiplier", duration_multiplier);

    saveCalculatorInputs(principal, deposits, duration, duration_multiplier, annual_compounding_frequency);

    var duration_in_years = duration / duration_multiplier;

    $(".investment").each(function (index, element) {
        console.log("-----------------");
        updateInvestment(element, principal, deposits, annual_compounding_frequency, duration_in_years, duration, duration_multiplier);
    });
    console.log("                    ");
    console.log("                    ");
}

function updateInvestment(element, principal, deposits, annual_compounding_frequency, duration_in_years, duration, duration_multiplier) {
    var annual_interest_rate = parseFloat($(element).find('[name=annual_interest_rate]').val()) / 100;

    var finalBalance = getTompoundInterestWithDeposits(principal, deposits, annual_interest_rate,
        annual_compounding_frequency, duration_in_years);
    var totalDeposits = getTotalDeposits(deposits, annual_compounding_frequency, duration_in_years);
    var totalInterest = getTotalInterest(finalBalance, totalDeposits, principal);


    var finalBalanceString = accounting.formatMoney(finalBalance, "", 2);
    var totalDepositsString = accounting.formatMoney(totalDeposits, "", 2);
    var totalInterestString = accounting.formatMoney(totalInterest, "", 2);

    console.log("annual_interest_rate", annual_interest_rate);
    console.log("finalBalance", finalBalanceString);
    console.log("totalDeposits", totalDepositsString);
    console.log("totalInterest", totalInterestString);

    $(element).find('.final_balance').html(finalBalanceString);
    $(element).find('.total_deposits').html(totalDepositsString);
    $(element).find('.total_interest').html(totalInterestString);


    var dataArray = getDataArray(duration, duration_multiplier, principal, deposits, annual_interest_rate, annual_compounding_frequency, dataArray);

    if (document.getElementById('chart_div') !== null) {
        updateBarChart(dataArray);
    }
}

function updateBarChart(dataArray) {
    var data = google.visualization.arrayToDataTable(dataArray);

    var options = {
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
        isStacked: true
    };

    var chart = new google.visualization.ColumnChart(
        document.getElementById('chart_div'));

    chart.draw(data, options);
}

function saveCalculatorInputs(principal, deposits, duration, duration_multiplier, annual_compounding_frequency) {
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
}

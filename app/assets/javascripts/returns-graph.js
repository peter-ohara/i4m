$(document).ready(function () {
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(function () {
        drawMultSeries();
    });

    var options = {
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
        isStacked: true
    };

    function drawMultSeries() {
        var data = google.visualization.arrayToDataTable([
            ['Genre', 'Principal', 'Deposits', 'Interest', { role: 'annotation' } ],
            ['2010', 10, 24, 20, ''],
            ['2020', 16, 22, 23, ''],
            ['2030', 28, 19, 29, '']
        ]);

        var chart = new google.visualization.ColumnChart(
            document.getElementById('chart_div'));

        chart.draw(data, options);
    }
});

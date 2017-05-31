$(function () {
    var option = {
        responsive: true,
        scales: {
            xAxes: [{
                stacked: true
            }],
            yAxes: [{
                stacked: true
            }]
        }
    };

    var ctx = document.getElementById("myChart").getContext('2d');

    var data = {
        labels: ["Estimated Returns"],
        datasets: [
            {
                stack: "principal",
                label: "Principal",
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "rgba(220,220,220,0.75)",
                highlightStroke: "rgba(220,220,220,1)",
                data: [65]
            },
            {
                stack: "interest",
                label: "Interest",
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,0.8)",
                highlightFill: "rgba(151,187,205,0.75)",
                highlightStroke: "rgba(151,187,205,1)",
                data: [45]
            },
            {
                stack: "balance",
                label: "Balance",
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,0.8)",
                highlightFill: "rgba(151,187,205,0.75)",
                highlightStroke: "rgba(151,187,205,1)",
                data: [28]
            }
        ]
    };

    var myBarChart = new Chart(ctx).Bar(data, option);
});


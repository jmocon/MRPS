// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});


function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Reports_Usage_Datatable.aspx",
        columns: [
            { "data": "Name" },
            { "data": "Buy" },
            { "data": "Sold" },
            { "data": "Spoiled" },
            { "data": "Subsidized" },
            { "data": "Produced" }
        ],
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });

    setInterval(function () {
        table.ajax.reload(null, false); // user paging is not reset on reload
    }, 30000);
}



//function PrintPDF() {
//    var doc = new jsPDF();
//    var specialElementHandlers = {
//        '#editor': function (element, renderer) {
//            return true;
//        }
//    };
//    doc.fromHTML($('#content').html(), 15, 15, {
//        'width': 170,
//        'elementHandlers': specialElementHandlers
//    });
//    doc.save('UsageReport.pdf');
//}
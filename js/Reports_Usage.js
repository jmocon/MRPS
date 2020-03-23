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
        ]
    });

    setInterval(function () {
        table.ajax.reload(null, false); // user paging is not reset on reload
    }, 30000);
}
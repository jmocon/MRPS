$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Reports_Usage_Datatable.aspx?Start=" + $('#PageBody_txt_Start_Date').val() + "&End=" + $('#PageBody_txt_End_Date').val(),
        columns: [
            { "data": "Name" },
            { "data": "Buy" },
            { "data": "Sold" },
            { "data": "Spoiled" },
            { "data": "Subsidized" },
            { "data": "Produced" }
        ]
    });

    //setInterval(function () {
    //    table.ajax.reload(null, false); // user paging is not reset on reload
    //}, 10000);
}
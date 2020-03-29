// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function TypeChange() {
    var type = $('#PageBody_sel_Add_Type').val();
    switch (type) {
        case '0': {
            $('#txt_Add_Day').empty();
            $('#txt_Add_Day').append(`<option value="">0</option>`);
            break;
        }
        case '1': {
            $('#txt_Add_Day').empty();
            for (var i = 1; i <= 7; i++) {
                $('#txt_Add_Day').append(`<option value="` + i + `">` + i + `</option>`);
            }
            break;
        }
        case '2': {
            $('#txt_Add_Day').empty();
            for (var i = 1; i <= 30; i++) {
                $('#txt_Add_Day').append(`<option value="` + i + `">` + i + `</option>`);
            }
            break;
        }
        default:
    }
}

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Forecast_Datatable.aspx",
        columns: [
            { "data": "Item" },
            { "data": "Type" },
            { "data": "Day" },
            { "data": "StartDate" },
            { "data": "EndDate" },
            {
                "data": "Id",
                "render": function (data, type, row, meta) {
                    return `
                <div class ="btn-group" role="group">
                    <button type="button" class="btn" onclick= "modalView(`+ data + `)" data-toggle="modal" data-target="#modalView">
                      <i class="fas fa-eye"></i>
                    </button>
                    <button type="button" class="btn" onclick= "modalDelete(`+ data + `)" data-toggle="modal" data-target="#modalDelete">
                      <i class="fas fa-trash"></i>
                    </button>
                </div>
                `;
                }
            }
        ]
    });

    setInterval(function () {
        table.ajax.reload(null, false); // user paging is not reset on reload
    }, 30000);
}
function CheckInput(com) {
    if (com == 'add') {
        if (!$('#txt_Add_Day').val()) {
            return false;
        }
        if (!$('#txt_Add_StartDate').val()) {
            return false;
        }
        if (!$('#txt_Add_EndDate').val()) {
            return false;
        }
        if (!$('#txt_Add_Price').val()) {
            return false;
        }
        if (!$('#txt_Add_Quantity').val()) {
            return false;
        }
    }
    return true;
}
function Add() {
    var u = new Utility();
    if (CheckInput('add')) {
        var d1 = new Date($('#txt_Add_StartDate').val());
        var d2 = new Date($('#txt_Add_EndDate').val());
        if (d1 > d2) {
            var alert = {
                type: "danger",
                message: "Start Date must be less than End Date"
            };
            $('#modalAdd_notif').html(u.AlertBox(alert));
        } else {
            u.Loading('#modalAdd_notif');
            var data = {
                url: "Forecasts.aspx?f=add",
                param: {
                    Item_Id: $('#PageBody_sel_Add_Item').val(),
                    Type: $('#PageBody_sel_Add_Type').val(),
                    Day: $('#txt_Add_Day').val(),
                    StartDate: $('#txt_Add_StartDate').val(),
                    EndDate: $('#txt_Add_EndDate').val(),

                    Price: $('#txt_Add_Price').val(),
                    Supplier_Id: $('#PageBody_sel_Add_Supplier').val(),
                    Quantity: $('#txt_Add_Quantity').val(),
                    Unit_Id: $('#PageBody_sel_Add_Unit').val()
                }
            }

            u.SendData(data)
              .done(function (r) {
                  if (r.Success) {
                      var alert = {
                          type: "success",
                          message: r.Message
                      };
                      $('#modalAdd_notif').html(u.AlertBox(alert));
                      var table = $('#dataTable').DataTable();
                      table.ajax.reload(null, false);
                      $('#PageBody_sel_Add_Item').val($('#PageBody_sel_Add_Item option:first').val());
                      $('#PageBody_sel_Add_Type').val($('#PageBody_sel_Add_Type option:first').val());
                      $('#txt_Add_Day').val("");
                      $('#txt_Add_StartDate').val("");
                      $('#txt_Add_EndDate').val("");
                  } else {
                      var alert = {
                          type: "danger",
                          title: r.Title,
                          message: r.Message
                      };
                      $('#modalAdd_notif').html(u.AlertBox(alert));
                  }
              }).fail(function () {
                  $('#modalAdd_notif').html(u.AlertServerFailed());
              });
        }
    } else {
        var alert = {
            type: "danger",
            message: "Please complete all fields."
        };
        $('#modalAdd_notif').html(u.AlertBox(alert));
    }
}

function modalView(id) {
    var u = new Utility();
    u.Loading('#modalView_notif');
    var data = {
        url: "Forecasts.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Item').html(r.Model.Item);
              $('#txt_View_Type').html(r.Model.Type);
              $('#txt_View_Day').html(r.Model.Day);
              $('#txt_View_StartDate').html(r.Model.StartDate);
              $('#txt_View_EndDate').html(r.Model.EndDate);
          } else {
              var alert = {
                  type: "danger",
                  title: r.Title,
                  message: r.Message
              };
              $('#modalView_notif').html(u.AlertBox(alert));
          }
      }).fail(function () {
          $('#modalView_notif').html(u.AlertServerFailed());
      });
}

function modalEdit(id) {
    var u = new Utility();
    u.Loading('#modalEdit_notif');
    var data = {
        url: "Forecasts.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#PageBody_sel_Edit_Item').html(r.Model.Item);
              $('#PageBody_sel_Edit_Type').html(r.Model.Type);
              $('#txt_Edit_Day').html(r.Model.Day);
              $('#txt_Edit_StartDate').html(r.Model.StartDate);
              $('#txt_Edit_EndDate').html(r.Model.EndDate);
              $("#btn_Edit").attr("onclick", "Edit(" + r.Model.Id + ")");
          } else {
              var alert = {
                  type: "danger",
                  title: r.Title,
                  message: r.Message
              };
              $('#modalEdit_notif').html(u.AlertBox(alert));
          }
      }).fail(function () {
          $('#modalEdit_notif').html(u.AlertServerFailed());
      });
}

function Edit(id) {
    var u = new Utility();
    u.Loading('#modalEdit_notif');
    var data = {
        url: "Forecasts.aspx?f=editSave",
        param: {
            Id: id,
            Item: $('#PageBody_sel_Edit_Item').val(),
            Type: $('#PageBody_sel_Edit_Type').val(),
            Day: $('#txt_Edit_Day').val(),
            StartDate: $('#txt_Edit_StartDate').val(),
            EndDate: $('#txt_Edit_EndDate').val()
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              var alert = {
                  type: "success",
                  message: r.Message
              };
              $('#modalEdit_notif').html(u.AlertBox(alert));
              var table = $('#dataTable').DataTable();
              table.ajax.reload(null, false);
          } else {
              var alert = {
                  type: "danger",
                  title: r.Title,
                  message: r.Message
              };
              $('#modalEdit_notif').html(u.AlertBox(alert));
          }
      }).fail(function () {
          $('#modalEdit_notif').html(u.AlertServerFailed());
      });
}

function modalDelete(id) {
    var u = new Utility();
    u.Loading('#modalDelete_notif');
    var data = {
        url: "Forecasts.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Item').html(r.Model.Item);
              $('#txt_Delete_Type').html(r.Model.Type);
              $('#txt_Delete_Day').html(r.Model.Day);
              $('#txt_Delete_StartDate').html(r.Model.StartDate);
              $('#txt_Delete_EndDate').html(r.Model.EndDate);
              $("#btn_Delete").attr("onclick", "Delete(" + r.Model.Id + ")");
          } else {
              var alert = {
                  type: "danger",
                  title: r.Title,
                  message: r.Message
              };
              $('#modalDelete_notif').html(u.AlertBox(alert));
          }
      }).fail(function () {
          $('#modalDelete_notif').html(u.AlertServerFailed());
      });
}

function Delete(id) {
    var u = new Utility();
    u.Loading('#modalDelete_notif');
    var data = {
        url: "Forecasts.aspx?f=delete",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#modalDelete').modal('hide');
              $('#modalDeleteSuccess').modal('show');
              var table = $('#dataTable').DataTable();
              table.ajax.reload(null, false);
          } else {
              var alert = {
                  type: "danger",
                  title: r.Title,
                  message: r.Message
              };
              $('#modalDelete_notif').html(u.AlertBox(alert));
          }
      }).fail(function () {
          $('#modalDelete_notif').html(u.AlertServerFailed());
      });
}
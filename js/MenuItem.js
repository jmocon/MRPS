// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/MenuItem_Datatable.aspx?id=" + $("#dataTable").attr("data-menu-id"),
        columns: [
            { "data": "Item" },
            {
                "data": "Quantity",
                "render": function (data, type, row, meta) {
                    if (data === null) {
                        return 0;
                    };
                    return data;
                }
            },
            { "data": "Unit" },
            {
                "data": "Id",
                "render": function (data, type, row, meta) {
                    return `
                <div class ="btn-group" role="group">
                    <button type="button" class="btn" onclick= "modalEdit(`+ data + `)" data-toggle="modal" data-target="#modalEdit">
                      <i class="fas fa-pencil-alt"></i>
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
        if (!$('#PageBody_sel_Add_Item').val()) {
            return false;
        }
        if (!$('#txt_Add_Quantity').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_Unit').val()) {
            return false;
        }
    }
    return true;
}
function Add(Menu_Id) {
    if (CheckInput('add')) {
        var u = new Utility();
        u.Loading('#modalAdd_notif');
        var data = {
            url: "MenuItem.aspx?f=add",
            param: {
                Menu_Id: Menu_Id,
                Item_Id: $('#PageBody_sel_Add_Item').val(),
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
                  $('#txt_Add_Quantity').val("");
                  $('#PageBody_sel_Add_Item').val($('#PageBody_sel_Add_Item option:first').val());
                  $('#PageBody_sel_Add_Unit').val($('#PageBody_sel_Add_Unit option:first').val());
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
    } else {
        var u = new Utility();
        var alert = {
            type: "danger",
            message: "Please complete all fields."
        };
        $('#modalAdd_notif').html(u.AlertBox(alert));
    }
}

function modalEdit(id) {
    var u = new Utility();
    u.Loading('#modalEdit_notif');
    var data = {
        url: "MenuItem.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Edit_Quantity').val(r.Model.Quantity);
              $('#PageBody_sel_Edit_Item').val(r.Model.Item_Id);
              $('#PageBody_sel_Edit_Unit').val(r.Model.Unit_Id);
              $("#btn_Edit").attr("onclick", "Edit(" + r.Model.Menu_Id + "," + r.Model.Id + ")");
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

function Edit(menu_id, id) {
    var u = new Utility();
    u.Loading('#modalEdit_notif');
    var data = {
        url: "MenuItem.aspx?f=editSave",
        param: {
            Id: id,
            Item_Id: $('#PageBody_sel_Edit_Item').val(),
            Quantity: $('#txt_Edit_Quantity').val(),
            Unit_Id: $('#PageBody_sel_Edit_Unit').val()
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
    $("#btn_Delete").attr("onclick", "Delete(" + id + ")");
    //var u = new Utility();
    //u.Loading('#modalDelete_notif');
    //var data = {
    //    url: "MenuItem.aspx?f=view",
    //    param: {
    //        Id: id
    //    }
    //}

    //u.SendData(data)
    //  .done(function (r) {
    //      if (r.Success) {
    //          $('#txt_Delete_Item').html(r.Model.Item);
    //          $('#txt_Delete_Quantity').html(r.Model.Quantity);
    //          $('#txt_Delete_Unit').html(r.Model.Unit);
    //          $("#btn_Delete").attr("onclick", "Delete(" + r.Model.Id + ")");
    //      } else {
    //          var alert = {
    //              type: "danger",
    //              title: r.Title,
    //              message: r.Message
    //          };
    //          $('#modalDelete_notif').html(u.AlertBox(alert));
    //      }
    //  }).fail(function () {
    //      $('#modalDelete_notif').html(u.AlertServerFailed());
    //  });
}

function Delete(id) {
    var u = new Utility();
    u.Loading('#modalDelete_notif');
    var data = {
        url: "MenuItem.aspx?f=delete",
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
// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Item_Datatable.aspx",
        columns: [
            { "data": "Name" },
            //{
            //    "data": "Price",
            //    "render": function (data, type, row, meta) {
            //        return `Php ` + data.toFixed(2);
            //    }
            //},
            { "data": "Category" },
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
                    <button type="button" class="btn" onclick= "modalView(`+ data + `)" data-toggle="modal" data-target="#modalView">
                      <i class="fas fa-eye"></i>
                    </button>
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
        if (!$('#txt_Add_Name').val()) {
            return false;
        }
        if (!$('#txt_Add_Price').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_Category').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_Unit').val()) {
            return false;
        }
        if (!$('#txt_Add_C_Quantity').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_C_Unit').val()) {
            return false;
        }
    } else if (com == 'edit') {
        if (!$('#txt_Edit_Name').val()) {
            return false;
        }
        if (!$('#txt_Edit_Price').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Edit_Category').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Edit_Unit').val()) {
            return false;
        }
    }

    return true;
}
$("#PageBody_sel_Add_Unit").change(function () {
    $('#PageBody_sel_Add_C_Unit').val($('#PageBody_sel_Add_Unit').val());
});
function Add() {
    var u = new Utility();
    if (CheckInput('add')) {
        u.Loading('#modalAdd_notif');
        var data = {
            url: "Item.aspx?f=add",
            param: {
                Name: $('#txt_Add_Name').val(),
                Price: $('#txt_Add_Price').val(),
                Category_Id: $('#PageBody_sel_Add_Category').val(),
                Unit_Id: $('#PageBody_sel_Add_Unit').val(),
                Critical_Quantity: $('#txt_Add_C_Quantity').val(),
                Critical_Unit_Id: $('#PageBody_sel_Add_C_Unit').val()
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
                  $('#txt_Add_Name').val("");
                  $('#txt_Add_Price').val("");
                  $('#PageBody_sel_Add_Category').val($('#PageBody_sel_Add_Category option:first').val());
                  $('#PageBody_sel_Add_Unit').val($('#PageBody_sel_Add_Unit option:first').val());
                  $('#txt_Add_C_Quantity').val("");
                  $('#PageBody_sel_Add_C_Unit').val($('#PageBody_sel_Add_C_Unit option:first').val());
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
        url: "Item.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Name').html(r.Model.Name);
              $('#txt_View_Price').html(r.Model.Price);
              $('#txt_View_Category').html(r.Model.Category);
              $('#txt_View_Unit').html(r.Model.Unit);
              $('#txt_View_Quantity').html(r.Model.Quantity);
              $('#txt_View_DateCreated').html(r.Model.DateCreated);
              $('#txt_View_C_Quantity').html(r.Model.Critical_Quantity);
              $('#txt_View_C_Unit').html(r.Model.Critical_Unit);
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
        url: "Item.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Edit_Name').val(r.Model.Name);
              $('#txt_Edit_Price').val(r.Model.Price);
              $('#PageBody_sel_Edit_Category').val(r.Model.Category_Id);
              $('#PageBody_sel_Edit_Unit').val(r.Model.Unit_Id);
              $('#txt_Edit_C_Quantity').val(r.Model.Critical_Quantity);
              $('#sel_Edit_C_Unit').val(r.Model.Critical_Unit_Id);
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
    if (CheckInput('edit')) {
        u.Loading('#modalEdit_notif');
        var data = {
            url: "Item.aspx?f=editSave",
            param: {
                Id: id,
                Name: $('#txt_Edit_Name').val(),
                Price: $('#txt_Edit_Price').val(),
                Category_Id: $('#PageBody_sel_Edit_Category').val(),
                Unit_Id: $('#PageBody_sel_Edit_Unit').val(),
                Critical_Quantity: $('#txt_Edit_C_Quantity').val(),
                Critical_Unit_Id: $('#PageBody_sel_Edit_C_Unit').val()
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
    } else {
        var alert = {
            type: "danger",
            message: "Please complete all fields."
        };
        $('#modalEdit_notif').html(u.AlertBox(alert));
    }
}

function modalDelete(id) {
    var u = new Utility();
    u.Loading('#modalDelete_notif');
    var data = {
        url: "Item.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Name').html(r.Model.Name);
              $('#txt_Delete_Price').html(r.Model.Price);
              $('#txt_Delete_Category').html(r.Model.Category);
              $('#txt_Delete_Unit').html(r.Model.Unit);
              $('#txt_Delete_Quantity').html(r.Model.Quantity);
              $('#txt_Delete_DateCreated').html(r.Model.DateCreated);
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
        url: "Item.aspx?f=delete",
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
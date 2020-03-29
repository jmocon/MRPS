// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Purchase_Datatable.aspx",
        columns: [
            { "data": "Item" },
            { "data": "Type" },
            { "data": "Price" },
            { "data": "Supplier" },
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
            { "data": "DatePurchased" },
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
        if (!$('#PageBody_sel_Add_Type').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_Item').val()) {
            return false;
        }
        if (!$('#txt_Add_DatePurchased').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_Supplier').val()) {
            return false;
        }
        if (!$('#txt_Add_Price').val()) {
            return false;
        }
        if (!$('#txt_Add_Quantity').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Add_Unit').val()) {
            return false;
        }
    } else if (com == 'edit') {
        if (!$('#PageBody_sel_Edit_Type').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Edit_Item').val()) {
            return false;
        }
        if (!$('#txt_Edit_DatePurchased').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Edit_Supplier').val()) {
            return false;
        }
        if (!$('#txt_Edit_Price').val()) {
            return false;
        }
        if (!$('#txt_Edit_Quantity').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Edit_Unit').val()) {
            return false;
        }
    }

    return true;
}

function Add() {
    var u = new Utility();
    if (CheckInput('add')) {
        u.Loading('#modalAdd_notif');
        var data = {
            url: "Purchase.aspx?f=add",
            param: {
                Type: $('#PageBody_sel_Add_Type').val(),
                Item_Id: $('#PageBody_sel_Add_Item').val(),
                DatePurchased: $('#txt_Add_DatePurchased').val(),
                Supplier_Id: $('#PageBody_sel_Add_Supplier').val(),
                Price: $('#txt_Add_Price').val(),
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

                  $('#PageBody_sel_Add_Type').val($('#PageBody_sel_Add_Type option:first').val());
                  $('#PageBody_sel_Add_Item').val($('#PageBody_sel_Add_Item option:first').val());
                  $('#txt_Add_DatePurchased').val("");
                  $('#PageBody_sel_Add_Supplier').val($('#PageBody_sel_Add_Supplier option:first').val());
                  $('#txt_Add_Price').val("");
                  $('#txt_Add_Quantity').val("");
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
        url: "Purchase.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Type').html(r.Model.Type);
              $('#txt_View_Item').html(r.Model.Item);
              $('#txt_View_DatePurchased').html(r.Model.DatePurchased);
              $('#txt_View_Supplier').html(r.Model.Supplier);
              $('#txt_View_Price').html(r.Model.Price);
              $('#txt_View_Quantity').html(r.Model.Quantity);
              $('#txt_View_Unit').html(r.Model.Unit);
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
        url: "Purchase.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#PageBody_sel_Edit_Type').val(r.Model.Type);
              $('#PageBody_sel_Edit_Item').val(r.Model.Item_Id);
              $('#txt_Edit_DatePurchased').val(r.Model.DatePurchased_S);
              $('#PageBody_sel_Edit_Supplier').val(r.Model.Supplier_Id);
              $('#txt_Edit_Price').val(r.Model.Price);
              $('#txt_Edit_Quantity').val(r.Model.Quantity);
              $('#PageBody_sel_Edit_Unit').val(r.Model.Unit_Id);
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
            url: "Purchase.aspx?f=editSave",
            param: {
                Id: id,
                Type: $('#PageBody_sel_Edit_Type').val(),
                Item_Id: $('#PageBody_sel_Edit_Item').val(),
                DatePurchased: $('#txt_Edit_DatePurchased').val(),
                Supplier_Id: $('#PageBody_sel_Edit_Supplier').val(),
                Price: $('#txt_Edit_Price').val(),
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
        url: "Purchase.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Type').html(r.Model.Type);
              $('#txt_Delete_Item').html(r.Model.Item);
              $('#txt_Delete_DatePurchased').html(r.Model.DatePurchased);
              $('#txt_Delete_Supplier').html(r.Model.Supplier);
              $('#txt_Delete_Price').html(r.Model.Price);
              $('#txt_Delete_Quantity').html(r.Model.Quantity);
              $('#txt_Delete_Unit').html(r.Model.Unit);

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
        url: "Purchase.aspx?f=delete",
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
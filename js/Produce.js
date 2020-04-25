// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
    InitializeDatatableCart(0);
    var table = $('#dataTable2').DataTable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Produce_Datatable.aspx",
        columns: [
            { "data": "ProductionCart_Id" },
            { "data": "Menu" },
            { "data": "Quantity" },
            {
                "data": "Status",
                "render": function (data, type, row, meta) {
                    switch (data) {
                        case "Pending":
                            return `<p class="text-secondary m-0 p-0">` + data + `</p>`;
                        case "Started":
                            return `<p class="text-success m-0 p-0">` + data + `</p>`;
                        case "Near Completion":
                            return `<p class="text-warning m-0 p-0">` + data + `</p>`;
                        case "Overdue":
                            return `<p class="text-danger m-0 p-0">` + data + `</p>`;
                        case "Done":
                            return `<p class="text-primary m-0 p-0">` + data + `</p>`;
                        default:
                            return data;
                    }
                }
            },
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

function updateCartTable(cartid) {
    var tableCart = $('#dataTable2').DataTable();
    tableCart.ajax.url('Ajax/Produce_Datatable.aspx?Cart=' + cartid).load();
}

function InitializeDatatableCart(cartid) {
    var tableCart = $('#dataTable2').DataTable({
        ajax: "Ajax/Produce_Datatable.aspx?Cart=" + cartid,
        columns: [
            { "data": "Menu" },
            { "data": "Quantity" },
            {
                "data": "Id",
                "render": function (data, type, row, meta) {
                    return `
                    <button type="button" class ="btn" onclick= "DeleteFromCart(`+ data + `)">
                      <i class="fas fa-trash"></i>
                    </button>
                `;
                }
            }
        ]
    });
}

function CheckInput(com) {
    if (com == 'add') {
        if (!$('#PageBody_sel_Add_Menu').val()) {
            return false;
        }
        if (!$('#txt_Add_Quantity').val()) {
            return false;
        }
    } else if (com == 'edit') {
        if (!$('#PageBody_sel_Edit_Menu').val()) {
            return false;
        }
        if (!$('#txt_Edit_Quantity').val()) {
            return false;
        }
        if (!$('#PageBody_sel_Edit_Status').val()) {
            return false;
        }
    }

    return true;
}

function AddProduceCart() {
    var u = new Utility();
    u.Loading('#modalAdd_notif');
    var data = {
        url: "Produce.aspx?f=addCart",
        param: {}
    }

    u.SendData(data)
        .done(function (r) {
            if (r.Success) {
                sessionStorage.setItem("ProduceCart", r.Message);
                updateCartTable(r.Message);
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

function Add() {
    var u = new Utility();
    if (CheckInput('add')) {
        u.Loading('#modalAdd_notif');
        var data = {
            url: "Produce.aspx?f=add",
            param: {
                Menu_Id: $('#PageBody_sel_Add_Menu').val(),
                Quantity: $('#txt_Add_Quantity').val(),
                Status: $('#PageBody_sel_Add_Status').val(),
                ProductionCart_Id: sessionStorage.getItem("ProduceCart")
            }
        }

        u.SendData(data)
          .done(function (r) {
              if (r.Success) {
                  var alert = {
                      type: "success",
                      message: "Item Added"
                  };
                  $('#modalAdd_notif').html(u.AlertBox(alert));
                  var table = $('#dataTable2').DataTable();
                  table.ajax.reload(null, false);
                  checkCritical($('#PageBody_sel_Add_Menu').val(), $('#txt_Add_Quantity').val());
                  $('#PageBody_sel_Add_Menu').val($('#PageBody_sel_Add_Menu option:first').val());
                  $('#txt_Add_Quantity').val("");
                  $('#PageBody_sel_Add_Status').val($('#PageBody_sel_Add_Status option:first').val());
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
}

function checkCritical(menu_id, quantity) {

    var u = new Utility();
    var data = {
        url: "Produce.aspx?f=checkcritical",
        param: {
            Menu_Id: $('#PageBody_sel_Add_Menu').val(),
            Quantity: $('#txt_Add_Quantity').val()
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
          } else {
              var alert = {
                  type: "danger",
                  title: r.Title,
                  message: "Following item/s are on critical: " + r.Message
              };
              $('#modalAdd_notif').append(' ' + u.AlertBox(alert));
          }
      }).fail(function () {
          $('#modalAdd_notif').html(u.AlertServerFailed());
      });
}

function modalView(id) {
    var u = new Utility();
    u.Loading('#modalView_notif');
    var data = {
        url: "Produce.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Menu').html(r.Model.Menu);
              $('#txt_View_Quantity').html(r.Model.Quantity);
              $('#txt_View_Status').html(r.Model.Status);
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
        url: "Produce.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#PageBody_sel_Edit_Menu').val(r.Model.Menu_Id);
              $('#txt_Edit_Quantity').val(r.Model.Quantity);
              $('#PageBody_sel_Edit_Status').val(r.Model.Status);
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
            url: "Produce.aspx?f=editSave",
            param: {
                Id: id,
                Menu_Id: $('#PageBody_sel_Edit_Menu').val(),
                Quantity: $('#txt_Edit_Quantity').val(),
                Status: $('#PageBody_sel_Edit_Status').val()
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
}

function Finish() {
    var u = new Utility();
    u.Loading('#modalAdd_notif');
    var data = {
        url: "Produce.aspx?f=finish",
        param: {
            Id: sessionStorage.getItem("ProduceCart")
        }
    }

    u.SendData(data)
        .done(function (r) {
            if (r.Success) {
                var table = $('#dataTable').DataTable();
                table.ajax.reload(null, false);
                $('#modalAdd').modal('hide');
                $('#modalAdd_notif').html("");
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

function modalDelete(id) {
    var u = new Utility();
    u.Loading('#modalDelete_notif');
    var data = {
        url: "Produce.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Menu').html(r.Model.Menu);
              $('#txt_Delete_Quantity').html(r.Model.Quantity);
              $('#txt_Delete_Status').html(r.Model.Status);
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
        url: "Produce.aspx?f=delete",
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

function DeleteFromCart(id) {
    var u = new Utility();
    u.Loading('#modalDelete_notif');
    var data = {
        url: "Produce.aspx?f=delete",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              var alert = {
                  type: "success",
                  message: "Item Removed"
              };
              $('#modalAdd_notif').html(u.AlertBox(alert));
              var table = $('#dataTable2').DataTable();
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
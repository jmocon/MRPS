// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Produce_Datatable.aspx",
        columns: [
            { "data": "Manu" },
            { "data": "Quantity" },
            { "data": "Status" }
        ]
    });

    setInterval(function () {
        table.ajax.reload(null, false); // user paging is not reset on reload
    }, 30000);
}

function Add() {
    var u = new Utility();
    u.Loading('#modalAdd_notif');
    var data = {
        url: "Produce.aspx?f=add",
        param: {
            Menu_Id: $('#PageBody_sel_Add_Menu').val(),
            Quantity: $('#txt_Add_Quantity').val(),
            Status: $('#PageBody_sel_Add_Status').val()
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
              $('#txt_View_Menu').html(r.Model.Menu);
              $('#txt_View_Quantity').html(r.Model.Quantity);
              $('#txt_View_Status').html(r.Model.Status);
              $('#txt_View_Unit').html(r.Model.Unit);
              $('#txt_View_Quantity').html(r.Model.Quantity);
              $('#txt_View_DateCreated').html(r.Model.DateCreated);
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
              $('#txt_Edit_Menu').val(r.Model.Menu);
              $('#txt_Edit_Quantity').val(r.Model.Quantity);
              $('#PageBody_sel_Edit_Status').val(r.Model.Status);
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
    u.Loading('#modalEdit_notif');
    var data = {
        url: "Item.aspx?f=editSave",
        param: {
            Id: id,
            Menu: $('#txt_Edit_Menu').val(),
            Quantity: $('#txt_Edit_Quantity').val(),
            Status: $('#PageBody_sel_Edit_Status').val(),
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
              $('#txt_Delete_Menu').html(r.Model.Menu);
              $('#txt_Delete_Quantity').html(r.Model.Quantity);
              $('#txt_Delete_Status').html(r.Model.Status);
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
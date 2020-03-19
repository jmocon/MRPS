$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Menu_Datatable.aspx",
        columns: [
            { "data": "Name" },
            {
                "data": "Price",
                "render": function (data, type, row, meta) {
                    return `Php ` + data.toFixed(2);
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

function ClearAddModal() {
    $('#modalAdd_notif').html("");
    $('#txt_Add_Name').val("");
    $('#txt_Add_Price').val("");
    $('#txt_Add_Timer').val("");
    $('#txt_Add_Description').val("");
}

function Add() {
    var u = new Utility();
    u.Loading('#modalAdd_notif');
    var data = {
        url: "Menu.aspx?f=add",
        param: {
            Name: $('#txt_Add_Name').val(),
            Price: $('#txt_Add_Price').val(),
            Timer: $('#txt_Add_Timer').val(),
            Description: $('#txt_Add_Description').val()
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              ClearAddModal();
              var alert = {
                  type: "success",
                  message: r.Message
              };
              var table = $('#dataTable').DataTable();
              table.ajax.reload(null, false);
              $('#modalAdd_notif').html(u.AlertBox(alert));
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
        url: "Menu.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Name').html(r.Model.Name);
              $('#txt_View_Price').html(r.Model.Price);
              $('#txt_View_Timer').html(r.Model.Timer + " min/s");
              $('#txt_View_Description').html(r.Model.Description);
              $("#btn_View").attr("href", "MenuItem.aspx?id=" + id);
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
        url: "Menu.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Edit_Name').val(r.Model.Name);
              $('#txt_Edit_Price').val(r.Model.Price);
              $('#txt_Edit_Timer').val(r.Model.Timer);
              $('#txt_Edit_Description').val(r.Model.Description);
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
        url: "Menu.aspx?f=editSave",
        param: {
            Id: id,
            Name: $('#txt_Edit_Name').val(),
            Price: $('#txt_Edit_Price').val(),
            Timer: $('#txt_Edit_Timer').val(),
            Description: $('#txt_Edit_Description').val()
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
        url: "Menu.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Name').html(r.Model.Name);
              $('#txt_Delete_Price').html(r.Model.Price);
              $('#txt_Delete_Timer').html(r.Model.Timer + " min/s");
              $('#txt_Edit_Description').html(r.Model.Description);
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
        url: "Menu.aspx?f=delete",
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
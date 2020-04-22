// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/User_Datatable.aspx",
        columns: [
            { "data": "Name" },
            { "data": "Username" },
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

function Add() {
    var u = new Utility();
    u.Loading('#modalAdd_notif');
    var data = {
        url: "Users.aspx?f=add",
        param: {
            Name: $('#txt_Add_Name').val(),
            Username: $('#txt_Add_Username').val(),
            Password: $('#txt_Add_Password').val()
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
              $('#txt_Add_Username').val("");
              $('#txt_Add_Password').val("");
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
        url: "Users.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Name').html(r.Model.Name);
              $('#txt_View_Username').html(r.Model.Username);
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
        url: "Users.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Edit_Name').val(r.Model.Name);
              $('#txt_Edit_Username').val(r.Model.Username);
              $('#txt_Edit_Password').val(r.Model.Password);
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
        url: "Users.aspx?f=editSave",
        param: {
            Id: id,
            Name: $('#txt_Edit_Name').val(),
            Username: $('#txt_Edit_Username').val(),
            Password: $('#txt_Edit_Password').val()
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
        url: "Users.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Name').html(r.Model.Name);
              $('#txt_Delete_Username').html(r.Model.Username);
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
        url: "Users.aspx?f=delete",
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
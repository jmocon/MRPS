// Call the dataTables jQuery plugin
$(document).ready(function () {
    InitializeDatatable();
});

function InitializeDatatable() {
    var table = $('#dataTable').DataTable({
        ajax: "Ajax/Supplier_Datatable.aspx",
        columns: [
            { "data": "Name" },
            { "data": "PersonName" },
            { "data": "MobileNumber" },
            { "data": "Landline" },
            { "data": "EmailAddress" },
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
        url: "Supplier.aspx?f=add",
        param: {
            Name: $('#txt_Add_Name').val(),
            PersonName: $('#txt_Add_PersonName').val(),
            Address: $('#txt_Add_Address').val(),
            MobileNumber: $('#txt_Add_MobileNumber').val(),
            Landline: $('#txt_Add_Landline').val(),
            EmailAddress: $('#txt_Add_EmailAddress').val()
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
              $('#txt_Add_PersonName').val("");
              $('#txt_Add_Address').val("");
              $('#txt_Add_MobileNumber').val("");
              $('#txt_Add_Landline').val("");
              $('#txt_Add_EmailAddress').val("");
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
        url: "Supplier.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_View_Name').html(r.Model.Name);
              $('#txt_View_PersonName').html(r.Model.PersonName);
              $('#txt_View_MobileNumber').html(r.Model.MobileNumber);
              $('#txt_View_Landline').html(r.Model.Landline);
              $('#txt_View_Address').html(r.Model.Address);
              $('#txt_View_EmailAddress').html(r.Model.EmailAddress);
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
        url: "Supplier.aspx?f=getbyid",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Edit_Name').val(r.Model.Name);
              $('#txt_Edit_PersonName').val(r.Model.PersonName);
              $('#txt_Edit_Address').val(r.Model.Address);
              $('#txt_Edit_MobileNumber').val(r.Model.MobileNumber);
              $('#txt_Edit_Landline').val(r.Model.Landline);
              $('#txt_Edit_EmailAddress').val(r.Model.EmailAddress);
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
        url: "Supplier.aspx?f=editSave",
        param: {
            Id: id,
            Name: $('#txt_Edit_Name').val(),
            PersonName: $('#txt_Edit_PersonName').val(),
            Address: $('#txt_Edit_Address').val(),
            MobileNumber: $('#txt_Edit_MobileNumber').val(),
            Landline: $('#txt_Edit_Landline').val(),
            EmailAddress: $('#txt_Edit_EmailAddress').val()
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
        url: "Supplier.aspx?f=view",
        param: {
            Id: id
        }
    }

    u.SendData(data)
      .done(function (r) {
          if (r.Success) {
              $('#txt_Delete_Name').html(r.Model.Name);
              $('#txt_Delete_PersonName').html(r.Model.PersonName);
              $('#txt_Delete_Address').html(r.Model.Address);
              $('#txt_Delete_MobileNumber').html(r.Model.MobileNumber);
              $('#txt_Delete_Landline').html(r.Model.Landline);
              $('#txt_Delete_EmailAddress').html(r.Model.EmailAddress);
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
        url: "Supplier.aspx?f=delete",
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
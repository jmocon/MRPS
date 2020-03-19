<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Suppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <div>
      <h1 class="h3 mb-0 text-gray-800">Supplier List</h1>
      <p class="mb-4">This page shows the list of all suppliers.</p>
    </div>
    <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#modalAdd">
      <i class="fas fa-plus fa-sm text-white-50 mr-1"></i>Add new Supplier
    </button>
  </div>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Name</th>
              <th>Person Name</th>
              <th>Mobile Number</th>
              <th>Landline</th>
              <th>Email Address</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Name</th>
              <th>PersonName</th>
              <th>MobileNumber</th>
              <th>Landline</th>
              <th>EmailAddress</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Add Modal -->
  <div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">New Supplier</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12" id="modalAdd_notif">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Name</label>
              <input type="text" class="form-control" id="txt_Add_Name" placeholder="Name">
            </div>
            <div class="col-6">
              <label>Person Name</label>
              <input type="text" class="form-control" id="txt_Add_PersonName" placeholder="Person Name">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Address</label>
              <input type="text" class="form-control" id="txt_Add_Address" placeholder="Address">
            </div>
            <div class="col-6">
              <label>Mobile Number</label>
              <input type="text" class="form-control" id="txt_Add_MobileNumber" placeholder="Mobile Number">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Landline</label>
              <input type="text" class="form-control" id="txt_Add_Landline" placeholder="Landline">
            </div>
            <div class="col-6">
              <label>Email Address</label>
              <input type="text" class="form-control" id="txt_Add_EmailAddress" placeholder="Email Address">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="Add()">Add</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- View Modal -->
  <div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="modalView" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Supplier Details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12" id="modalView_notif">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Name</label>
              <div class="form-control" id="txt_View_Name">Name</div>
            </div>
            <div class="col-6">
              <label>PersonName</label>
              <div class="form-control" id="txt_View_PersonName">PersonName</div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Address</label>
              <div class="form-control" id="txt_View_Address">Address</div>
            </div>
            <div class="col-6">
              <label>Mobile Number</label>
              <div class="form-control" id="txt_View_MobileNumber">MobileNumber</div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Landline</label>
              <div class="form-control" id="txt_View_Landline">Landline</div>
            </div>
            <div class="col-6">
              <label>Email Address</label>
              <div class="form-control" id="txt_View_EmailAddress">EmailAddress</div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Edit Modal -->
  <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="modalEdit" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Edit Supplier Details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12" id="modalEdit_notif">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Name</label>
              <input type="text" class="form-control" id="txt_Edit_Name" placeholder="Name">
            </div>
            <div class="col-6">
              <label>Person Name</label>
              <input type="text" class="form-control" id="txt_Edit_PersonName" placeholder="Person Name">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Address</label>
              <input type="text" class="form-control" id="txt_Edit_Address" placeholder="Address">
            </div>
            <div class="col-6">
              <label>Mobile Number</label>
              <input type="text" class="form-control" id="txt_Edit_MobileNumber" placeholder="Mobile Number">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Landline</label>
              <input type="text" class="form-control" id="txt_Edit_Landline" placeholder="Landline">
            </div>
            <div class="col-6">
              <label>Email Address</label>
              <input type="text" class="form-control" id="txt_Edit_EmailAddress" placeholder="Email Address">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="btn_Edit" onclick="Edit()">Save changes</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Delete Modal -->
  <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modalDelete" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Delete Supplier</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12" id="modalDelete_notif">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-12">
              <h2>Delete Supplier?</h2>
              <p>All related to this item will be deleted as well. This action cannot be undone</p>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Name</label>
              <div class="form-control" id="txt_Delete_Name">Name</div>
            </div>
            <div class="col-6">
              <label>Person Name</label>
              <div class="form-control" id="txt_Delete_PersonName">PersonName</div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Address</label>
              <div class="form-control" id="txt_Delete_Address">Address</div>
            </div>
            <div class="col-6">
              <label>Mobile Number</label>
              <div class="form-control" id="txt_Delete_MobileNumber">MobileNumber</div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Landline</label>
              <div class="form-control" id="txt_Delete_Landline">Landline</div>
            </div>
            <div class="col-6">
              <label>Email Address</label>
              <div class="form-control" id="txt_Delete_EmailAddress">EmailAddress</div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" id="btn_Delete">Delete</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Delete Modal -->
  <div class="modal fade" id="modalDeleteSuccess" tabindex="-1" role="dialog" aria-labelledby="modalDelete" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-body p-0">
          <div class="alert alert-success alert-dismissible fade show m-0" role="alert">
            Successfully delete supplier.
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" runat="Server">
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <script src="js/Utility.js"></script>
  <script src="js/Supplier.js"></script>
</asp:Content>
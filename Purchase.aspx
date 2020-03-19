<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Purchase.aspx.cs" Inherits="Purchases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <div>
      <h1 class="h3 mb-2 text-gray-800">Purchase List</h1>
      <p class="mb-4">This page shows the list of all the transactions of items.</p>
    </div>
    <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#modalAdd">
      <i class="fas fa-plus fa-sm text-white-50 mr-1"></i>Add new Purchase
    </button>
  </div>

  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Item</th>
              <th>Type</th>
              <th>Price</th>
              <th>Supplier</th>
              <th>Quantity</th>
              <th>Unit</th>
              <th>Date</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Item</th>
              <th>Type</th>
              <th>Price</th>
              <th>Supplier</th>
              <th>Quantity</th>
              <th>Unit</th>
              <th>Date</th>
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
          <h5 class="modal-title">New Purchase</h5>
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
            <div class="col-4">
              <label>Type</label>
              <asp:DropDownList ID="sel_Add_Type" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-4">
              <label>Item</label>
              <asp:DropDownList ID="sel_Add_Item" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-4">
              <label>Date Purchased</label>
              <input type="date" class="form-control" id="txt_Add_DatePurchased">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Supplier</label>
              <asp:DropDownList ID="sel_Add_Supplier" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-6">
              <label>Price</label>
              <input type="number" class="form-control" id="txt_Add_Price" placeholder="Price">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Quantity</label>
              <input type="number" min="1" class="form-control" id="txt_Add_Quantity" placeholder="Quantity">
            </div>
            <div class="col-6">
              <label>Unit</label>
              <asp:DropDownList ID="sel_Add_Unit" class="form-control" runat="server"></asp:DropDownList>
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
          <h5 class="modal-title">Purchase Details</h5>
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
            <div class="col-4">
              <label>Type</label>
              <div id="txt_View_Type" class="form-control"></div>
            </div>
            <div class="col-4">
              <label>Item</label>
              <div id="txt_View_Item" class="form-control"></div>
            </div>
            <div class="col-4">
              <label>Date Purchased</label>
              <div id="txt_View_DatePurchased" class="form-control"></div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Supplier</label>
              <div id="txt_View_Supplier" class="form-control"></div>
            </div>
            <div class="col-6">
              <label>Price</label>
              <div id="txt_View_Price" class="form-control"></div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Quantity</label>
              <div id="txt_View_Quantity" class="form-control"></div>
            </div>
            <div class="col-6">
              <label>Unit</label>
              <div id="txt_View_Unit" class="form-control"></div>
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
          <h5 class="modal-title">Edit Item Details</h5>
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
            <div class="col-4">
              <label>Type</label>
              <asp:DropDownList ID="sel_Edit_Type" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-4">
              <label>Item</label>
              <asp:DropDownList ID="sel_Edit_Item" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-4">
              <label>Date Purchased</label>
              <input type="date" class="form-control" id="txt_Edit_DatePurchased">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Supplier</label>
              <asp:DropDownList ID="sel_Edit_Supplier" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-6">
              <label>Price</label>
              <input type="number" class="form-control" id="txt_Edit_Price" placeholder="Price">
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Quantity</label>
              <input type="number" min="1" class="form-control" id="txt_Edit_Quantity" placeholder="Quantity">
            </div>
            <div class="col-6">
              <label>Unit</label>
              <asp:DropDownList ID="sel_Edit_Unit" class="form-control" runat="server"></asp:DropDownList>
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
          <h5 class="modal-title">Delete Item</h5>
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
              <h2>Delete Item?</h2>
              <p>All related to this item will be deleted as well. This action cannot be undone</p>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-4">
              <label>Type</label>
              <div id="txt_Delete_Type" class="form-control"></div>
            </div>
            <div class="col-4">
              <label>Item</label>
              <div id="txt_Delete_Item" class="form-control"></div>
            </div>
            <div class="col-4">
              <label>Date Purchased</label>
              <div id="txt_Delete_DatePurchased" class="form-control"></div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Supplier</label>
              <div id="txt_Delete_Supplier" class="form-control"></div>
            </div>
            <div class="col-6">
              <label>Price</label>
              <div id="txt_Delete_Price" class="form-control"></div>
            </div>
          </div>
          <div class="row mb-2">
            <div class="col-6">
              <label>Quantity</label>
              <div id="txt_Delete_Quantity" class="form-control"></div>
            </div>
            <div class="col-6">
              <label>Unit</label>
              <div id="txt_Delete_Unit" class="form-control"></div>
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
            Successfully delete item.
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
  <script src="js/Purchase.js"></script>
</asp:Content>
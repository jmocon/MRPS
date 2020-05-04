<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Deliveries.aspx.cs" Inherits="Deliveries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <div>
      <h1 class="h3 mb-2 text-gray-800">Delivery List</h1>
      <p class="mb-4">This page shows the list of all the deliveries for the purchase.</p>
    </div>
  </div>

  <div class="row">
    <div class="col-12" id="modalAdd_notif" runat="server">
    </div>
  </div>
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="row">
        <div class="col-12">
          <h3>Add New Delivery</h3>
        </div>
      </div>
      <div class="row mb-2">
        <div class="col-4">
          <label>Purchase Id</label>
          <input type="text" class="form-control" id="txt_Purchase_Id" runat="server" disabled="disabled" />
        </div>
        <div class="col-4">
          <label>Reference No.</label>
          <input type="text" class="form-control" id="txt_Code" runat="server" />
        </div>
        <div class="col-4">
          <label>Date Received</label>
          <input type="date" class="form-control" id="txt_DateReceived" runat="server" />
        </div>
      </div>
      <div class="row mb-2">
        <div class="col-12">
          <asp:Table class="table table-striped table-bordered" ID="tbl_Items" runat="server"></asp:Table>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <input type="submit" class="btn btn-primary w-100" value="Add" runat="server" id="btnAdd" onserverclick="btnAdd_ServerClick" />
        </div>
      </div>
    </div>
  </div>

  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
        <asp:Table class="table table-striped table-bordered dataTable" ID="tbl_Delivery" runat="server"></asp:Table>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" runat="Server">
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <script src="js/Utility.js"></script>
  <script src="js/Delivery.js"></script>
</asp:Content>
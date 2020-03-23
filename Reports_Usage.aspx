<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reports_Usage.aspx.cs" Inherits="Reports_Usage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" Runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" Runat="Server">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <div>
      <h1 class="h3 mb-0 text-gray-800">Item List</h1>
      <p class="mb-4">This page shows the list of all items in the inventory.</p>
    </div>
    <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#modalAdd">
      <i class="fas fa-plus fa-sm text-white-50 mr-1"></i>Add new Item
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
              <th>Buy</th>
              <th>Sold</th>
              <th>Spoiled</th>
              <th>Subsidized</th>
              <th>Purchased</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Name</th>
              <th>Buy</th>
              <th>Sold</th>
              <th>Spoiled</th>
              <th>Subsidized</th>
              <th>Produced</th>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" Runat="Server">
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <script src="js/Utility.js"></script>
  <script src="js/Reports_Usage.js"></script>
</asp:Content>


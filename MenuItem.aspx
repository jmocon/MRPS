<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MenuItem.aspx.cs" Inherits="MenuItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Menu Item List</h1>
  <p class="mb-4">This page shows the list of all items to create a specified menu.</p>

  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="row">
        <div class="col-2">
          Name:
        </div>
        <div class="col-9">
          Onion Souper
        </div>
      </div>
      <div class="row">
        <div class="col-2">
          Price:
        </div>
        <div class="col-9">
          Php 150
        </div>
      </div>
      <div class="row">
        <div class="col-2">
          Description:
        </div>
        <div class="col-9">
          A tasty soup serve hot on the golden plate of Sapnu City. This soup was created and is still creating by our very own chef recruited from talipapa.
        </div>
      </div>
    </div>
  </div>
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Item</th>
              <th>Quantity</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Item</th>
              <th>Quantity</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td>Onion</td>
              <td>100 Pieces</td>
              <td>
                <button type="button" class="btn">
                  <i class="fas fa-eye"></i>
                </button>
                <button type="button" class="btn">
                  <i class="fas fa-pencil-alt"></i>
                </button>
                <button type="button" class="btn">
                  <i class="fas fa-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>Water</td>
              <td>0.1 Gallons</td>
              <td>
                <button type="button" class="btn">
                  <i class="fas fa-eye"></i>
                </button>
                <button type="button" class="btn">
                  <i class="fas fa-pencil-alt"></i>
                </button>
                <button type="button" class="btn">
                  <i class="fas fa-trash"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" runat="Server">
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <script>
    // Call the dataTables jQuery plugin
    $(document).ready(function () {
      $('#dataTable').DataTable();
    });
  </script>
</asp:Content>
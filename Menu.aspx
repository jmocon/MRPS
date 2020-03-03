<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Menu List</h1>
  <p class="mb-4">This page shows the list of all menu.</p>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Name</th>
              <th>Price</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Name</th>
              <th>Price</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td>Burger</td>
              <td>Php 100</td>
              <td>
                <a href="MenuItem.aspx" class="btn">
                  <i class="fas fa-eye"></i>
                </a>
                <button type="button" class="btn">
                  <i class="fas fa-pencil-alt"></i>
                </button>
                <button type="button" class="btn">
                  <i class="fas fa-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>Frapped w/ no Ice</td>
              <td>Php 150</td>
              <td>
                <a href="MenuItem.aspx" class="btn">
                  <i class="fas fa-eye"></i>
                </a>
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
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Produce.aspx.cs" Inherits="Produce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Purchase List</h1>
  <p class="mb-4">This page shows the list of all the transactions of items.</p>


  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Menu</th>
              <th>Quantity</th>
              <th>Status</th>
              <th>Date/Time</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Menu</th>
              <th>Quantity</th>
              <th>Status</th>
              <th>Date/Time</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td>Onion Soup</td>
              <td>2</td>
              <td>Cooking</td>
              <td>2020/02/20 02:30 PM</td>
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
              <td>Frapped w/ no Ice</td>
              <td>1</td>
              <td>Done</td>
              <td>2020/02/20 01:30 PM</td>
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
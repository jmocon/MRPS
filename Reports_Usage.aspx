<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reports_Usage.aspx.cs" Inherits="Reports_Usage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <div>
      <h1 class="h3 mb-0 text-gray-800">Usage Report</h1>
      <p class="mb-4">This page shows the list of all item usage.</p>
    </div>
  </div>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-12">
          <a class="btn btn-primary" id="cmd" href="PrintUsage.aspx" target="_blank">
            Save as PDF
          </a>
        </div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Name</th>
              <th>Buy</th>
              <th>Sold</th>
              <th>Spoiled</th>
              <th>Subsidized</th>
              <th>Produced</th>
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
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" runat="Server">
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <script src="js/Utility.js"></script>
  <script src="js/Reports_Usage.js"></script>

  <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>--%>
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reports_LateFrequency.aspx.cs" Inherits="Reports_LateFrequency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <h1 class="h3 mb-0 text-gray-800">Reports for Late Frequency</h1>
  <p class="mb-4">
    This page shows the summary of Late for each month for the Year of
    <asp:Label ID="lblCurrentDisplay" runat="server" Text=""></asp:Label>.
    <a href="PrintLate.aspx" class="btn btn-primary float-right">Save as PDF</a>
  </p>
  <div class="row">
    <div class="col-md-6">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Number of Lates</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <asp:Table class="table table-striped" ID="tbl_late" runat="server"></asp:Table>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" runat="Server">
  <script src="js/Utility.js"></script>
</asp:Content>
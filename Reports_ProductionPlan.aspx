<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reports_ProductionPlan.aspx.cs" Inherits="Reports_ProductionPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" Runat="Server">
  <!-- Page Heading -->
  <h1 class="h3 mb-0 text-gray-800">Production Plan</h1>
  <p class="mb-4">
    This page shows the Forecasted Production Plan.
  </p>

  <div class="row">
    <div class="col-md-6">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Overall Production Statistics</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <asp:Table class="table table-striped" ID="tbl_overall" runat="server"></asp:Table>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Last Month Production Statistics</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <asp:Table class="table table-striped" ID="tbl_lastmonth" runat="server"></asp:Table>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" Runat="Server">
</asp:Content>


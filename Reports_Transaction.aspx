<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reports_Transaction.aspx.cs" Inherits="Reports_Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
  <!-- Page Heading -->
  <h1 class="h3 mb-0 text-gray-800">Reports for Transaction</h1>
  <p class="mb-4">
    This page shows the summary of transactions for the month of
    <asp:Label ID="lblCurrentDisplay" runat="server" Text=""></asp:Label>.
    <a href="PrintSummary.aspx" class="btn btn-primary float-right">Save as PDF</a>
  </p>

  <!-- Content Row -->
  <div class="row">

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Item Buy Count</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" id="div_buy_count" runat="server"></div>
            </div>
            <div class="col-auto">
              <i class="fas fa-shopping-basket fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Item Sold Count</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" id="div_sold_count" runat="server"></div>
            </div>
            <div class="col-auto">
              <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Item Spoiled Count</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" id="div_spoiled_count" runat="server"></div>
            </div>
            <div class="col-auto">
              <i class="fas fa-trash-alt fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pending Requests Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Item Subsidized Count</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" id="div_subsidized_count" runat="server"></div>
            </div>
            <div class="col-auto">
              <i class="fas fa-gifts fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Top 5 Best Sellers</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <asp:Table class="table table-striped" ID="tbl_betsellers" runat="server"></asp:Table>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScript" runat="Server">
  <script src="js/Utility.js"></script>
  <%--<script src="js/Transaction.js"></script>--%>
</asp:Content>
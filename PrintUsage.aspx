<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintUsage.aspx.cs" Inherits="PrintUsage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Cafe by the Ruins</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
  <link href="vendor/fonts/Nunito.css" rel="stylesheet" />

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="row">
      <div class="col-12 text-center mt-4">
        <img class="img" src="img/logoWord.png" style="width: 150px;" />
        <p class="small">0927 957 4172</p>
      </div>
    </div>
    <div class="row pt-5 px-5">
      <div class="col-12">
        <h1>Usage Report <small class="h6" id="dates" runat="server"></small></h1>
      </div>
    </div>
    <div class="row py-2 px-5">
      <div class="col-12">
        <asp:Table ID="Table1" class="table table-bordered" runat="server"></asp:Table>
      </div>
    </div>
    <div class="row py-2 px-5">
      <div class="col-12">
        <p class="small m-0 text-right" runat="server" id="lblwho"></p>
      </div>
    </div>
  </form>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <script>
    $(document).ready(function () {
      window.print();
    });
  </script>
</body>
</html>
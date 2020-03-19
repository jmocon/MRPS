using Newtonsoft.Json;
using System;
using System.Web;

public partial class ajax_Supplier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        SupplierModel mdl = new SupplierModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<SupplierModel>(json);
                AddSupplier(mdl);
                break;

            case ("view"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                ViewSupplier(jsn.Id);
                break;

            case ("getbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetById(jsn.Id);
                break;

            case ("editSave"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<SupplierModel>(json);
                EditSaveSupplier(mdl);
                break;

            case ("delete"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                DeleteSupplier(jsn.Id);
                break;

            default:
                ResponseModel res = new ResponseModel
                {
                    Success = false,
                    Title = "Application Error",
                    Message = "No function called."
                };
                Response.Write(JsonConvert.SerializeObject(res));
                break;
        }
    }

    private void AddSupplier(SupplierModel mdlSupplier)
    {
        ResponseModel res = new ResponseModel();
        Supplier clsSupplier = new Supplier();
        if (clsSupplier.IsNameExist(mdlSupplier.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            mdlSupplier = clsSupplier.Add(mdlSupplier);
            res.Success = true;
            res.Message = "Successfully Added New Supplier";
            res.Model = mdlSupplier;
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewSupplier(int id)
    {
        ResponseModel res = new ResponseModel();
        Supplier clsSupplier = new Supplier();
        SupplierModel mdlSupplier = clsSupplier.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Supplier";
        res.Model = mdlSupplier;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        Supplier clsSupplier = new Supplier();
        SupplierModel mdlSupplier = clsSupplier.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Supplier";
        res.Model = mdlSupplier;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveSupplier(SupplierModel mdlSupplier)
    {
        ResponseModel res = new ResponseModel();
        Supplier clsSupplier = new Supplier();
        if (clsSupplier.IsNameExist(mdlSupplier.Id, mdlSupplier.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            int affected = clsSupplier.Edit(mdlSupplier);
            if (affected > 0)
            {
                res.Success = true;
                res.Message = "Successfully Updated Supplier";
                res.Model = mdlSupplier;
            }
            else
            {
                res.Success = false;
                res.Message = "No Supplier were Updated.";
                res.Model = mdlSupplier;
            }
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void DeleteSupplier(int id)
    {
        ResponseModel res = new ResponseModel();
        Supplier clsSupplier = new Supplier();
        int affected = clsSupplier.Delete(id);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "Supplier Successfully Deleted";
        }
        else
        {
            res.Success = false;
            res.Message = "No Supplier were Deleted.";
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }
}
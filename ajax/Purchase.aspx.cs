using Newtonsoft.Json;
using System;
using System.Web;

public partial class ajax_Purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        PurchaseModel mdl = new PurchaseModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<PurchaseModel>(json);
                AddItem(mdl);
                break;

            case ("view"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                ViewItem(jsn.Id);
                break;

            case ("getbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetById(jsn.Id);
                break;

            case ("editSave"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<PurchaseModel>(json);
                EditSaveItem(mdl);
                break;

            case ("delete"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                DeleteItem(jsn.Id);
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

    private void AddItem(PurchaseModel mdl)
    {
        ResponseModel res = new ResponseModel();
        Purchase clsPurchase = new Purchase();
        mdl = clsPurchase.Add(mdl);
        res.Success = true;
        res.Message = "Successfully Added New Purchase";
        res.Model = mdl;
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewItem(int id)
    {
        ResponseModel res = new ResponseModel();
        Purchase clsPurchase = new Purchase();
        PurchaseViewModel mdlPurchase = clsPurchase.GetViewById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Item";
        res.Model = mdlPurchase;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        Purchase clsPurchase = new Purchase();
        PurchaseModel mdlPurchase = clsPurchase.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Item";
        res.Model = mdlPurchase;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveItem(PurchaseModel mdlPurchase)
    {
        ResponseModel res = new ResponseModel();
        Purchase clsPurchase = new Purchase();
        int affected = clsPurchase.Edit(mdlPurchase);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "Successfully Updated Item";
            res.Model = mdlPurchase;
        }
        else
        {
            res.Success = false;
            res.Message = "No Item were Updated.";
            res.Model = mdlPurchase;
        }

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void DeleteItem(int id)
    {
        ResponseModel res = new ResponseModel();
        Purchase clsPurchase = new Purchase();
        int affected = clsPurchase.Delete(id);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "Item Successfully Deleted";
        }
        else
        {
            res.Success = false;
            res.Message = "No Item were Deleted.";
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }
}
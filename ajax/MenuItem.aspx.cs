using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_MenuItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        MenuItemModel mdl = new MenuItemModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<MenuItemModel>(json);
                AddItem(mdl);
                break;

            case ("getbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetById(jsn.Id);
                break;

            case ("editSave"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<MenuItemModel>(json);
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

    private void AddItem(MenuItemModel mdl)
    {
        ResponseModel res = new ResponseModel();
        MenuItem cls = new MenuItem();
        if (cls.IsItemExist(mdl.Menu_Id,mdl.Item_Id))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            mdl = cls.Add(mdl);
            res.Success = true;
            res.Message = "Successfully Added New Item";
            res.Model = mdl;
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        MenuItem clsItem = new MenuItem();
        MenuItemModel mdlItem = clsItem.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Item";
        res.Model = mdlItem;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveItem(MenuItemModel mdlItem)
    {
        ResponseModel res = new ResponseModel();
        MenuItem clsItem = new MenuItem();
        if (clsItem.IsItemExist(mdlItem.Menu_Id, mdlItem.Item_Id))
        {
            res.Success = false;
            res.Message = "Item already exist";
        }
        else
        {
            int affected = clsItem.Edit(mdlItem);
            if (affected > 0)
            {
                res.Success = true;
                res.Message = "Successfully Updated Item";
                res.Model = mdlItem;
            }
            else
            {
                res.Success = false;
                res.Message = "No Item were Updated.";
                res.Model = mdlItem;
            }
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void DeleteItem(int id)
    {
        ResponseModel res = new ResponseModel();
        MenuItem clsItem = new MenuItem();
        int affected = clsItem.Delete(id);
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
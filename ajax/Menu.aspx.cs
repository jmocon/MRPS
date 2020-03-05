using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        MenuModel mdl = new MenuModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<MenuModel>(json);
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
                mdl = JsonConvert.DeserializeObject<MenuModel>(json);
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

    private void AddItem(MenuModel mdlMenu)
    {
        ResponseModel res = new ResponseModel();
        Menus clsMenu = new Menus();
        if (clsMenu.IsNameExist(mdlMenu.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            mdlMenu = clsMenu.Add(mdlMenu);
            res.Success = true;
            res.Message = "Successfully Added New Item";
            res.Model = mdlMenu;
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewItem(int id)
    {
        ResponseModel res = new ResponseModel();
        Menus clsMenu = new Menus();
        MenuModel mdlMenu = clsMenu.GetViewById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Menu";
        res.Model = mdlMenu;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        Menus clsMenu = new Menus();
        MenuModel mdlMenu = clsMenu.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Menu";
        res.Model = mdlMenu;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveItem(MenuModel mdlMenu)
    {
        ResponseModel res = new ResponseModel();
        Menus clsMenu = new Menus();
        if (clsMenu.IsNameExist(mdlMenu.Id, mdlMenu.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            int affected = clsMenu.Edit(mdlMenu);
            if (affected > 0)
            {
                res.Success = true;
                res.Message = "Successfully Updated Menu";
                res.Model = mdlMenu;
            }
            else
            {
                res.Success = false;
                res.Message = "No Item were Updated.";
                res.Model = mdlMenu;
            }
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void DeleteItem(int id)
    {
        ResponseModel res = new ResponseModel();
        Menus clsMenu = new Menus();
        int affected = clsMenu.Delete(id);
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
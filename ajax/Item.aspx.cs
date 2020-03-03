﻿using Newtonsoft.Json;
using System;
using System.Web;

public partial class ajax_Item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        ItemModel mdl = new ItemModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<ItemModel>(json);
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
                mdl = JsonConvert.DeserializeObject<ItemModel>(json);
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

    private void AddItem(ItemModel mdlItem)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        if (clsItem.IsNameExist(mdlItem.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            mdlItem = clsItem.Add(mdlItem);
            res.Success = true;
            res.Message = "Successfully Added New Item";
            res.Model = mdlItem;
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewItem(int id)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        ItemViewModel mdlItem = clsItem.GetViewById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Item";
        res.Model = mdlItem;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        ItemModel mdlItem = clsItem.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Item";
        res.Model = mdlItem;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveItem(ItemModel mdlItem)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        if (clsItem.IsNameExist(mdlItem.Id, mdlItem.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
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
        Item clsItem = new Item();
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
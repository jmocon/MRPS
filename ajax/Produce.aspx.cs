﻿using Newtonsoft.Json;
using System;
using System.Web;

public partial class ajax_Produce : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        ProduceModel mdl = new ProduceModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<ProduceModel>(json);
                AddProduce(mdl);
                break;

            case ("view"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                ViewProduce(jsn.Id);
                break;

            case ("getbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetById(jsn.Id);
                break;

            case ("editSave"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<ProduceModel>(json);
                EditSaveProduce(mdl);
                break;

            case ("delete"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                DeleteProduce(jsn.Id);
                break;

            case ("addCart"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<ProduceModel>(json);
                AddCart();
                break;

            case ("finish"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                Finish(jsn.Id);
                break;

            case ("checkcritical"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<ProduceModel>(json);
                CheckCritical(mdl);
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

    private void AddProduce(ProduceModel mdlProduce)
    {
        ResponseModel res = new ResponseModel();
        Produce clsProduce = new Produce();
        if (clsProduce.IsPossible(mdlProduce.Menu_Id, mdlProduce.Quantity))
        {
            mdlProduce = clsProduce.Add(mdlProduce);
            res.Success = true;
            res.Message = "Successfully Added New Produce";
            res.Model = mdlProduce;
        }
        else
        {
            res.Success = false;
            res.Message = "Insufficient Item/s";
        }

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void CheckCritical(ProduceModel mdlProduce)
    {
        ResponseModel res = new ResponseModel();
        Produce clsProduce = new Produce();
        string crit = clsProduce.CheckCritical(mdlProduce.Menu_Id, mdlProduce.Quantity);
        if (crit == "")
        {
            mdlProduce = clsProduce.Add(mdlProduce);
            res.Success = true;
            res.Message = "No Possible Critical Items";
        }
        else
        {
            res.Success = false;
            res.Message = crit;
        }

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewProduce(int id)
    {
        ResponseModel res = new ResponseModel();
        Produce clsProduce = new Produce();
        ProduceViewModel mdlProduce = clsProduce.GetViewById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Produce";
        res.Model = mdlProduce;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        Produce clsProduce = new Produce();
        ProduceModel mdlProduce = clsProduce.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Produce";
        res.Model = mdlProduce;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveProduce(ProduceModel mdlProduce)
    {
        ResponseModel res = new ResponseModel();
        Produce clsProduce = new Produce();
        int affected = clsProduce.Edit(mdlProduce);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "Successfully Updated Produce";
            res.Model = mdlProduce;
        }
        else
        {
            res.Success = false;
            res.Message = "No Produce were Updated.";
            res.Model = mdlProduce;
        }

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void DeleteProduce(int id)
    {
        ResponseModel res = new ResponseModel();
        Produce clsProduce = new Produce();
        int affected = clsProduce.Delete(id);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "Produce Successfully Deleted";
        }
        else
        {
            res.Success = false;
            res.Message = "No Produce were Deleted.";
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void AddCart()
    {
        ResponseModel res = new ResponseModel();
        ProductionCart cls = new ProductionCart();
        int id = cls.Add();
        if (id > 0)
        {
            res.Success = true;
            res.Message = id.ToString();
        }
        else
        {
            res.Success = false;
            res.Message = "No Produce Cart were Created.";
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void Finish(int id)
    {
        ResponseModel res = new ResponseModel();
        Produce cls = new Produce();
        cls.Finish(id);
        res.Success = true;
        res.Message = id.ToString();
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }
}
using Newtonsoft.Json;
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
        ItemCriticalModel mdlC = new ItemCriticalModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdlC = JsonConvert.DeserializeObject<ItemCriticalModel>(json);
                AddItem(mdlC);
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

            case ("getunit_idbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetUnit_IdById(jsn.Id);
                break;

            case ("editSave"):
                json = clsUtil.GetJson(Request.InputStream);
                mdlC = JsonConvert.DeserializeObject<ItemCriticalModel>(json);
                EditSaveItem(mdlC);
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

    private void AddItem(ItemCriticalModel mdlItemC)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        CriticalLevel clsCritical = new CriticalLevel();
        ItemModel mdlItem = new ItemModel
        {
            Name = mdlItemC.Name,
            Price = mdlItemC.Price,
            Category_Id = mdlItemC.Category_Id,
            Unit_Id = mdlItemC.Unit_Id
        };
        CriticalLevelModel mdlCritical = new CriticalLevelModel
        {
            Quantity = mdlItemC.Critical_Quantity,
            Unit_Id = mdlItemC.Critical_Unit_Id
        };
        if (clsItem.IsNameExist(mdlItem.Name))
        {
            res.Success = false;
            res.Message = "Name already exist";
        }
        else
        {
            mdlItem = clsItem.Add(mdlItem);
            mdlCritical.Item_Id = mdlItem.Id;
            clsCritical.Delete(mdlCritical.Item_Id);
            mdlCritical = clsCritical.Add(mdlCritical);
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
        CriticalLevel clsCL = new CriticalLevel();
        ItemModel mdlItem = clsItem.GetById(id);
        CriticalLevelModel mdlCL = clsCL.GetByItem_Id(id);
        ItemCriticalModel mdl = new ItemCriticalModel
        {
            Id = mdlItem.Id,
            Name = mdlItem.Name,
            Price = mdlItem.Price,
            Category_Id = mdlItem.Category_Id,
            Unit_Id = mdlItem.Unit_Id,
            X_DateCreated = mdlItem.X_DateCreated,
            X_Archived = mdlItem.X_Archived,
            X_Deleted = mdlItem.X_Deleted,
            Critical_Quantity = mdlCL.Quantity,
            Critical_Unit_Id = mdlCL.Unit_Id
        };
        res.Success = true;
        res.Message = "Successfully Retrieved Item";
        res.Model = mdl;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetUnit_IdById(int id)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        res.Success = true;
        res.Message = clsItem.GetUnit_IdById(id).ToString();

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveItem(ItemCriticalModel mdlIC)
    {
        ResponseModel res = new ResponseModel();
        Item clsItem = new Item();
        ItemModel mdlItem = new ItemModel
        {
            Id = mdlIC.Id,
            Name = mdlIC.Name,
            Price = mdlIC.Price,
            Category_Id = mdlIC.Category_Id,
            Unit_Id = mdlIC.Unit_Id,
            X_DateCreated = mdlIC.X_DateCreated,
            X_Archived = mdlIC.X_Archived,
            X_Deleted = mdlIC.X_Deleted,
        };
        CriticalLevelModel mdlCL = new CriticalLevelModel
        {
            Item_Id = mdlIC.Id,
            Quantity = mdlIC.Critical_Quantity,
            Unit_Id = mdlIC.Critical_Unit_Id
        };
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
                CriticalLevel clsCL = new CriticalLevel();
                clsCL.Delete(mdlCL.Item_Id);
                mdlCL = clsCL.Add(mdlCL);
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
                CriticalLevel clsCL = new CriticalLevel();
                clsCL.Delete(id);
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
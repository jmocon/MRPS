using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        UserModel mdl = new UserModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<UserModel>(json);
                AddUser(mdl);
                break;

            case ("view"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                ViewUser(jsn.Id);
                break;

            case ("getbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetById(jsn.Id);
                break;

            case ("editSave"):
                json = clsUtil.GetJson(Request.InputStream);
                mdl = JsonConvert.DeserializeObject<UserModel>(json);
                EditSaveUser(mdl);
                break;

            case ("delete"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                DeleteUser(jsn.Id);
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

    private void AddUser(UserModel mdlUser)
    {
        ResponseModel res = new ResponseModel();
        User clsUser = new User();
        if (clsUser.IsUsernameExist(mdlUser.Username))
        {
            res.Success = false;
            res.Message = "Username already exist";
        }
        else
        {
            mdlUser = clsUser.Add(mdlUser);
            res.Success = true;
            res.Message = "Successfully Added New User";
            res.Model = mdlUser;
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewUser(int id)
    {
        ResponseModel res = new ResponseModel();
        User clsUser = new User();
        UserModel mdlUser = clsUser.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved User";
        res.Model = mdlUser;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        User clsUser = new User();
        UserModel mdlUser = clsUser.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved User";
        res.Model = mdlUser;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void EditSaveUser(UserModel mdlUser)
    {
        ResponseModel res = new ResponseModel();
        User clsUser = new User();
        if (clsUser.IsUsernameExist(mdlUser.Id, mdlUser.Username))
        {
            res.Success = false;
            res.Message = "Username already exist";
        }
        else
        {
            int affected = clsUser.Edit(mdlUser);
            if (affected > 0)
            {
                res.Success = true;
                res.Message = "Successfully Updated User";
                res.Model = mdlUser;
            }
            else
            {
                res.Success = false;
                res.Message = "No User were Updated.";
                res.Model = mdlUser;
            }
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void DeleteUser(int id)
    {
        ResponseModel res = new ResponseModel();
        User clsUser = new User();
        int affected = clsUser.Delete(id);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "User Successfully Deleted";
        }
        else
        {
            res.Success = false;
            res.Message = "No User were Deleted.";
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }
}
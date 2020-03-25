using Newtonsoft.Json;
using System;
using System.Web;


public partial class ajax_Forecasts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
        HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "*");
        Utility clsUtil = new Utility();
        string json = "";
        JsonId jsn = new JsonId();
        ForecastModel mdl = new ForecastModel();
        ForecastItemModel mdlFI = new ForecastItemModel();

        switch (Request.QueryString["f"])
        {
            case ("add"):
                json = clsUtil.GetJson(Request.InputStream);
                AddForecast(JsonConvert.DeserializeObject<ForecastItemModel>(json));
                break;

            case ("view"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                ViewForecast(jsn.Id);
                break;

            case ("getbyid"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                GetById(jsn.Id);
                break;

            case ("delete"):
                json = clsUtil.GetJson(Request.InputStream);
                jsn = JsonConvert.DeserializeObject<JsonId>(json);
                DeleteForecast(jsn.Id);
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

    private void AddForecast(ForecastItemModel mdlF)
    {
        ResponseModel res = new ResponseModel();
        Forecast clsForecast = new Forecast();
        ForecastModel mdlForecast = clsForecast.Add(mdlF);
        res.Success = true;
        res.Message = "Successfully Added New Forecast";
        res.Model = mdlForecast;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void ViewForecast(int id)
    {
        ResponseModel res = new ResponseModel();
        Forecast clsForecast = new Forecast();
        ForecastViewModel mdlForecast = clsForecast.GetViewById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Forecast";
        res.Model = mdlForecast;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }

    private void GetById(int id)
    {
        ResponseModel res = new ResponseModel();
        Forecast clsForecast = new Forecast();
        ForecastModel mdlForecast = clsForecast.GetById(id);
        res.Success = true;
        res.Message = "Successfully Retrieved Forecast";
        res.Model = mdlForecast;

        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }


    private void DeleteForecast(int id)
    {
        ResponseModel res = new ResponseModel();
        Forecast clsForecast = new Forecast();
        int affected = clsForecast.Delete(id);
        if (affected > 0)
        {
            res.Success = true;
            res.Message = "Forecast Successfully Deleted";
        }
        else
        {
            res.Success = false;
            res.Message = "No Forecast were Deleted.";
        }
        string output = JsonConvert.SerializeObject(res);
        Response.Write(output);
    }
}
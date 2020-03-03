public class ResponseModel
{
    public ResponseModel()
    {
    }

    public bool Success { get; set; }
    public string Title { get; set; }
    public string Message { get; set; }
    public object Model { get; set; }
    public object List { get; set; }
}
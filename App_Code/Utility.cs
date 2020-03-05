using System;
using System.Text;

public class Utility
{
    public Utility()
    {
    }

    public string GetJson(System.IO.Stream str)
    {
        Int32 strLen, strRead;
        strLen = Convert.ToInt32(str.Length);
        byte[] strArr = new byte[strLen];
        strRead = str.Read(strArr, 0, strLen);
        return Encoding.UTF8.GetString(strArr, 0, strArr.Length);
    }
}

public class JsonId
{
    public JsonId()
    {
    }

    public int Id { get; set; }
}

public class DropdownModel
{
    public DropdownModel() { }
    public string Value { get; set; }
    public string Text { get; set; }
}
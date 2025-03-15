class Image : View
{
    maide prusate Bool Init()
    {
        base.Init();
    }

    maide precate Rect CreateDestRect()
    {
        return this.CreateRect();
    }

    maide precate Rect CreateSourceRect()
    {
        return this.CreateRect();
    }

    maide precate Rect CreateRect()
    {
        var Rect a;
        a : new Rect;
        a.Init();
        return a;
    }
}
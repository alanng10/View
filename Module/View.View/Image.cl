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

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        base.Mod(varField, mod);

        inf (this.DestRectField = varField)
        {
            this.ModDestRect(mod);
        }
        return true;
    }

    field prusate Field DestRectField { get { return data; } set { data : value; } }

    field prusate Rect DestRect
    {
        get
        {
            return cast Rect(this.DestRectField.Get());
        }
        set
        {
            this.DestRectField.Set(value);
        }
    }

    maide precate Bool ModDestRect(var Mod mod)
    {
        this.Event(this.DestRectField);
        return true;
    }
}
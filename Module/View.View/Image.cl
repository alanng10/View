class Image : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DestRectField : this.CreateDestRectField();
        this.SourceRectField : this.CreateSourceRectField();

        this.DestRect : this.CreateDestRect();
        this.SourceRect : this.CreateSourceRect();
        return true;
    }

    maide precate Field CreateDestRectField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateSourceRectField()
    {
        return this.ViewInfra.FieldCreate(this);
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
        inf (this.SourceRectField = varField)
        {
            this.ModSourceRect(mod);
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

    field prusate Field SourceRectField { get { return data; } set { data : value; } }

    field prusate Rect SourceRect
    {
        get
        {
            return cast Rect(this.SourceRectField.Get());
        }
        set
        {
            this.SourceRectField.Set(value);
        }
    }

    maide precate Bool ModSourceRect(var Mod mod)
    {
        this.Event(this.SourceRectField);
        return true;
    }
}
class GridChild : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;
        this.ViewField : this.CreateViewField();
        this.RectField : this.CreaetRectField();

        this.Rect : this.CreateRect();
        return true;
    }

    field precate Infra ViewInfra { get { return data; } set { data : value; } }

    maide precate Field CreateViewField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreaetRectField()
    {
        return this.ViewInfra.FieldCreate(this);
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
        inf (this.ViewField = varField)
        {
            this.ModView(mod);
        }
        inf (this.RectField = varField)
        {
            this.ModRect(mod);
        }
        return true;
    }

    field prusate Field ViewField { get { return data; } set { data : value; } }

    field prusate View View
    {
        get
        {
            return cast View(this.ViewField.Get());
        }
        set
        {
            this.ViewField.Set(value);
        }
    }

    maide precate Bool ModView(var Mod mod)
    {
        this.Event(this.ViewField);
        return true;
    }

    field prusate Field RectField { get { return data; } set { data : value; } }

    field prusate Rect Rect
    {
        get
        {
            return cast Rect(this.RectField.Get());
        }
        set
        {
            this.RectField.Set(value);
        }
    }

    maide precate Bool ModRect(var Mod mod)
    {
        this.Event(this.RectField);
        return true;
    }
}
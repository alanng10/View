class Text : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawAlignList : share DrawAlignList;
        this.ValueField : this.CreateValueField();
        this.DestField : this.CreateDestField();
        this.ForeField : this.CreateForeField();
        this.FontField : this.CreateFontField();
        this.ColAlignField : this.CreateColAlignField();
        this.RowAlignField : this.CreateRowAlignField();
        this.WordWrapField : this.CreateWordWrapField();

        this.Dest : this.CreateDest();
        this.Back : this.DrawInfra.SlashZero.Brush;
        this.Fore : this.Palete.Fore;
        this.Font : this.Palete.FontAria;
        this.ColAlign : this.DrawAlignList.Start;
        this.RowAlign : this.DrawAlignList.Start;
        this.WordWrap : true;
        return true;
    }

    maide precate Field CreateValueField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateDestField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateForeField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateFontField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateColAlignField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateRowAlignField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateWordWrapField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Rect CreateDest()
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

    field precate DrawAlignList DrawAlignList { get { return data; } set { data : value; } }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        base.Mod(varField, mod);

        inf (this.ValueField = varField)
        {
            this.ModValue(mod);
        }
        inf (this.DestField = varField)
        {
            this.ModDest(mod);
        }
        inf (this.ForeField = varField)
        {
            this.ModFore(mod);
        }
        inf (this.FontField = varField)
        {
            this.ModFont(mod);
        }
        inf (this.ColAlignField = varField)
        {
            this.ModColAlign(mod);
        }
        inf (this.RowAlignField = varField)
        {
            this.ModRowAlign(mod);
        }
        inf (this.WordWrapField = varField)
        {
            this.ModWordWrap(mod);
        }
        return true;
    }

    field prusate Field ValueField { get { return data; } set { data : value; } }

    field prusate Text Value
    {
        get
        {
            return cast Text(this.ValueField.GetAny());
        }
        set
        {
            this.ValueField.SetAny(value);
        }
    }

    maide precate Bool ModValue(var Mod mod)
    {
        this.Event(this.ValueField);
        return true;
    }

    field prusate Field DestField { get { return data; } set { data : value; } }

    field prusate Rect Dest
    {
        get
        {
            return cast Rect(this.DestField.Get());
        }
        set
        {
            this.DestField.Set(value);
        }
    }

    maide precate Bool ModDest(var Mod mod)
    {
        this.Event(this.DestField);
        return true;
    }

    field prusate Field ForeField { get { return data; } set { data : value; } }

    field prusate DrawSlash Fore
    {
        get
        {
            return cast DrawSlash(this.ForeField.GetAny());
        }
        set
        {
            this.ForeField.SetAny(value);
        }
    }

    maide precate Bool ModFore(var Mod mod)
    {
        this.Event(this.ForeField);
        return true;
    }

    field prusate Field FontField { get { return data; } set { data : value; } }

    field prusate DrawFont Font
    {
        get
        {
            return cast DrawFont(this.FontField.GetAny());
        }
        set
        {
            this.FontField.SetAny(value);
        }
    }

    maide precate Bool ModFont(var Mod mod)
    {
        this.Event(this.FontField);
        return true;
    }

    field prusate Field ColAlignField { get { return data; } set { data : value; } }

    field prusate DrawAlign ColAlign
    {
        get
        {
            return cast DrawAlign(this.ColAlignField.GetAny());
        }
        set
        {
            this.ColAlignField.SetAny(value);
        }
    }

    maide precate Bool ModColAlign(var Mod mod)
    {
        this.Event(this.ColAlignField);
        return true;
    }
}
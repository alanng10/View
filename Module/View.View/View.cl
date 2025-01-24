class View : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        this.ViewInfra : share Infra;

        this.PosField : this.CreatePosField();
        this.SizeField : this.CreateSizeField();
        this.BackField : this.CreateBackField();
        this.VisibleField : this.CreateVisibleField();
        this.ChildField : this.CreateChildField();

        this.Pos : this.CreatePos();
        this.Size : this.CreateSize();
        this.Back : this.CreateBack();
        this.Visible : true;

        this.Area : this.CreateArea();

        this.DrawRectA : this.CreateDrawRect();
        this.DrawRectB : this.CreateDrawRect();
        this.DrawRectC : this.CreateDrawRect();
        this.DrawRectD : this.CreateDrawRect();

        this.DrawPosA : this.CreateDrawPos();

        this.StackRect : this.CreateStackRect();
        this.StackPos : this.CreateStackPos();
        return true;
    }

    maide precate Field CreatePosField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateSizeField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateBackField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateVisibleField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateChildField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Pos CreatePos()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate Size CreateSize()
    {
        var Size a;
        a : new Size;
        a.Init();
        return a;
    }

    maide precate DrawBrush CreateBack()
    {
        var DrawBrush a;
        a : this.DrawInfra.WhiteSlash.Brush;
        return a;
    }

    maide precate DrawRect CreateArea()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    maide precate DrawRect CreateDrawRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    maide precate DrawRect CreateDrawPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    maide precate DrawRect CreateStackRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    maide precate DrawRect CreateStackPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    field prusate DrawRect Area { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate Infra ViewInfra { get { return data; } set { data : value; } }
    field precate DrawRect DrawRectA { get { return data; } set { data : value; } }
    field precate DrawRect DrawRectB { get { return data; } set { data : value; } }
    field precate DrawRect DrawRectC { get { return data; } set { data : value; } }
    field precate DrawRect DrawRectD { get { return data; } set { data : value; } }
    field precate DrawPos DrawPosA { get { return data; } set { data : value; } }
    field precate DrawRect StackRect { get { return data; } set { data : value; } }
    field precate DrawPos StackPos { get { return data; } set { data : value; } }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        inf (this.PosField = varField)
        {
            this.ModPos(mod);
        }
        inf (this.SizeField = varField)
        {
            this.ModSize(mod);
        }
        inf (this.BackField = varField)
        {
            this.ModBack(mod);
        }
        inf (this.ShownField = varField)
        {
            this.ModShown(mod);
        }
        inf (this.ChildField = varField)
        {
            this.ModChild(mod);
        }
        return true;
    }

    field prusate Field PosField { get { return data; } set { data : value; } }

    field prusate Pos Pos
    {
        get
        {
            return cast Pos(this.PosField.Get());
        }
        set
        {
            this.PosField.Set(value);
        }
    }

    maide precate Bool ModPos(var Mod mod)
    {
        this.Event(this.PosField);
        return true;
    }

    field prusate Field SizeField { get { return data; } set { data : value; } }

    field prusate Size Size
    {
        get
        {
            return cast Size(this.SizeField.Get());
        }
        set
        {
            this.SizeField.Set(value);
        }
    }

    maide precate Bool ModSize(var Mod mod)
    {
        this.Event(this.SizeField);
        return true;
    }
}
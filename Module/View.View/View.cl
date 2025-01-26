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

    maide precate DrawPos CreateDrawPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    maide precate DrawRect CreateStackRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    maide precate DrawPos CreateStackPos()
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

    field prusate Field BackField { get { return data; } set { data : value; } }

    field prusate DrawBrush Back
    {
        get
        {
            return cast DrawBrush(this.BackField.GetAny());
        }
        set
        {
            this.BackField.SetAny(value);
        }
    }

    maide precate Bool ModBack(var Mod mod)
    {
        this.Event(this.BackField);
        return true;
    }

    field prusate Field ShownField { get { return data; } set { data : value; } }

    field prusate Bool Shown
    {
        get
        {
            return cast Bool(this.ShownField.GetAny());
        }
        set
        {
            this.ShownField.SetAny(value);
        }
    }

    maide precate Bool ModShown(var Mod mod)
    {
        this.Event(this.ShownField);
        return true;
    }

    field prusate Field ChildField { get { return data; } set { data : value; } }

    field prusate View Child
    {
        get
        {
            return cast View(this.ChildField.Get());
        }
        set
        {
            this.ChildField.Set(value);
        }
    }

    maide precate Bool ModChild(var Mod mod)
    {
        this.Event(this.ChildField);
        return true;
    }

    maide precate Bool ValidDraw()
    {
        return this.Shown;
    }

    maide prusate Bool ExecuteDraw(var Draw draw)
    {
        this.ViewInfra.AssignDrawRectValue(this.Area, draw.Area);

        inf (~this.ValidDraw())
        {
            return true;
        }

        this.ExecuteDrawThis(draw);

        inf (~this.ValidDrawChild())
        {
            return true;
        }

        this.ExecuteDrawChild(draw);
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        this.ViewInfra.AssignDrawPosValue(this.DrawRectA.Pos, this.Pos);
        this.ViewInfra.AssignDrawSizeValue(this.DrawRectA.Size, this.Size);

        draw.Fill : this.Back;

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        draw.ExecuteRect(this.DrawRectA);

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;
        return true;
    }

    maide precate Bool ValidDrawChild()
    {
        return ~(this.Child = null);
    }

    maide precate Bool ExecuteDrawChild(var Draw draw)
    {
        this.SetChildArea(this.DrawRectA, draw);

        this.ViewInfra.StackPushChild(draw, this.StackRect, this.StackPos, this.DrawRectA, this.DrawPosA);

        this.ExecuteChildDraw(draw);

        this.ViewInfra.StackPopChild(draw, this.StackRect, this.StackPos);
        return true;
    }

    maide precate Bool SetChildArea(var DrawRect dest, var Draw draw)
    {
        var Int col;
        var Int row;
        col : this.Pos.Col + draw.Pos.Col;
        row : this.Pos.Row + draw.Pos.Row;

        dest.Pos.Col : col;
        dest.Pos.Row : row;

        this.ViewInfra.AssignDrawSizeValue(dest.Size, this.Size);
        return true;
    }

    maide precate Bool ExecuteChildDraw(var Draw draw)
    {
        this.Child.ExecuteDraw(draw);
        return true;
    }
}
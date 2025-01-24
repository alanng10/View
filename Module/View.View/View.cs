namespace View.View;

public class View : Comp
{
    public override bool Init()
    {
        base.Init();
        this.DrawInfra = DrawInfra.This;
        this.ViewInfra = Infra.This;

        this.PosField = this.CreatePosField();
        this.SizeField = this.CreateSizeField();
        this.BackField = this.CreateBackField();
        this.ShownField = this.CreateShownField();
        this.ChildField = this.CreateChildField();

        this.Pos = this.CreatePos();
        this.Size = this.CreateSize();
        this.Back = this.CreateBack();
        this.Shown = true;

        this.Area = this.CreateArea();

        this.DrawRectA = this.CreateDrawRect();
        this.DrawRectB = this.CreateDrawRect();
        this.DrawRectC = this.CreateDrawRect();
        this.DrawRectD = this.CreateDrawRect();

        this.DrawPosA = this.CreateDrawPos();

        this.StackRect = this.CreateStackRect();
        this.StackPos = this.CreateStackPos();
        return true;
    }

    protected virtual Field CreatePosField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateSizeField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateBackField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateShownField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateChildField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Pos CreatePos()
    {
        Pos a;
        a = new Pos();
        a.Init();
        return a;
    }

    protected virtual Size CreateSize()
    {
        Size a;
        a = new Size();
        a.Init();
        return a;
    }

    protected virtual DrawBrush CreateBack()
    {
        DrawBrush a;
        a = this.DrawInfra.WhiteSlash.Brush;
        return a;
    }

    protected virtual DrawRect CreateArea()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    protected virtual DrawRect CreateDrawRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    protected virtual DrawPos CreateDrawPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    protected virtual DrawRect CreateStackRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    protected virtual DrawPos CreateStackPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    public virtual DrawRect Area { get; set; }
    protected virtual DrawInfra DrawInfra { get; set; }
    protected virtual Infra ViewInfra { get; set; }
    protected virtual DrawRect DrawRectA { get; set; }
    protected virtual DrawRect DrawRectB { get; set; }
    protected virtual DrawRect DrawRectC { get; set; }
    protected virtual DrawRect DrawRectD { get; set; }
    protected virtual DrawPos DrawPosA { get; set; }
    protected virtual DrawRect StackRect { get; set; }
    protected virtual DrawPos StackPos { get; set; }

    public override bool Mod(Field field, Mod mod)
    {
        if (this.SizeField == field)
        {
            this.ModSize(mod);
        }
        if (this.PosField == field)
        {
            this.ModPos(mod);
        }
        if (this.BackField == field)
        {
            this.ModBack(mod);
        }
        if (this.ShownField == field)
        {
            this.ModShown(mod);
        }
        if (this.ChildField == field)
        {
            this.ModChild(mod);
        }
        return true;
    }

    public virtual Field PosField { get; set; }

    public virtual Pos Pos
    {
        get
        {
            return this.PosField.Get() as Pos;
        }
        set
        {
            this.PosField.Set(value);
        }
    }

    protected virtual bool ModPos(Mod mod)
    {
        this.Event(this.PosField);
        return true;
    }

    public virtual Field SizeField { get; set; }

    public virtual Size Size
    {
        get
        {
            return this.SizeField.Get() as Size;
        }
        set
        {
            this.SizeField.Set(value);
        }
    }

    protected virtual bool ModSize(Mod mod)
    {
        this.Event(this.SizeField);
        return true;
    }

    public virtual Field BackField { get; set; }

    public virtual DrawBrush Back
    {
        get
        {
            return this.BackField.GetAny() as DrawBrush;
        }
        set
        {
            this.BackField.SetAny(value);
        }
    }

    protected virtual bool ModBack(Mod mod)
    {
        this.Event(this.BackField);
        return true;
    }

    public virtual Field ShownField { get; set; }

    public virtual bool Shown
    {
        get
        {
            return this.ShownField.GetBool();
        }
        set
        {
            this.ShownField.SetBool(value);
        }
    }

    protected virtual bool ModShown(Mod mod)
    {
        this.Event(this.ShownField);
        return true;
    }

    public virtual Field ChildField { get; set; }

    public virtual View Child
    {
        get
        {
            return this.ChildField.Get() as View;
        }
        set
        {
            this.ChildField.Set(value);
        }
    }

    protected virtual bool ModChild(Mod mod)
    {
        this.Event(this.ChildField);
        return true;
    }

    protected virtual bool ValidDraw()
    {
        return this.Shown;
    }

    public virtual bool ExecuteDraw(DrawDraw draw)
    {
        this.ViewInfra.AssignDrawRectValue(this.Area, draw.Area);

        if (!this.ValidDraw())
        {
            return true;
        }

        this.ExecuteDrawThis(draw);

        if (!this.ValidDrawChild())
        {
            return true;
        }

        this.ExecuteDrawChild(draw);
        return true;
    }

    protected virtual bool ExecuteDrawThis(DrawDraw draw)
    {
        long col;
        long row;
        col = this.Pos.Col;
        row = this.Pos.Row;
        long wed;
        long het;
        wed = this.Size.Wed;
        het = this.Size.Het;

        this.DrawRectA.Pos.Col = col;
        this.DrawRectA.Pos.Row = row;
        this.DrawRectA.Size.Wed = wed;
        this.DrawRectA.Size.Het = het;

        DrawRect rect;
        rect = this.DrawRectA;
        DrawBrush brush;
        brush = this.Back;
        draw.Fill = brush;

        draw.FillPos.Col = this.MathInt(col);
        draw.FillPos.Row = this.MathInt(row);
        draw.FillPosSet();

        draw.ExecuteRect(rect);

        draw.FillPos.Col = 0;
        draw.FillPos.Row = 0;
        draw.FillPosSet();

        draw.Fill = null;
        return true;
    }

    protected virtual bool ValidDrawChild()
    {
        return !(this.Child == null);
    }

    protected virtual bool ExecuteDrawChild(DrawDraw draw)
    {
        long col;
        long row;
        col = this.Pos.Col;
        col = col + draw.Pos.Col;
        row = this.Pos.Row;
        row = row + draw.Pos.Row;

        long wed;
        long het;
        wed = this.Size.Wed;
        het = this.Size.Het;

        this.DrawRectA.Pos.Col = col;
        this.DrawRectA.Pos.Row = row;
        this.DrawRectA.Size.Wed = wed;
        this.DrawRectA.Size.Het = het;

        this.SetChildArea(this.DrawRectA);

        this.ViewInfra.StackPushChild(draw, this.StackRect, this.StackPos, this.DrawRectA, this.DrawPosA);

        this.ExecuteChildDraw(draw);

        this.ViewInfra.StackPopChild(draw, this.StackRect, this.StackPos);
        return true;
    }

    protected virtual bool SetChildArea(DrawRect thisRect)
    {
        return true;
    }

    protected virtual bool ExecuteChildDraw(DrawDraw draw)
    {
        this.Child.ExecuteDraw(draw);
        return true;
    }
}
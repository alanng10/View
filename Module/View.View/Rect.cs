namespace View.View;

public class Rect : Comp
{
    public override bool Init()
    {
        base.Init();
        this.PosField = this.CreatePosField();
        this.SizeField = this.CreateSizeField();

        this.Pos = this.CreatePos();
        this.Size = this.CreateSize();
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

    protected virtual Pos CreatePos()
    {
        Pos a;
        a = new Pos();
        a.Init();
        a.Col = 0;
        a.Row = 0;
        return a;
    }

    protected virtual Size CreateSize()
    {
        Size a;
        a = new Size();
        a.Init();
        a.Wed = 0;
        a.Het = 0;
        return a;
    }

    public override bool Mod(Field field, Mod mod)
    {
        if (this.PosField == field)
        {
            this.ModPos(mod);
        }
        if (this.SizeField == field)
        {
            this.ModSize(mod);
        }
        return true;
    }

    public virtual Field PosField { get; set; }

    public virtual Pos Pos
    {
        get
        {
            return (Pos)this.PosField.Get();
        }

        set
        {
            this.PosField.Set(value);
        }
    }

    protected virtual bool ModPos(Mod change)
    {
        this.Event(this.PosField);
        return true;
    }

    public virtual Field SizeField { get; set; }

    public virtual Size Size
    {
        get
        {
            return (Size)this.SizeField.Get();
        }

        set
        {
            this.SizeField.Set(value);
        }
    }

    protected virtual bool ModSize(Mod change)
    {
        this.Event(this.SizeField);
        return true;
    }
}
namespace View.View;

public class GridChild : Comp
{
    public override bool Init()
    {
        base.Init();
        this.ViewInfra = Infra.This;
        this.ViewField = this.CreateViewField();
        this.RectField = this.CreateRectField();

        this.Rect = this.CreateRect();
        return true;
    }

    protected virtual Infra ViewInfra { get; set; }

    protected virtual Field CreateViewField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateRectField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Rect CreateRect()
    {
        Rect a;
        a = new Rect();
        a.Init();
        return a;
    }

    public override bool Mod(Field field, Mod mod)
    {
        if (this.ViewField == field)
        {
            this.ModView(mod);
        }
        if (this.RectField == field)
        {
            this.ModRect(mod);
        }
        return true;
    }

    public virtual Field ViewField { get; set; }

    public virtual View View
    {
        get
        {
            return this.ViewField.Get() as View;
        }
        set
        {
            this.ViewField.Set(value);
        }
    }

    protected virtual bool ModView(Mod mod)
    {
        this.Event(this.ViewField);
        return true;
    }

    public virtual Field RectField { get; set; }

    public virtual Rect Rect
    {
        get
        {
            return this.RectField.Get() as Rect;
        }
        set
        {
            this.RectField.Set(value);
        }
    }

    protected virtual bool ModRect(Mod mod)
    {
        this.Event(this.RectField);
        return true;
    }
}
namespace View.View;

public class Pos : Comp
{
    public override bool Init()
    {
        base.Init();
        this.ViewInfra = Infra.This;
        this.ColField = this.CreateColField();
        this.RowField = this.CreateRowField();
        return true;
    }

    protected virtual Infra ViewInfra { get; set; }

    protected virtual Field CreateColField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateRowField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    public override bool Mod(Field varField, Mod mod)
    {
        if (this.ColField == varField)
        {
            this.ModCol(mod);
        }
        if (this.RowField == varField)
        {
            this.ModRow(mod);
        }
        return true;
    }

    public virtual Field ColField { get; set; }

    public virtual long Col
    {
        get
        {
            return this.ColField.GetInt();
        }

        set
        {
            this.ColField.SetInt(value);
        }
    }

    protected virtual bool ModCol(Mod mod)
    {
        this.Event(this.ColField);
        return true;
    }

    public virtual Field RowField { get; set; }

    public virtual long Row
    {
        get
        {
            return this.RowField.GetInt();
        }

        set
        {
            this.RowField.SetInt(value);
        }
    }

    protected virtual bool ModRow(Mod mod)
    {
        this.Event(this.RowField);
        return true;
    }
}
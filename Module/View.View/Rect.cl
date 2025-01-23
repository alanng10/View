class Rect : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;
        this.PosField : this.CreatePosField();
        this.SizeField : this.CreaetSizeField();

        this.Pos : this.CreatePos();
        this.Size : this.CreateSize();
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

    field precate Infra ViewInfra { get { return data; } set { data : value; } }

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
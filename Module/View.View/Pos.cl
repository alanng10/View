class Pos : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;
        this.ColField : this.CreateColField();
        this.RowField : this.CreaetRowField();

        this.Col : 0;
        this.Row : 0;
        return true;
    }

    field precate Infra ViewInfra { get { return data; } set { data : value; } }

    maide precate Field CreateColField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateRowField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        inf (this.ColField = varField)
        {
            this.ModCol(mod);
        }
        inf (this.RowField = varField)
        {
            this.ModRow(mod);
        }
        return true;
    }

    field prusate Field ColField { get { return data; } set { data : value; } }

    field prusate Int Col
    {
        get
        {
            return cast Int(this.ColField.GetAny());
        }
        set
        {
            this.ColField.SetAny(value);
        }
    }

    maide precate Bool ModCol(var Mod mod)
    {
        this.Event(this.ColField);
        return true;
    }

    field prusate Field RowField { get { return data; } set { data : value; } }

    field prusate Int Row
    {
        get
        {
            return cast Int(this.RowField.GetAny());
        }
        set
        {
            this.RowField.SetAny(value);
        }
    }

    maide precate Bool ModRow(var Mod mod)
    {
        this.Event(this.RowField);
        return true;
    }
}
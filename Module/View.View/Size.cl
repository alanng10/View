class Size : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;
        this.WedField : this.CreateWedField();
        this.HetField : this.CreateHetField();

        this.Wed : 0;
        this.Het : 0;
        return true;
    }

    maide precate Field CreateWedField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateHetField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    field precate Infra ViewInfra { get { return data; } set { data : value; } }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        inf (this.WedField = varField)
        {
            this.ModWed(mod);
        }
        inf (this.HetField = varField)
        {
            this.ModHet(mod);
        }
        return true;
    }

    field prusate Field WedField { get { return data; } set { data : value; } }

    field prusate Int Wed
    {
        get
        {
            return cast Int(this.WedField.GetAny());
        }
        set
        {
            this.WedField.SetAny(value);
        }
    }

    maide precate Bool ModWed(var Mod mod)
    {
        this.Event(this.WedField);
        return true;
    }

    field prusate Field HetField { get { return data; } set { data : value; } }

    field prusate Int Het
    {
        get
        {
            return cast Int(this.HetField.GetAny());
        }
        set
        {
            this.HetField.SetAny(value);
        }
    }

    maide precate Bool ModHet(var Mod mod)
    {
        this.Event(this.HetField);
        return true;
    }
}
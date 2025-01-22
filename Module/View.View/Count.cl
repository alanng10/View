class Count : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;
        this.ValueField : this.CreateValueField();
        this.Value : 0;
        return true;
    }

    field precate Infra ViewInfra { get { return data; } set { data : value; } }

    maide precate Field CreateValueField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        inf (this.ValueField = varField)
        {
            this.ModValue(mod);
        }
        return true;
    }

    field prusate Field ValueField { get { return data; } set { data : value; } }

    field prusate Int Value
    {
        get
        {
            return cast Int(this.ValueField.GetAny());
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
}
class Field : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.State : new FieldState;
        this.State.Init();
        this.State.Field : this;
        this.SetModArg : new Mod;
        this.SetModArg.Init();
        return true;
    }

    field prusate Comp Comp { get { return data; } set { data : value; } }
    field prusate FieldState State { get { return data; } set { data : value; } }
    field prusate Mod SetModArg { get { return data; } set { data : value; } }
    field precate Comp Value { get { return data; } set { data : value; } }
    field precate Any ValueAny { get { return data; } set { data : value; } }

    maide prusate Comp Get()
    {
        return this.Value;
    }
}
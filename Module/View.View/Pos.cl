class Pos : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;
        this.ColField : this.CreateColField();
        this.RowField : this.CreaetRowField();
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
    }
}
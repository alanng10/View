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
}
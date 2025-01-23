class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        return true;
    }

    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
}
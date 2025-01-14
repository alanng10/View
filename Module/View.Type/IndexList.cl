class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.Array : this.ListInfra.ArrayCreate(this.Count);
    }
}
class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();

        this.Count : this.ListCount;

        var Int count;
        count : this.Count * (4 + 4 * 8);

        this.Data : new Data;
        this.Data.Count : count;
        this.Data.Init();
        return true;
    }

    field prusate Int Count { get { return data; } set { data : value; } }
    field precate Data Data { get { return data; } set { data : value; } }
    field precate Int ListCount { get { return 1024; } set { } }

    maide prusate Bool Set(var Int index, var Index value)
    {
        var Int ka;
        ka : index * (4 + 4 * 8);

        this.Data.Set(ka + 0, value.IndexA.Index);
        this.Data.Set(ka + 1, value.IndexB.Index);
        this.Data.Set(ka + 2, value.IndexC.Index);
        this.Data.Set(ka + 3, value.IndexD.Index);
        return true;
    }
}
class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;

        this.Count : this.ListCount;

        var Int count;
        count : this.DataIndex(this.Count);

        this.Data : new Data;
        this.Data.Count : count;
        this.Data.Init();
        return true;
    }

    field prusate Int Count { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate Data Data { get { return data; } set { data : value; } }
    field precate Int ListCount { get { return 1024; } set { } }

    maide prusate Bool Set(var Int index, var Index value)
    {
        var Int ka;
        ka : this.DataIndex(index);

        this.Data.Set(ka + 0, value.IndexA.Index);
        this.Data.Set(ka + 1, value.IndexB.Index);
        this.Data.Set(ka + 2, value.IndexC.Index);
        this.Data.Set(ka + 3, value.IndexD.Index);

        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 0), value.Area.Pos.Col);
        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 1), value.Area.Pos.Row);
        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 2), value.Area.Size.Wed);
        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 3), value.Area.Size.Het);
        return true;
    }

    maide precate Int AreaValueDataIndex(var Int dataIndex, var Int varField)
    {
        return dataIndex + 4 + varField * 8;
    }

    maide precate Int DataIndex(var Int index)
    {
        return index * (4 + 4 * 8);
    }
}
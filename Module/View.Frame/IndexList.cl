class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.DrawInfra : share DrawInfra;

        this.Count : this.ListCount;

        var Int count;
        count : this.DataIndex(this.Count);

        this.Data : new Data;
        this.Data.Count : count;
        this.Data.Init();

        this.Index : new Index;
        this.Index.Init();
        this.Index.Area : this.DrawInfra.RectCreate(0, 0, 0, 0);
        return true;
    }

    field prusate Int Count { get { return data; } set { data : value; } }
    field prusate Index Index { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate Data Data { get { return data; } set { data : value; } }
    field precate Int ListCount { get { return 1024; } set { } }

    maide prusate Bool Set(var Int index)
    {
        inf (this.Index.IndexA = null)
        {
            return true;
        }

        var Int ka;
        ka : this.DataIndex(index);

        this.Data.Set(ka + 0, this.Index.IndexA.Index);
        this.Data.Set(ka + 1, this.Index.IndexB.Index);
        this.Data.Set(ka + 2, this.Index.IndexC.Index);
        this.Data.Set(ka + 3, this.Index.IndexD.Index);

        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 0), this.Index.Area.Pos.Col);
        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 1), this.Index.Area.Pos.Row);
        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 2), this.Index.Area.Size.Width);
        this.InfraInfra.DataIntSet(this.Data, this.AreaValueDataIndex(ka, 3), this.Index.Area.Size.Hegth);
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
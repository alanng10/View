class Type : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.Index : share IndexList;

        this.InitFieldList();
        return true;
    }

    field prusate IndexList Index { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate Array Field { get { return data; } set { data : value; } }

    maide precate Bool InitFieldList()
    {
        this.Field : this.ListInfra.ArrayCreate(this.Index.Count);
        return true;
    }

    maide prusate Bool Get(var Int index)
    {
        var Bool a;
        a : cast Bool(this.Field.Get(index));
        return a;
    }

    maide prusate Bool Set(var Int index, var Bool value)
    {
        var Index k;
        k : this.Index.Get(index);

        inf (k = null)
        {
            return true;
        }

        var Bool ka;
        ka : this.Get(index);

        inf (ka = value)
        {
            return true;
        }

        this.Field.Set(index, value);

        this.Event(k, value);
        return true;
    }
}
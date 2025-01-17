class Type : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.IndexList : share IndexList;

        this.InitFieldList();
        return true;
    }

    field prusate IndexList IndexList { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate Array Field { get { return data; } set { data : value; } }

    maide precate Bool InitFieldList()
    {
        this.Field : this.ListInfra.ArrayCreate(this.IndexList.Count);
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
        k : this.IndexList.Get(index);

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

    maide prusate Bool Event(var Index index, var Bool value)
    {
    }
}
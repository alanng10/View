class ListIter : Iter
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Iter : this.CreateIter();
        return true;
    }

    field prusate Iter Iter { get { return data; } set { data : value; } }

    field prusate Any Index
    {
        get
        {
            return this.Iter.Index;
        }
        set
        {
        }
    }

    field prusate Any Value
    {
        get
        {
            return this.Iter.Value;
        }
        set
        {
        }
    }

    maide precate Iter CreateIter()
    {
        var Iter a;
        a : new TableIter;
        a.Init();
        return a;
    }

    maide prusate Bool Next()
    {
        return this.Iter.Next();
    }

    maide prusate Bool Clear()
    {
        this.Iter.Clear();
        return true;
    }
}
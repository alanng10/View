class ListIter : Iter
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Iter : new TableIter;
        this.Iter.Init();
        return true;
    }

    field pronate Iter Iter { get { return data; } set { data : value; } }

    maide prusate Any Index
    {
        get
        {
            return this.Iter.Index;
        }
        set
        {
        }
    }

    maide prusate Any Value
    {
        get
        {
            return this.Iter.Value;
        }
        set
        {
        }
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
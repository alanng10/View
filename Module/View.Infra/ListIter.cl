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

    maide prusate Bool Next()
    {
        return this.Iter.Next();
    }
}
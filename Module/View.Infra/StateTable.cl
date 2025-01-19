class StateTable : Table
{
    maide prusate Bool Init()
    {
        var RefLess less;
        less : new RefLess;
        less.Init();
        this.Less : less;

        base.Init();
        this.ListInfra : share ListInfra;
        return true;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }

    maide prusate Bool AddState(var State state)
    {
        return true;
    }
}
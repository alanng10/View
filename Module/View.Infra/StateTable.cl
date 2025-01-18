class StateTable : Table
{
    maide prusate Bool Init()
    {
        var RefLess less;
        less : new RefLess;
        less.Init();
        this.Less : less;

        base.Init();
        return true;
    }
}
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

    maide prusate Bool AddState(var State a)
    {
        this.ListInfra.TableAdd(this, a, a);
        return true;
    }

    maide prusate Bool RemState(var State a)
    {
        return this.Rem(a);
    }
}
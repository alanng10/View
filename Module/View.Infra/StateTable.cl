class StateTable : Table
{
    maide prusate Bool Init()
    {
        this.Less : this.CreateLess();

        base.Init();

        this.ListInfra : share ListInfra;
        return true;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }

    maide precate Less CreateLess()
    {
        var RefLess a;
        a : new RefLess;
        a.Init();
        return a;
    }

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
class Event : Any
{
    maide prusate Bool Init()
    {
        base.Init();

        this.State : this.CreateState();
        this.StateIter : this.State.IterCreate();
        return true;
    }

    field prusate StateTable State { get { return data; } set { data : value; } }
    field precate Iter StateIter { get { return data; } set { data : value; } }

    maide precate StateTable CreateState()
    {
        var StateTable a;
        a : new StateTable;
        a.Init();
        return a;
    }

    maide prusate Bool Execute(var Any arg)
    {
        var Iter iter;
        iter : this.StateIter;
        this.State.IterSet(iter);
        while (iter.Next())
        {
            var State state;
            state : cast State(iter.Value);
            state.Arg : arg;
            state.Execute();
            state.Arg : null;
        }
        return true;
    }
}
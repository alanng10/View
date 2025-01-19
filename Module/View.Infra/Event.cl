class Event : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        var StateTable state;
        state : new StateTable;
        state.Init();
        this.State : state;
        this.StateIter : this.State.IterCreate();
        return true;
    }

    field prusate StateTable State { get { return data; } set { data : value; } }
    field precate Iter StateIter { get { return data; } set { data : value; } }
}
class List : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;

        this.ItemTable : this.CreateItemTable();
        this.ItemIter : this.CreateItemIter();
        this.EventState : this.CreateEventState();
    }
}
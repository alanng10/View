class List : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;

        this.ItemTable : this.CreateItemTable();
        this.ItemIter : this.CreateItemIter();
        this.EventState : this.CreateEventState();

        this.ListModArg : cast ListMod(this.ModArg);
        return true;
    }

    field prusate Int Count
    {
        get
        {
            return this.ItemTable.Count;
        }
        set
        {
        }
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate Table ItemTable { get { return data; } set { data : value; } }
    field precate Iter ItemIter { get { return data; } set { data : value; } }
    field precate State EventState { get { return data; } set { data : value; } }
    field precate ListMod ListModArg { get { return data; } set { data : value; } }

    maide precate Mod CreateModArg()
    {
        var Mod a;
        a : new ListMod;
        a.Init();
        return a;
    }

    maide precate Table CreateItemTable()
    {
        var RefLess less;
        less : new RefLess;
        less.Init();
        var Table a;
        a : new Table;
        a.Less : less;
        a.Init();
        return a;
    }

    maide precate Iter CreateItemIter()
    {
        return this.ItemTable.IterCreate();
    }

    maide precate State CreateEventState()
    {
        var ListState a;
        a : new ListState;
        a.Init();
        a.List : this;
        return a;
    }

    maide prusate Bool ListMod(var Comp item)
    {
        this.ListModArg.Item : item;

        this.ListEvent();

        this.ListModArg.Item : null;
        return true;
    }

    maide precate Bool ListEvent()
    {
        return this.Event(null);
    }

    maide prusate Bool Add(var Comp item)
    {
        inf (item = null)
        {
            return false;
        }

        inf (this.Valid(item))
        {
            return false;
        }

        this.ListInfra.TableAdd(this.ItemTable, item, item);

        item.ModEvent.State.AddState(this.EventState);

        this.ListEvent();
        return true;
    }

    maide prusate Bool Ins(var Comp index, var Comp item)
    {
        inf (~this.Valid(index))
        {
            return false;
        }

        inf (item = null)
        {
            return false;
        }

        inf (this.Valid(item))
        {
            return false;
        }

        var Entry entry;
        entry : new Entry;
        entry.Init();
        entry.Index : item;
        entry.Value : item;

        this.ItemTable.Ins(index, entry);

        item.ModEvent.State.AddState(this.EventState);

        this.ListEvent();
        return true;
    }

    maide prusate Bool Rem(var Comp item)
    {
        inf (~this.Valid(item))
        {
            return false;
        }

        this.ItemTable.Rem(item);

        item.ModEvent.State.RemState(this.EventState);

        this.ListEvent();
        return true;
    }

    maide prusate Bool Clear()
    {
        var Iter iter;
        iter : this.ItemIter;
        this.ItemTable.IterSet(iter);
        while (iter.Next())
        {
            var Comp item;
            item : cast Comp(iter.Value);
            item.ModEvent.State.RemState(this.EventState);
        }

        this.ItemTable.Clear();

        this.ListEvent();
        return true;
    }
}
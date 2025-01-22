namespace View.Infra;

public class List : Comp
{
    public override bool Init()
    {
        base.Init();
        this.ListInfra = ListInfra.This;

        this.ItemTable = this.CreateItemTable();
        this.ItemIter = this.CreateItemIter();
        this.EventState = this.CreateEventState();

        this.ListModArg = this.ModArg as ListMod;
        return true;
    }

    public virtual long Count
    {
        get
        {
            return this.ItemTable.Count;
        }
        set
        {
        }
    }

    protected virtual ListInfra ListInfra { get; set; }
    protected virtual Table ItemTable { get; set; }
    protected virtual Iter ItemIter { get; set; }
    protected virtual State EventState { get; set; }
    protected virtual ListMod ListModArg { get; set; }

    protected override Mod CreateModArg()
    {
        Mod a;
        a = new ListMod();
        a.Init();
        return a;
    }

    protected virtual Table CreateItemTable()
    {
        RefLess less;
        less = new RefLess();
        less.Init();
        Table a;
        a = new Table();
        a.Less = less;
        a.Init();
        return a;
    }

    protected virtual Iter CreateItemIter()
    {
        return this.ItemTable.IterCreate();
    }

    protected virtual State CreateEventState()
    {
        ListState a;
        a = new ListState();
        a.Init();
        a.List = this;
        return a;
    }

    public virtual bool ListMod(Comp item)
    {
        this.ListModArg.Item = item;

        this.ListEvent();

        this.ListModArg.Item = null;
        return true;
    }

    protected virtual bool ListEvent()
    {
        return this.Event(null);
    }

    public virtual bool Add(Comp item)
    {
        if (item == null)
        {
            return false;
        }

        if (this.Valid(item))
        {
            return false;
        }

        this.ListInfra.TableAdd(this.ItemTable, item, item);

        item.ModEvent.State.AddState(this.EventState);

        this.ListEvent();
        return true;
    }

    public virtual bool Ins(Comp index, Comp item)
    {
        if (!this.Valid(index))
        {
            return false;
        }

        if (item == null)
        {
            return false;
        }

        if (this.Valid(item))
        {
            return false;
        }

        Entry entry;
        entry = new Entry();
        entry.Init();
        entry.Index = item;
        entry.Value = item;

        this.ItemTable.Ins(index, entry);

        item.ModEvent.State.AddState(this.EventState);

        this.ListEvent();
        return true;
    }

    public virtual bool Rem(Comp item)
    {
        if (!this.Valid(item))
        {
            return false;
        }

        this.ItemTable.Rem(item);

        item.ModEvent.State.RemState(this.EventState);

        this.ListEvent();
        return true;
    }

    public virtual bool Clear()
    {
        Iter iter;
        iter = this.ItemIter;
        this.ItemTable.IterSet(iter);
        while (iter.Next())
        {
            Comp item;
            item = iter.Value as Comp;
            item.ModEvent.State.RemState(this.EventState);
        }

        this.ItemTable.Clear();

        this.ListEvent();
        return true;
    }

    public virtual bool Valid(Comp index)
    {
        return this.ItemTable.Valid(index);
    }

    public virtual Comp Get(Comp index)
    {
        return this.ItemTable.Get(index) as Comp;
    }

    public virtual Iter IterCreate()
    {
        ListIter a;
        a = new ListIter();
        a.Init();
        return a;
    }

    public virtual bool IterSet(Iter iter)
    {
        ListIter a;
        a = iter as ListIter;
        this.ItemTable.IterSet(a.Iter);
        return true;
    }
}
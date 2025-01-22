namespace View.Infra;

public class List : Comp
{
    public override bool Init()
    {
        base.Init();

        this.ItemTable = this.CreateItemTable();
        this.ItemIter = this.CreateItemIter();

        this.EventState = this.CreateEventState();

        this.ListTriggerArg = (ListMod)this.ModArg;
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

    protected virtual Table ItemTable { get; set; }
    protected virtual Iter ItemIter { get; set; }
    protected virtual State EventState { get; set; }
    protected virtual ListMod ListTriggerArg { get; set; }

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

    public virtual bool ItemChange(Comp item)
    {
        this.ListTriggerArg.Item = item;

        this.TriggerList();

        this.ListTriggerArg.Item = null;
        return true;
    }

    public virtual bool Add(Comp item)
    {
        if (item == null)
        {
            return true;
        }

        Entry entry;
        entry = new Entry();
        entry.Init();
        entry.Index = item;
        entry.Value = item;

        this.ItemTable.Add(entry);

        item.ModEvent.State.AddState(this.EventState);

        this.TriggerList();
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
            item = (Comp)iter.Value;
            item.ModEvent.State.RemState(this.EventState);
        }

        this.ItemTable.Clear();

        this.TriggerList();
        return true;
    }

    public virtual bool Ins(Comp index, Comp item)
    {
        if (!this.Valid(index))
        {
            return true;
        }

        if (item == null)
        {
            return true;
        }

        Entry entry;
        entry = new Entry();
        entry.Init();
        entry.Index = item;
        entry.Value = item;

        this.ItemTable.Ins(index, entry);

        item.ModEvent.State.AddState(this.EventState);

        this.TriggerList();
        return true;
    }

    public virtual bool Rem(Comp comp)
    {
        Comp item;
        item = this.Get(comp);
        if (item == null)
        {
            return true;
        }

        this.ItemTable.Rem(item);

        item.ModEvent.State.RemState(this.EventState);

        this.TriggerList();
        return true;
    }

    public virtual Iter IterCreate()
    {
        ListIter iter;
        iter = new ListIter();
        iter.Init();
        Iter a;
        a = iter;
        return a;
    }

    public virtual bool IterSet(Iter iter)
    {
        ListIter a;
        a = (ListIter)iter;
        this.ItemTable.IterSet(a.Iter);
        return true;
    }

    protected virtual bool TriggerList()
    {
        this.Event(null);
        return true;
    }

    public virtual bool Valid(Comp index)
    {
        return !(this.Get(index) == null);
    }

    public virtual Comp Get(Comp index)
    {
        return (Comp)this.ItemTable.Get(index);
    }
}
class CompList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        var Extern extern;
        extern : share Extern;

        var Int varShare;
        varShare : extern.Infra_Share();
        var Int stat;
        stat : extern.Share_Stat(varShare);

        this.Source : this.AddItem(extern.Stat_CompSource(stat));
        this.Dest : this.AddItem(extern.Stat_CompDest(stat));
        this.SourceOver : this.AddItem(extern.Stat_CompSourceOver(stat));
        this.DestOver : this.AddItem(extern.Stat_CompDestOver(stat));
        this.SourceInn : this.AddItem(extern.Stat_CompSourceInn(stat));
        this.DestInn : this.AddItem(extern.Stat_CompDestInn(stat));
        this.SourceOut : this.AddItem(extern.Stat_CompSourceOut(stat));
        this.DestOut : this.AddItem(extern.Stat_CompDestOut(stat));
        return true;
    }

    field prusate Comp Source { get { return data; } set { data : value; } }
    field prusate Comp Dest { get { return data; } set { data : value; } }
    field prusate Comp SourceOver { get { return data; } set { data : value; } }
    field prusate Comp DestOver { get { return data; } set { data : value; } }
    field prusate Comp SourceInn { get { return data; } set { data : value; } }
    field prusate Comp DestInn { get { return data; } set { data : value; } }
    field prusate Comp SourceOut { get { return data; } set { data : value; } }
    field prusate Comp DestOut { get { return data; } set { data : value; } }

    maide precate Comp AddItem(var Int o)
    {
        var Comp item;
        item : new Comp;
        item.Init();
        item.Index : this.Index;
        item.Intern : o;
        this.Array.Set(item.Index, item);
        this.Index : this.Index + 1;
        return item;
    }

    maide precate Bool InitArray()
    {
        this.Array : new Array;
        this.Array.Count : this.ArrayCount;
        this.Array.Init();
        return true;
    }

    field precate Array Array { get { return data; } set { data : value; } }

    field precate Int ArrayCount { get { return 8; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate Comp Get(var Int index)
    {
        return cast Comp(this.Array.Get(index));
    }
}
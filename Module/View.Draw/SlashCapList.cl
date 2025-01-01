class SlashCapList : Any
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

        this.Flat : this.AddItem(extern.Stat_SlashCapFlat(stat));
        this.Square : this.AddItem(extern.Stat_SlashCapSquare(stat));
        this.Round : this.AddItem(extern.Stat_SlashCapRound(stat));
        return true;
    }

    field prusate SlashCap Flat { get { return data; } set { data : value; } }
    field prusate SlashCap Square { get { return data; } set { data : value; } }
    field prusate SlashCap Round { get { return data; } set { data : value; } }

    maide precate SlashCap AddItem(var Int o)
    {
        var SlashCap item;
        item : new SlashCap;
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

    field precate Int ArrayCount { get { return 3; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate SlashCap Get(var Int index)
    {
        return cast SlashCap(this.Array.Get(index));
    }
}
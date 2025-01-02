class SlashCapeList : Any
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

        this.Plane : this.AddItem(extern.Stat_SlashCapePlane(stat));
        this.Right : this.AddItem(extern.Stat_SlashCapeRight(stat));
        this.Round : this.AddItem(extern.Stat_SlashCapeRound(stat));
        return true;
    }

    field prusate SlashCape Plane { get { return data; } set { data : value; } }
    field prusate SlashCape Right { get { return data; } set { data : value; } }
    field prusate SlashCape Round { get { return data; } set { data : value; } }

    maide precate SlashCape AddItem(var Int o)
    {
        var SlashCape item;
        item : new SlashCape;
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

    maide prusate SlashCape Get(var Int index)
    {
        return cast SlashCape(this.Array.Get(index));
    }
}
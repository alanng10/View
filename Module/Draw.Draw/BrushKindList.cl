class BrushKindList : Any
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

        this.Color : this.AddItem(extern.Stat_BrushKindColor(stat));
        this.Polate : this.AddItem(extern.Stat_BrushKindPolate(stat));
        this.Image : this.AddItem(extern.Stat_BrushKindImage(stat));
        return true;
    }

    field prusate BrushKind Color { get { return data; } set { data : value; } }
    field prusate BrushKind Polate { get { return data; } set { data : value; } }
    field prusate BrushKind Image { get { return data; } set { data : value; } }

    maide precate BrushKind AddItem(var Int o)
    {
        var BrushKind item;
        item : new BrushKind;
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

    maide prusate BrushKind Get(var Int index)
    {
        return cast BrushKind(this.Array.Get(index));
    }
}
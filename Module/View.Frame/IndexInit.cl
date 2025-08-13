class IndexInit : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.DrawInfra : share DrawInfra;

        this.InitList();

        this.BrushBack : this.DrawInfra.BrushCreate(this.DrawInfra.ColorCreate(0h80, 0, 0, 0));
        return true;
    }

    maide prusate Bool Final()
    {
        this.BrushBack.Final();
        return true;
    }

    maide precate Bool InitList()
    {
        this.List : this.ListInfra.ArrayCreate(this.ListCount);

        var Int count;
        count : this.List.Count;

        var Int i;
        i : 0;

        while (i < count)
        {
            var Index a;
            a : new Index;
            a.Init();

            a.Area : this.DrawInfra.RectCreate(0, 0, 0, 0);
            
            this.List.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    field prusate Array List { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate Int ListCount { get { return 1024; } set { } }
    field precate DrawBrush BrushBack { get { return data; } set { data : value; } }
}
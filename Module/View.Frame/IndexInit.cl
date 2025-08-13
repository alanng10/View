class IndexInit : Any
{
    maide prusate Bool Init()
    {
        base.Init();
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
        this.List : new IndexList;
        this.List.Init();
        return true;
    }

    field prusate IndexList List { get { return data; } set { data : value; } }
    field prusate DrawBrush BrushBack { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
}
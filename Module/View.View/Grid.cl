class Grid : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ColField : this.CreateColField();
        this.RowField : this.CreateRowField();
        this.ChildListField : this.CreateChildListField();

        this.Col : this.CreateCol();
        this.Row : this.CreateRow();
        this.ChildList : this.CreateChildList();

        this.Back : this.DrawInfra.ZeroSlash.Brush;

        this.ChildPosList : this.CreateChildPosList();
        this.ColIter : this.Col.IterCreate();
        this.RowIter : this.Row.IterCreate();
        this.ChildListIter : this.ChildList.IterCreate();

        this.StackGridRect : this.CreateStackGridRect();
        this.StackGridPos : this.CreateStackGridPos();
        return true;
    }
}
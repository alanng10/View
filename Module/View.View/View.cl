class View : Comp
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;

        this.PosField : this.CreatePosField();
        this.SizeField : this.CreateSizeField();
        this.BackField : this.CreateBackField();
        this.VisibleField : this.CreateVisibleField();
        this.ChildField : this.CreateChildField();
    }
}
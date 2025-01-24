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

        this.Pos : this.CreatePos();
        this.Size : this.CreateSize();
        this.Back : this.CreateBack();
        this.Visible : true;

        this.Area : this.CreateArea();

        this.DrawRectA : this.CreateDrawRect();
        this.DrawRectB : this.CreateDrawRect();
        this.DrawRectC : this.CreateDrawRect();
        this.DrawRectD : this.CreateDrawRect();

        this.DrawPosA : this.CreateDrawPos();

        this.StackRect : this.CreateStackRect();
        this.StackPos : this.CreateStackPos();
        return true;
    }

    maide precate Field CreatePosField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateSizeField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateBackField()
    {
        return this.ViewInfra.FieldCreate(this);
    }
}
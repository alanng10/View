class Text : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ValueField : this.CreateValueField();
        this.DestField : this.CreateDestField();
        this.FontField : this.CreateFontField();
        this.ColAlignField : this.CreateColAlignField();
        this.RowAlignField : this.CreateRowAlignField();
        this.WordWrapField : this.CreateWordWrapField();
        return true;
    }

    maide precate Field CreateValueField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateDestField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateFontField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateColAlignField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateRowAlignField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateWordWrapField()
    {
        return this.ViewInfra.FieldCreate(this);
    }
}
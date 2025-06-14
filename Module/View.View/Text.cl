class Text : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawAlignList : share DrawAlignList;
        this.ValueField : this.CreateValueField();
        this.DestField : this.CreateDestField();
        this.FontField : this.CreateFontField();
        this.ColAlignField : this.CreateColAlignField();
        this.RowAlignField : this.CreateRowAlignField();
        this.WordWrapField : this.CreateWordWrapField();

        this.Dest : this.CreateDest();
        this.Back : this.DrawInfra.SlashZero.Brush;
        this.Font : this.Palete.FontAria;
        this.ColAlign : this.DrawAlignList.Start;
        this.RowAlign : this.DrawAlignList.Start;
        this.WordWrap : true;
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

    maide precate Rect CreateDest()
    {
        return this.CreateRect();
    }

    maide precate Rect CreateRect()
    {
        var Rect a;
        a : new Rect;
        a.Init();
        return a;
    }

    field precate DrawAlignList DrawAlignList { get { return data; } set { data : value; } }
}
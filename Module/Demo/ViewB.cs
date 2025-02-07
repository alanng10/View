namespace Demo;

class ViewB : ViewView
{
    public override bool Init()
    {
        base.Init();
        long wed;
        long het;
        wed = 400;
        het = 200;

        DrawRect sourceRect;
        sourceRect = this.Demo.DrawInfra.RectCreate(this.MathInt(1880), this.MathInt(910), this.MathInt(wed), this.MathInt(het));

        DrawRect destRectA;
        destRectA = this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        DrawRect sourceRectA;
        sourceRectA = this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        this.Pos.Col = 60;
        this.Pos.Row = 40;
        this.Size.Wed = wed;
        this.Size.Het = het;
        this.DrawImage = this.Demo.DrawInfra.ImageCreateStorage(this.S("ViewDemoData/image.jpg"));
        this.SourceRect = sourceRect;
        this.DestRectA = destRectA;
        this.SourceRectA = sourceRectA;
        this.Form = new DrawForm();
        this.Form.Init();
        this.ThreadDrawImage = this.ThreadDrawImage;
        return true;
    }

    public virtual bool Final()
    {
        this.Form.Final();

        this.DrawImage.Final();

        return true;
    }

    public virtual Demo Demo { get; set; }
    public virtual DrawImage DrawImage { get; set; }
    public virtual DrawRect SourceRect { get; set; }
    public virtual DrawForm Form { get; set; }
    public virtual DrawImage ThreadDrawImage { get; set; }
    public virtual DrawRect DestRectA { get; set; }
    public virtual DrawRect SourceRectA { get; set; }

    protected override bool ExecuteDrawThis(DrawDraw draw)
    {
        long col;
        long row;
        col = this.Pos.Col;
        row = this.Pos.Row;
        long wed;
        long het;
        wed = this.Size.Wed;
        het = this.Size.Het;

        this.DrawRectA.Pos.Col = this.MathInt(col);
        this.DrawRectA.Pos.Row = this.MathInt(row);
        this.DrawRectA.Size.Wed = this.MathInt(wed);
        this.DrawRectA.Size.Het = this.MathInt(het);

        long angle;
        angle = this.MathInt(20);
    
        long colScale;
        colScale = this.MathValue(3, -1);

        long rowScale;
        rowScale = this.MathInt(1);

        this.Form.Reset();

        this.Form.Angle(angle);

        this.Form.Scale(colScale, rowScale);

        draw.Form = this.Form;
        draw.FormSet();

        draw.ExecuteImage(this.DrawImage, this.DrawRectA, this.SourceRect);

        draw.Form = null;
        draw.FormSet();

        this.DestRectA.Pos.Col = this.MathInt(col);
        this.DestRectA.Pos.Row = this.MathInt(row + 150);

        draw.Comp = this.Demo.CompList.SourceOver;

        draw.ExecuteImage(this.ThreadDrawImage, this.DestRectA, this.SourceRectA);

        draw.Comp = null;
        return true;
    }
}
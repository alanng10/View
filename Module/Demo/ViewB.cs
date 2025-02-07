namespace Demo;

class ViewB : ViewView
{
    public override bool Init()
    {
        base.Init();
        long wedA;
        long hetA;
        wedA = 400;
        hetA = 200;

        DrawRect sourceRect;
        sourceRect = this.DrawInfra.RectCreate(this.MathInt(1880), this.MathInt(910), this.MathInt(wedA), this.MathInt(hetA));

        DrawRect destRectA;
        destRectA = this.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        DrawRect sourceRectA;
        sourceRectA = this.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        this.Pos.Col = 60;
        this.Pos.Row = 40;
        this.Size.Wed = wedA;
        this.Size.Het = hetA;
        this.DrawImage = this.ImageCreate();
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

        this.ImageFinal(this.DrawImage);

        return true;
    }

    private DrawImage ImageCreate()
    {
        DrawImage image;
        image = this.DrawInfra.ImageCreateStorage(this.S("ViewDemoData/image.jpg"));
        return image;
    }

    private bool ImageFinal(DrawImage image)
    {
        image.Final();
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
        col = this.Pos.Col;
        long row;
        row = this.Pos.Row;
        long wed;
        wed = this.Size.Wed;
        long het;
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
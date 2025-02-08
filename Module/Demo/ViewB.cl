class ViewB : View
{
    maide prusate Bool Init()
    {
        base.Init();
        var Int wed;
        var Int het;
        wed : 400;
        het : 200;

        var DrawRect sourceRect;
        sourceRect : this.Demo.DrawInfra.RectCreate(this.MathInt(1880), this.MathInt(910), this.MathInt(wed), this.MathInt(het));

        var DrawRect destRectA;
        destRectA : this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        var DrawRect sourceRectA;
        sourceRectA : this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        this.Pos.Col : 60;
        this.Pos.Row : 40;
        this.Size.Wed : wed;
        this.Size.Het : het;
        this.DrawImage : this.Demo.DrawInfra.ImageCreateStorage("View.Demo-0.00.00.data/Demo/image.jpg");
        this.SourceRect : sourceRect;
        this.DestRectA : destRectA;
        this.SourceRectA : sourceRectA;
        this.Form : new DrawForm;
        this.Form.Init();
        this.ThreadDrawImage : this.ThreadDrawImage;
        return true;
    }

    maide prusate Bool Final()
    {
        this.Form.Final();

        this.DrawImage.Final();

        return true;
    }

    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate DrawImage DrawImage { get { return data; } set { data : value; } }
    field prusate DrawRect SourceRect { get { return data; } set { data : value; } }
    field prusate DrawForm Form { get { return data; } set { data : value; } }
    field prusate DrawImage ThreadDrawImage { get { return data; } set { data : value; } }
    field prusate DrawRect DestRectA { get { return data; } set { data : value; } }
    field prusate DrawRect SourceRectA { get { return data; } set { data : value; } }
}
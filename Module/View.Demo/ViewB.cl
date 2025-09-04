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
        this.Size.Width : wed;
        this.Size.Het : het;
        this.DrawImage : this.Demo.DrawInfra.ImageCreateStorage("View.Demo-0.00.00.data/Demo/image.jpg");
        this.SourceRect : sourceRect;
        this.DestRectA : destRectA;
        this.SourceRectA : sourceRectA;
        this.Form : new DrawForm;
        this.Form.Init();
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
    field prusate DrawRect DestRectA { get { return data; } set { data : value; } }
    field prusate DrawRect SourceRectA { get { return data; } set { data : value; } }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var Int col;
        var Int row;
        col : this.Pos.Col;
        row : this.Pos.Row;
        var Int wed;
        var Int het;
        wed : this.Size.Width;
        het : this.Size.Het;

        this.DrawRectA.Pos.Col : this.MathInt(col);
        this.DrawRectA.Pos.Row : this.MathInt(row);
        this.DrawRectA.Size.Width : this.MathInt(wed);
        this.DrawRectA.Size.Het : this.MathInt(het);

        var Int angle;
        angle : this.MathInt(20);

        var Int colScale;
        colScale : this.MathValue(3, 0sn1);

        var Int rowScale;
        rowScale : this.MathInt(1);

        this.Form.Reset();

        this.Form.Angle(angle);

        this.Form.Scale(colScale, rowScale);

        draw.Form : this.Form;
        draw.FormSet();

        draw.ExecuteImage(this.DrawImage, this.DrawRectA, this.SourceRect);

        draw.Form : null;
        draw.FormSet();

        this.DestRectA.Pos.Col : this.MathInt(col);
        this.DestRectA.Pos.Row : this.MathInt(row + 150);

        draw.Comp : this.Demo.CompList.SourceOver;

        draw.ExecuteImage(this.Demo.ThreadDrawImage, this.DestRectA, this.SourceRectA);

        draw.Comp : null;
        return true;
    }
}
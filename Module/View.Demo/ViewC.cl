class ViewC : View
{
    maide prusate Bool Init()
    {
        base.Init();
        var DrawPolateLinear polateLinear;
        polateLinear : new DrawPolateLinear;
        polateLinear.StartPos : this.Demo.DrawInfra.PosCreate(this.MathInt(300), 0);
        polateLinear.EndPos : this.Demo.DrawInfra.PosCreate(this.MathInt(300), this.MathInt(400));
        polateLinear.Init();

        var DrawPolateStop polateStop;
        polateStop : new DrawPolateStop;
        polateStop.Count : 3;
        polateStop.Init();

        var DrawPolateStopPoint aa;
        aa : new DrawPolateStopPoint;
        aa.Init();

        this.PolateStopSetPoint(polateStop, aa, 0, 0, this.Demo.DrawInfra.ColorCreate(0hff, 0hff, 0, 0));
        this.PolateStopSetPoint(polateStop, aa, 1, this.MathValue(1, 0sn1), this.Demo.DrawInfra.ColorCreate(0hff, 0, 0hff, 0));
        this.PolateStopSetPoint(polateStop, aa, 2, this.MathInt(1), this.Demo.DrawInfra.ColorCreate(0hff, 0, 0, 0hff));

        var DrawPolate polate;
        polate : new DrawPolate;
        polate.Kind : this.Demo.PolateKindList.Linear;
        polate.Linear : polateLinear;
        polate.Stop : polateStop;
        polate.Spread : this.Demo.PolateSpreadList.Close;
        polate.Init();

        var DrawBrush brush;
        brush : new DrawBrush;
        brush.Kind : this.Demo.BrushKindList.Polate;
        brush.Polate : polate;
        brush.Init();

        var String oa;
        oa : "G L 的哈gd@行 o #";

        var TextText textA;
        textA : this.Demo.TextCreate(oa);

        this.Pos.Col : 100;
        this.Pos.Row : 0;
        this.Size.Wed : 500;
        this.Size.Het : 400;
        this.Back : brush;
        this.EllipseBrush : this.EllipseBrushCreate();
        this.EllipseRect : this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(100), this.MathInt(50));
        this.Font : this.FontCreate();
        this.Text : textA;
        this.TextSlash : this.TextSlashCreate();

        var Image image;
        image : new Image;
        image.Init();
        image.Pos.Col : 0;
        image.Pos.Row : 0;
        image.Size.Wed : 16;
        image.Size.Het : 16;
        image.Dest.Pos.Col : 0;
        image.Dest.Pos.Row : 0;
        image.Dest.Size.Wed : 16;
        image.Dest.Size.Het : 16;
        image.Source.Pos.Col : 0;
        image.Source.Pos.Row : 0;
        image.Source.Size.Wed : 16;
        image.Source.Size.Het : 16;
        image.Value : this.ButtonImage;

        var Text text;
        text : new Text;
        text.Palete : this.ViewInfra.PaleteDefault;
        text.Init();
        text.Pos.Col : 0;
        text.Pos.Row : 0;
        text.Size.Wed : 80;
        text.Size.Het : 60;
        text.Dest.Pos.Col : 0;
        text.Dest.Pos.Row : 0;
        text.Dest.Size.Wed : 80;
        text.Dest.Size.Het : 60;
        text.Value : this.Demo.TextCreate("H k m5 #");

        this.Button : new Button;
        this.Button.Palete : this.ViewInfra.PaleteDefault;
        this.Button.Init();
        this.Button.Pos.Col : 20;
        this.Button.Pos.Row : 20;
        this.Button.Size.Wed : 100;
        this.Button.Size.Het : 60;
        this.Button.Child : image;

        this.Mark : new Mark;
        this.Mark.Palete : this.ViewInfra.PaleteDefault;
        this.Mark.Init();
        this.Mark.Pos.Col : 20;
        this.Mark.Pos.Row : 20;
        this.Mark.Size.Wed : 100;
        this.Mark.Size.Het : 60;
        this.Mark.Child : text;

        this.Radio : new Radio;
        this.Radio.Palete : this.ViewInfra.PaleteDefault;
        this.Radio.Init();
        this.Radio.Pos.Col : 120;
        this.Radio.Pos.Row : 20;
        this.Radio.Size.Wed : 100;
        this.Radio.Size.Het : 60;

        var Grid grid;
        grid : new Grid;
        grid.Init();
        grid.Pos.Col : 200;
        grid.Pos.Row : 100;
        grid.Size.Wed : 300;
        grid.Size.Het : 600;
        grid.Back : this.ViewInfra.PaleteDefault.Base.Brush;

        var ViewCount colA;
        colA : new ViewCount;
        colA.Init();
        colA.Value : 300;
        var ViewCount rowA;
        rowA : new ViewCount;
        rowA.Init();
        rowA.Value : 150;
        var ViewCount rowB;
        rowB : new ViewCount;
        rowB.Init();
        rowB.Value : 150;
        
        var GridChild childA;
        childA : new GridChild;
        childA.Init();
        childA.View : this.Button;
        childA.Rect.Size.Wed : 1;
        childA.Rect.Size.Het : 1;

        var GridChild childB;
        childB : new GridChild;
        childB.Init();
        childB.View : this.Mark;
        childB.Rect.Pos.Row : 1;
        childB.Rect.Size.Wed : 1;
        childB.Rect.Size.Het : 1;

        var GridChild childC;
        childC : new GridChild;
        childC.Init();
        childC.View : this.Radio;
        childC.Rect.Pos.Row : 1;
        childC.Rect.Size.Wed : 1;
        childC.Rect.Size.Het : 1;

        grid.Col.Add(colA);
        grid.Row.Add(rowA);
        grid.Row.Add(rowB);
        grid.ChildList.Add(childA);
        grid.ChildList.Add(childB);
        grid.ChildList.Add(childC);

        this.Child : grid;
        return true;
    }

    maide prusate Bool Final()
    {
        var DrawBrush brush;
        brush : this.Back;
        var DrawPolate polate;
        polate : brush.Polate;
        var DrawPolateStop polateStop;
        polateStop : polate.Stop;
        var DrawPolateLinear polateLinear;
        polateLinear : polate.Linear;

        this.TextSlashFinal(this.TextSlash);

        this.FontFinal(this.Font);

        this.EllipseBrushFinal(this.EllipseBrush);

        brush.Final();

        polate.Final();

        polateStop.Final();

        polateLinear.Final();
        return true;
    }

    maide private DrawFont FontCreate()
    {
        var DrawFont a;
        a : new DrawFont;
        a.Name : this.Demo.DrawInfra.FontMonoName;
        a.Size : 20;
        a.Strong : 400;
        a.Tenden : true;
        a.Staline : true;
        a.Midline : true;
        a.Endline : true;
        a.Init();
        return a;
    }

    maide private Bool FontFinal(var DrawFont a)
    {
        a.Final();
        return true;
    }

    maide private DrawSlash TextSlashCreate()
    {
        var DrawBrush ka;
        ka : new DrawBrush;
        ka.Kind : this.Demo.BrushKindList.Color;
        ka.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0, 0, 0hff);
        ka.Init();

        var DrawSlash a;
        a : new DrawSlash;
        a.Brush : ka;
        a.Line : this.Demo.SlashLineList.DashDotDot;
        a.Cape : this.Demo.SlashCapeList.Round;
        a.Join : this.Demo.SlashJoinList.Bevel;
        a.Size : this.MathInt(14);
        a.Init();
        return a;
    }

    maide private Bool TextSlashFinal(var DrawSlash a)
    {
        var DrawBrush ka;
        ka : a.Brush;

        a.Final();

        ka.Final();
        return true;
    }

    maide private DrawBrush EllipseBrushCreate()
    {
        var DrawBrush a;
        a : new DrawBrush;
        a.Kind : this.Demo.BrushKindList.Color;
        a.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0, 0hff, 0hff);
        a.Init();
        return a;
    }

    maide private Bool EllipseBrushFinal(var DrawBrush a)
    {
        a.Final();
        return true;
    }

    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate Button Button { get { return data; } set { data : value; } }
    field prusate Mark Mark { get { return data; } set { data : value; } }
    field prusate Radio Radio { get { return data; } set { data : value; } }
    field prusate Select Select { get { return data; } set { data : value; } }
    field prusate DrawImage ButtonImage { get { return data; } set { data : value; } }
    field prusate DrawRect EllipseRect { get { return data; } set { data : value; } }
    field prusate DrawBrush EllipseBrush { get { return data; } set { data : value; } }
    field prusate DrawFont Font { get { return data; } set { data : value; } }
    field prusate TextText Text { get { return data; } set { data : value; } }
    field prusate DrawSlash TextSlash { get { return data; } set { data : value; } }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        base.ExecuteDrawThis(draw);

        this.EllipseRect.Pos.Col : this.MathInt(this.Pos.Col + 400);
        this.EllipseRect.Pos.Row : this.MathInt(this.Pos.Row + 20);

        draw.Fill : this.EllipseBrush;

        draw.ExecuteRound(this.EllipseRect);

        draw.Fill : null;

        this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col + 150);
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row + 50);
        this.DrawRectA.Size.Wed : this.MathInt(300);
        this.DrawRectA.Size.Het : this.MathInt(100);

        draw.Font : this.Font;
        draw.Line : this.TextSlash;

        draw.ExecuteText(this.Text, this.Demo.AlignList.Mid, this.Demo.AlignList.Start, false, this.DrawRectA);

        draw.Line : null;
        draw.Font : null;
        return true;
    }

    maide private Bool PolateStopSetPoint(var DrawPolateStop stop, var DrawPolateStopPoint aa, var Int index, var Int pos, var DrawColor color)
    {
        aa.Pos : pos;
        aa.Color : color;
        stop.PointSet(index, aa);
        return true;
    }
}
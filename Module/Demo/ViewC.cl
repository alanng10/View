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
        polate.Spread : this.Demo.PolateSpreadList.Pad;
        polate.Init();

        var DrawBrush;
        brush : new DrawBrush;
        brush.Kind : this.Demo.BrushKindList.Polate;
        brush.Polate : polate;
        brush.Init();

        var String oa;
        oa : "G L 的哈gd@行 o #";

        var Text text;
        text : this.Demo.TextCreate(oa);

        this.Pos.Col : 0sn300;
        this.Pos.Row : 0;
        this.Size.Wed : 500;
        this.Size.Het : 400;
        this.Back : brush;
        this.EllipseBrush : this.EllipseBrushCreate();
        this.EllipseRect : this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(100), this.MathInt(50));
        this.Font : this.FontCreate();
        this.Text : text;
        this.TextSlash : this.TextSlashCreate();
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
}
namespace Demo;

class ViewC : ViewView
{
    public override bool Init()
    {
        base.Init();
        this.Rect = this.Demo.DrawInfra.RectCreate(0, 0, 0, 0);

        DrawPolateLinear polateLinear;
        polateLinear = new DrawPolateLinear();
        polateLinear.StartPos = this.Demo.DrawInfra.PosCreate(this.MathInt(300), 0);
        polateLinear.EndPos = this.Demo.DrawInfra.PosCreate(this.MathInt(300), this.MathInt(400));
        polateLinear.Init();

        DrawPolateStop polateStop;
        polateStop = new DrawPolateStop();
        polateStop.Count = 3;
        polateStop.Init();

        DrawPolateStopPoint aa;
        aa = new DrawPolateStopPoint();
        aa.Init();

        this.PolateStopSetPoint(polateStop, aa, 0, 0, this.Demo.DrawInfra.ColorCreate(0xff, 0xff, 0, 0));
        this.PolateStopSetPoint(polateStop, aa, 1, this.MathValue(1, -1), this.Demo.DrawInfra.ColorCreate(0xff, 0, 0xff, 0));
        this.PolateStopSetPoint(polateStop, aa, 2, this.MathInt(1), this.Demo.DrawInfra.ColorCreate(0xff, 0, 0, 0xff));

        DrawPolate polate;
        polate = new DrawPolate();
        polate.Kind = this.Demo.PolateKindList.Linear;
        polate.Linear = polateLinear;
        polate.Stop = polateStop;
        polate.Spread = this.Demo.PolateSpreadList.Pad;
        polate.Init();

        DrawBrush brush;
        brush = new DrawBrush();
        brush.Kind = this.Demo.BrushKindList.Polate;
        brush.Polate = polate;
        brush.Init();

        String oa;
        oa = this.S("G L 的哈gd@行 o #");

        Text text;
        text = this.Demo.TextCreate(oa);

        this.Pos.Col = -300;
        this.Pos.Row = 0;
        this.Size.Wed = 500;
        this.Size.Het = 400;
        this.Back = brush;
        this.EllipseBrush = this.EllipseBrushCreate();
        this.EllipseRect = this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(100), this.MathInt(50));
        this.Font = this.FontCreate();
        this.Text = text;
        this.TextPen = this.TextSlashCreate();
        return true;
    }

    public virtual bool Final()
    {
        DrawSlash textPen;
        textPen = this.TextPen;
        DrawBrush ellipseBrush;
        ellipseBrush = this.EllipseBrush;
        DrawBrush brush;
        brush = this.Back;
        DrawPolate polate;
        polate = brush.Polate;
        DrawPolateStop polateStop;
        polateStop = polate.Stop;
        DrawPolateLinear polateLinear;
        polateLinear = polate.Linear;

        this.TextSlashFinal(textPen);

        this.FontFinal(this.Font);

        this.EllipseBrushFinal(ellipseBrush);

        brush.Final();

        polate.Final();

        polateStop.Final();

        polateLinear.Final();
        return true;
    }

    private DrawFont FontCreate()
    {
        DrawFont a;
        a = new DrawFont();
        a.Name = this.Demo.DrawInfra.FontMonoName;
        a.Size = 20;
        a.Strong = 400;
        a.Tenden = true;
        a.Staline = true;
        a.Midline = true;
        a.Endline = true;
        a.Init();
        return a;
    }

    private bool FontFinal(DrawFont a)
    {
        a.Final();
        return true;
    }

    private DrawSlash TextSlashCreate()
    {
        DrawBrush ka;
        ka = new DrawBrush();
        ka.Kind = this.Demo.BrushKindList.Color;
        ka.Color = this.Demo.DrawInfra.ColorCreate(0xff, 0, 0, 0xff);
        ka.Init();

        DrawSlash a;
        a = new DrawSlash();
        a.Brush = ka;
        a.Line = this.Demo.SlashLineList.DashDotDot;
        a.Size = this.MathInt(14);
        a.Cape = this.Demo.SlashCapList.Round;
        a.Join = this.Demo.SlashJoinList.Bevel;
        a.Init();
        return a;
    }

    private bool TextSlashFinal(DrawSlash a)
    {
        DrawBrush ka;
        ka = a.Brush;

        a.Final();

        ka.Final();
        return true;
    }

    private DrawBrush EllipseBrushCreate()
    {
        DrawBrush a;
        a = new DrawBrush();
        a.Kind = this.Demo.BrushKindList.Color;
        a.Color = this.Demo.DrawInfra.ColorCreate(0xff, 0, 0xff, 0xff);
        a.Init();
        return a;
    }

    private bool EllipseBrushFinal(DrawBrush a)
    {
        a.Final();
        return true;
    }

    public virtual Demo Demo { get; set; }
    public DrawRect EllipseRect { get; set; }
    public DrawBrush EllipseBrush { get; set; }
    public DrawFont Font { get; set; }
    public Text Text { get; set; }
    public DrawSlash TextPen { get; set; }
    private DrawRect Rect { get; set; }

    protected override bool ExecuteDrawThis(DrawDraw draw)
    {
        base.ExecuteDrawThis(draw);
        this.EllipseRect.Pos.Col = this.MathInt(this.Pos.Col + 400);
        this.EllipseRect.Pos.Row = this.MathInt(this.Pos.Row + 20);
        
        draw.Fill = this.EllipseBrush;

        draw.ExecuteRound(this.EllipseRect);

        draw.Fill = null;

        DrawRect rect;
        rect = this.Rect;
        rect.Pos.Col = this.MathInt(this.Pos.Col + 150);
        rect.Pos.Row = this.MathInt(this.Pos.Row + 50);
        rect.Size.Wed = this.MathInt(300);
        rect.Size.Het = this.MathInt(100);

        draw.Font = this.Font;
        draw.Line = this.TextPen;

        draw.ExecuteText(this.Text, this.Demo.AlignList.Mid, this.Demo.AlignList.Start, false, rect);

        draw.Line = null;
        draw.Font = null;
        return true;
    }

    private bool PolateStopSetPoint(DrawPolateStop stop, DrawPolateStopPoint aa, long index, long pos, DrawColor color)
    {
        aa.Pos = pos;
        aa.Color = color;
        stop.PointSet(index, aa);
        return true;
    }
}
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

        DrawBrush ellipseBrush;
        ellipseBrush = this.EllipseBrushCreate();

        DrawFont font;
        font = this.FontCreate();

        DrawSlash textPen;
        textPen = this.TextPenCreate();

        String oa;
        oa = this.S("G L 的哈gd@行 o #");

        Text text;
        text = this.Demo.TextCreate(oa);

        this.Pos.Col = -300;
        this.Pos.Row = 0;
        this.Size.Wed = 500;
        this.Size.Het = 400;
        this.Back = brush;
        this.EllipseBrush = ellipseBrush;
        this.EllipseRect = this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(100), this.MathInt(50));
        this.Font = font;
        this.Text = text;
        this.TextPen = textPen;
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
}
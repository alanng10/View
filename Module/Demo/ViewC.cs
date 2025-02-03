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

        this.PolateStopSetPoint(polateStop, aa, 0, 0, this.DrawInfra.ColorCreate(0xff, 0xff, 0, 0));
        this.PolateStopSetPoint(polateStop, aa, 1, this.MathValue(1, -1), this.DrawInfra.ColorCreate(0xff, 0, 0xff, 0));
        this.PolateStopSetPoint(polateStop, aa, 2, this.MathInt(1), this.DrawInfra.ColorCreate(0xff, 0, 0, 0xff));

        DrawPolate polate;
        polate = new DrawPolate();
        polate.Kind = this.Demo.PolateKindList.Linear;
        polate.Linear = polateLinear;
        polate.Stop = polateStop;
        polate.Spread = this.Demo.PolateSpreadList.Pad;
        polate.Init();

        DrawBrush brush;
        brush = new DrawBrush();
        brush.Kind = this.BrushKindList.Polate;
        brush.Polate = polate;
        brush.Init();

        DrawBrush ellipseBrush;
        ellipseBrush = this.EllipseBrushCreate();

        DrawFace face;
        face = this.FaceCreate();

        DrawSlash textPen;
        textPen = this.TextPenCreate();

        DrawTextAlign align;
        align = new DrawTextAlign();
        align.Init();
        align.Horiz = 2;
        align.Vert = 1;

        String oa;
        oa = this.S("G L 的哈gd@行 o #");

        Text text;
        text = this.TextInfra.TextCreateStringData(oa, null);

        ViewC viewC;
        viewC = new ViewC();
        viewC.Init();
        viewC.Pos.Col = -300;
        viewC.Pos.Row = 0;
        viewC.Size.Wed = 500;
        viewC.Size.Het = 400;
        viewC.Back = brush;
        viewC.EllipseBrush = ellipseBrush;
        viewC.EllipseRect = this.DrawInfra.RectCreate(0, 0, this.MathInt(100), this.MathInt(50));
        viewC.Face = face;
        viewC.Text = text;
        viewC.TextAlign = align;
        viewC.TextPen = textPen;
        return true;
    }

    public virtual Demo Demo { get; set; }
    public DrawRect EllipseRect { get; set; }
    public DrawBrush EllipseBrush { get; set; }
    public DrawFace Face { get; set; }
    public DrawTextAlign TextAlign { get; set; }
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

        draw.Font = this.Face;
        draw.Line = this.TextPen;

        draw.ExecuteText(this.Text, this.TextAlign, false, rect);

        draw.Line = null;
        draw.Font = null;
        return true;
    }
}
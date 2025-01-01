namespace Demo;

class ViewC : ViewView
{
    public override bool Init()
    {
        base.Init();
        this.Rect = this.DrawInfra.RectCreate(0, 0, 0, 0);
        return true;
    }

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
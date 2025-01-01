namespace Demo;

class ViewA : ViewView
{
    public virtual DrawSlash DrawPen { get; set; }
    public virtual Demo Demo { get; set; }
    public virtual DrawForm Form { get; set; }
    public virtual long RotateValue { get; set; }

    protected override bool ExecuteDrawThis(DrawDraw draw)
    {
        long left;
        left = this.Pos.Col;
        long up;
        up = this.Pos.Row;
        long wed;
        wed = this.Size.Wed;
        long het;
        het = this.Size.Het;

        DrawRect rect;
        rect = this.DrawRectA;
        rect.Pos.Col = this.MathInt(left);
        rect.Pos.Row = this.MathInt(up);
        rect.Size.Wed = this.MathInt(wed);
        rect.Size.Het = this.MathInt(het);

        DrawBrush brush;
        brush = this.Back;
        draw.Fill = brush;
        DrawSlash pen;
        pen = this.DrawPen;
        draw.Line = pen;

        draw.FillPos.Col = this.MathInt(left);
        draw.FillPos.Row = this.MathInt(up);
        draw.FillPosSet();
        
        draw.ExecuteRectRound(rect, this.MathInt(40), this.MathInt(30));

        DrawImage playImage;
        playImage = this.Demo.PlayImage;

        rect.Pos.Col = 0;
        rect.Pos.Row = 0;

        DrawRect rectB;
        rectB = this.DrawRectB;
        rectB.Pos.Col = 0;
        rectB.Pos.Row = 0;
        rectB.Size.Wed = this.MathInt(playImage.Size.Wed);
        rectB.Size.Het = this.MathInt(playImage.Size.Het);

        long ooa;
        ooa = this.MathInt(left);

        long oob;
        oob = this.MathInt(up);

        long oa;
        oa = this.RotateValue * 10;
        long ob;
        ob = oa / 360;
        ob = ob * 360;
        oa = oa - ob;

        long angle;
        angle = this.MathInt(oa);

        this.Form.Reset();

        this.Form.Pos(ooa, oob);

        this.Form.Angle(angle);

        draw.Form = this.Form;
        draw.FormSet();

        draw.ExecuteVideo(playImage, rect, rectB);

        draw.Form = null;
        draw.FormSet();
        
        draw.Fill = null;

        draw.Line = null;
        return true;
    }
}
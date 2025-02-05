namespace Demo;

class ViewA : ViewView
{
    public override bool Init()
    {
        base.Init();
        DrawBrush brushA;
        brushA = new DrawBrush();
        brushA.Kind = this.Demo.BrushKindList.Color;
        brushA.Color = this.Demo.DrawInfra.ColorCreate(0xff, 0, 0, 0xff);
        brushA.Init();

        DrawBrush slashBrush;
        slashBrush = new DrawBrush();
        slashBrush.Kind = this.Demo.BrushKindList.Color;
        slashBrush.Color = this.Demo.DrawInfra.ColorCreate(0xff, 0xff, 0, 0xff);
        slashBrush.Init();

        DrawSlash slash;
        slash = new DrawSlash();
        slash.Brush = slashBrush;
        slash.Line = this.Demo.SlashLineList.DashDotDot;
        slash.Size = this.Demo.MathInt(11);
        slash.Cape = this.Demo.SlashCapeList.Round;
        slash.Join = this.Demo.SlashJoinList.Bevel;
        slash.Init();

        DrawForm form;
        form = new DrawForm();
        form.Init();

        this.Pos.Col = 0;
        this.Pos.Row = 0;
        this.Size.Wed = 600;
        this.Size.Het = 400;
        this.Back = brushA;
        this.DrawSlash = slash;
        this.Form = form;
        return true;
    }

    public virtual bool Final()
    {
        this.Form.Final();

        DrawBrush k;
        k = this.DrawSlash.Brush;

        this.DrawSlash.Final();

        k.Final();

        this.Back.Final();
        return true;
    }

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

        draw.ExecuteImage(playImage, rect, rectB);

        draw.Form = null;
        draw.FormSet();
        
        draw.Fill = null;

        draw.Line = null;
        return true;
    }
}
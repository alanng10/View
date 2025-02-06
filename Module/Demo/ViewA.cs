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
        slash.Cape = this.Demo.SlashCapeList.Round;
        slash.Join = this.Demo.SlashJoinList.Bevel;
        slash.Size = this.Demo.MathInt(11);
        slash.Init();

        DrawForm form;
        form = new DrawForm();
        form.Init();

        this.Pos.Col = 0;
        this.Pos.Row = 0;
        this.Size.Wed = 600;
        this.Size.Het = 400;
        this.Back = brushA;
        this.Slash = slash;
        this.Form = form;
        return true;
    }

    public virtual bool Final()
    {
        this.Form.Final();

        DrawBrush k;
        k = this.Slash.Brush;

        this.Slash.Final();

        k.Final();

        this.Back.Final();
        return true;
    }

    public virtual Demo Demo { get; set; }
    public virtual DrawSlash Slash { get; set; }
    public virtual DrawForm Form { get; set; }
    public virtual long RotateValue { get; set; }

    protected override bool ExecuteDrawThis(DrawDraw draw)
    {
        long col;
        col = this.Pos.Col;
        long row;
        row = this.Pos.Row;
        long wed;
        wed = this.Size.Wed;
        long het;
        het = this.Size.Het;

        this.DrawRectA.Pos.Col = this.MathInt(col);
        this.DrawRectA.Pos.Row = this.MathInt(row);
        this.DrawRectA.Size.Wed = this.MathInt(wed);
        this.DrawRectA.Size.Het = this.MathInt(het);

        draw.Fill = this.Back;
        draw.Line = this.Slash;

        draw.FillPos.Col = this.MathInt(col);
        draw.FillPos.Row = this.MathInt(row);
        draw.FillPosSet();
        
        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(40), this.MathInt(30));

        this.DrawRectA.Pos.Col = 0;
        this.DrawRectA.Pos.Row = 0;

        this.DrawRectB.Pos.Col = 0;
        this.DrawRectB.Pos.Row = 0;
        this.DrawRectB.Size.Wed = this.MathInt(this.Demo.PlayImage.Size.Wed);
        this.DrawRectB.Size.Het = this.MathInt(this.Demo.PlayImage.Size.Het);

        long ooa;
        ooa = this.MathInt(col);

        long oob;
        oob = this.MathInt(row);

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

        draw.ExecuteImage(this.Demo.PlayImage, this.DrawRectA, this.DrawRectB);

        draw.Form = null;
        draw.FormSet();

        draw.Line = null;
        draw.Fill = null;
        return true;
    }
}
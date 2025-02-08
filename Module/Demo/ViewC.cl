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
    }
}
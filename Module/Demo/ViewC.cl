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
    }
}
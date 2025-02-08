class ViewB : View
{
    maide prusate Bool Init()
    {
        base.Init();
        var Int wed;
        var Int het;
        wed : 400;
        het : 200;

        var DrawRect sourceRect;
        sourceRect : this.Demo.DrawInfra.RectCreate(this.MathInt(1880), this.MathInt(910), this.MathInt(wed), this.MathInt(het));

        var DrawRect destRectA;
        destRectA : this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        var DrawRect sourceRectA;
        sourceRectA : this.Demo.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));
    }
}
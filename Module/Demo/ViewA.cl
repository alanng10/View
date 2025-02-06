class ViewA : View
{
    maide prusate Bool Init()
    {
        base.Init();
        var DrawBrush brushA;
        brushA : new DrawBrush;
        brushA.Kind : this.Demo.BrushKindList.Color;
        brushA.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0, 0, 0hff);
        brushA.Init();
    }
}
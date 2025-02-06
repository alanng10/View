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

        var DrawBrush slashBrush;
        slashBrush : new DrawBrush;
        slashBrush.Kind : this.Demo.BrushKindList.Color;
        slashBrush.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0hff, 0, 0hff);
        slashBrush.Init();

        var DrawSlash slash;
        slash : new DrawSlash;
        slash.Brush : slashBrush;
        slash.Line : this.Demo.SlashLineList.SlashDotDot;
        slash.Cape : this.Demo.SlashCapeList.Round;
        slash.Join : this.Demo.SlashJoinList.Bevel;
        slash.Size : this.Demo.MathInt(11);
        slash.Init();

        var DrawForm form;
        form : new DrawForm;
        form.Init();

        this.Pos.Col : 0;
        this.Pos.Row : 0;
        this.Size.Wed : 600;
        this.Size.Het : 400;
        this.Back : brushA;
        this.Slash : slash;
        this.Form : form;
        return true;
    }

    maide prusate Bool Final()
    {
        this.Form.Final();

        var DrawBrush k;
        k : this.Slash.Brush;

        this.Slash.Final();

        k.Final();

        this.Back.Final();
        return true;
    }
}
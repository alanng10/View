class Demo : ClassBase
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;
        this.Math : share Math;
        this.BrushKindList : share DrawBrushKindList;
        this.SlashLineList : share DrawSlashLineList;
        this.SlashCapeList : share DrawSlashCapeList;
        this.SlashJoinList : share DrawSlashJoinList;
        this.Console : share Console;
        return true;
    }

    
}
class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.StorageStatusList : share StorageStatusList;
        this.BrushInfra : share BrushInfra;
        this.BrushKindList : share BrushKindList;
        this.SlashLineList : share SlashLineList;
    }
}
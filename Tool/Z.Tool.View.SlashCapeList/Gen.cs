namespace Z.Tool.View.SlashCapeList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("View.Draw");
        this.ClassName = this.S("SlashCapeList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("SlashCape");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.StatItemClassName = this.S("SlashCape");
        this.ItemListFileName = this.GetStatItemListFileName();
        return true;
    }
}
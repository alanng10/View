namespace Z.Infra.StatItemListSourceGen;

public class Gen : SourceGen
{
    protected override String GetOutputFilePath()
    {
        return this.AddClear().AddS("../../Module/").Add(this.Module).Add(this.TextInfra.PathCombine).Add(this.ClassName).AddS(".cl").AddResult();
    }

    protected override String GetStatItemListFileName()
    {
        return this.AddClear().AddS("../../../Class/Out/net8.0/ToolData/Infra/ItemList").Add(this.StatItemClassName).AddS(".txt").AddResult();
    }
}
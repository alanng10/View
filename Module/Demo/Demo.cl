class Demo : ClassBase
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;
        this.Math : share Math;
        this.Console : share Console;
        this.BrushKindList : share DrawBrushKindList;
        this.SlashLineList : share DrawSlashLineList;
        this.SlashCapeList : share DrawSlashCapeList;
        this.SlashJoinList : share DrawSlashJoinList;
        return true;
    }

    field prusate Frame Frame { get { return data; } set { data : value; } }
    field prusate View View { get { return data; } set { data : value; } }
    field prusate ViewA ViewA { get { return data; } set { data : value; } }
    field prusate ViewC ViewC { get { return data; } set { data : value; } }
    field prusate DrawRect UpdateRect { get { return data; } set { data : value; } }
    field prusate DrawImage ThreadDrawImage { get { return data; } set { data : value; } }
    field prusate Play Play { get { return data; } set { data : value; } }
    field prusate DrawImage PlayImage { get { return data; } set { data : value; } }
    field prusate MathInfra MathInfra { get { return data; } set { data : value; } }
    field prusate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field prusate Math Math { get { return data; } set { data : value; } }
    field prusate Console Console { get { return data; } set { data : value; } }
    field prusate DrawBrushKindList BrushKindList { get { return data; } set { data : value; } }
    field prusate DrawSlashLineList SlashLineList { get { return data; } set { data : value; } }
    field prusate DrawSlashCapeList SlashCapeList { get { return data; } set { data : value; } }
    field prusate DrawSlashJoinList SlashJoinList { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field private Stream MediaStream { get { return data; } set { data : value; } }
}
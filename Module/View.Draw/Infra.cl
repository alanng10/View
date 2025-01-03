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
        this.SlashCapeList : share SlashCapeList;
        this.SlashJoinList : share SlashJoinList;

        this.PixelByteCount : 4;

        this.ColorCompMax : 255;

        var Color blackColor;
        blackColor : this.ColorCreate(this.ColorCompMax, 0, 0, 0);

        var Color whiteColor;
        whiteColor : this.ColorCreate(this.ColorCompMax, this.ColorCompMax, this.ColorCompMax, this.ColorCompMax);

        var Color zeroColor;
        zeroColor : this.ColorCreate(0, 0, 0, 0);

        var MathComp ka;
        ka : new MathComp;
        ka.Init();

        var Int k;
        k : this.MathInfra.Int(ka, 1);

        this.BlackSlash : this.SlashCreate(blackColor, k);
        this.WhiteSlash : this.SlashCreate(whiteColor, k);
        this.ZeroSlash : this.SlashCreate(zeroColor, k);

        this.FontAriaName : "Segoe UI Variable";
        this.FontMonoName : "Cascadia Mono";
        return true;
    }

    field prusate Int PixelByteCount { get { return data; } set { data : value; } }
    field prusate Int ColorCompMax { get { return data; } set { data : value; } }
    field prusate Slash BlackSlash { get { return data; } set { data : value; } }
    field prusate Slash WhiteSlash { get { return data; } set { data : value; } }
    field prusate Slash ZeroSlash { get { return data; } set { data : value; } }
    field prusate String FontAriaName { get { return data; } set { data : value; } }
    field prusate String FontMonoName { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate StorageStatusList StorageStatusList { get { return data; } set { data : value; } }
    field precate BrushKindList BrushKindList { get { return data; } set { data : value; } }
    field precate SlashLineList SlashLineList { get { return data; } set { data : value; } }
    field precate SlashCapeList SlashCapeList { get { return data; } set { data : value; } }
    field precate SlashJoinList SlashJoinList { get { return data; } set { data : value; } }
    field private BrushInfra BrushInfra { get { return data; } set { data : value; } }

    maide prusate Color ColorCreate(var Int alpha, var Int red, var Int green, var Int blue)
    {
        var Color a;
        a : new Color;
        a.Init();
        a.Alpha : alpha;
        a.Red : red;
        a.Green : green;
        a.Blue : blue;
        return a;
    }

    maide private Slash SlashCreate(var Color color, var Int size)
    {
        var Brush ka;
        ka : new Brush;
        ka.Kind : this.BrushKindList.Color;
        ka.Color : color;
        ka.Init();

        var Slash a;
        a : new Slash;
        a.Brush : ka;
        a.Line : this.SlashLineList.Solid;
        a.Size : size;
        a.Cape : this.SlashCapeList.Plane;
        a.Join : this.SlashJoinList.Miter;
        a.Init();
        return a;
    }
}
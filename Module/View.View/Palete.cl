class Palete : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;
        this.Math : share Math;

        this.MathComp : this.CreateMathComp();

        this.DrawChrome : this.CreateDrawChrome();

        this.Group : this.CreatePaleteGroup();

        this.InitColor();
        return true;
    }

    maide precate MathComp CreateMathComp()
    {
        var MathComp a;
        a : new MathComp;
        a.Init();
        return a;
    }

    maide precate DrawChrome CreateDrawChrome()
    {
        var DrawChrome a;
        a : new DrawChrome;
        a.Init();
        return a;
    }

    maide precate PaleteGroup CreatePaleteGroup()
    {
        var PaleteGroup a;
        a : new PaleteGroup;
        a.Init();
        return a;
    }

    field prusate DrawColor Color { get { return data; } set { data : value; } }
    field prusate PaleteGroup Group { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate Math Math { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field precate DrawChrome DrawChrome { get { return data; } set { data : value; } }

    maide precate Bool InitColor()
    {
        this.Group.Base : this.DrawInfra.SlashWhite.Brush.Color;
        this.Group.Back : this.DrawInfra.ColorCreate(0hff, 210, 210, 210);
        this.Group.Fore : this.DrawInfra.SlashBlack.Brush.Color;
        this.Group.Lite : this.Color;
        return true;
    }
}
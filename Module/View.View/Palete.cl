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

    field prusate DrawColor Color { get { return data; } set { data : value; } }
    field prusate PaleteGroup Active { get { return data; } set { data : value; } }
    field prusate PaleteGroup Untive { get { return data; } set { data : value; } }
    field prusate PaleteGroup Unable { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate Math Math { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field precate DrawChrome DrawChrome { get { return data; } set { data : value; } }

    maide precate Bool InitColor()
    {
        this.DrawInfra.ChromeColor(this.MathComp, this.DrawChrome, this.Color);

        var DrawColor whiteColor;
        var DrawColor blackColor;
        var DrawColor baseColor;
        var DrawColor foreColor;
        var DrawColor buttonColor;
        var DrawColor buttonColorDark;
        var DrawColor buttonColorDark150;
        var DrawColor buttonColorLite150;

        whiteColor : this.DrawInfra.WhiteSlash.Brush.Color;
        blackColor : this.DrawInfra.BlackSlash.Brush.Color;

        var Int ka;
        ka : this.MathInfra.Value(this.MathComp, 1, 0sn1);

        var Bool ba;
        ba : this.Math.Less(ka, this.DrawChrome.Value);

        inf (ba)
        {
            baseColor : whiteColor;
            foreColor : blackColor;
        }

        inf (~ba)
        {
            baseColor : blackColor;
            foreColor : whiteColor;
        }

        buttonColor : this.Color;

        ka : this.DrawInfra.ChromeValueDarkPercent(200);
        
        buttonColorDark : this.ColorCreateValue(this.Color.Alpha, this.DrawChrome, ka);

        ka : this.DrawInfra.ChromeValueDarkPercent(150);

        buttonColorDark150 : this.ColorCreateValue(this.Color.Alpha, this.DrawChrome, ka);

        ka : 150;

        buttonColorLite150 : this.ColorCreateValue(this.Color.Alpha, this.DrawChrome, ka);
    }

    maide precate DrawColor ColorCreateValue(var Int alpha, var DrawChrome chrome, var Int valuePercent)
    {
        var Int kf;
        kf : chrome.Value;

        var Int ka;
        ka : this.DrawInfra.ChromeValuePercent(this.MathComp, kf, valuePercent);

        chrome.Value : ka;

        var DrawColor ke;
        ke : this.DrawInfra.ColorCreate(0, 0, 0, 0);

        this.DrawInfra.ColorChrome(this.MathComp, ke, chrome);

        chrome.Value : kf;

        ke.Alpha : alpha;

        var DrawColor a;
        a : ke;
        return a;
    }
}
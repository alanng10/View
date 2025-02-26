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

        this.Active : this.CreatePaleteGroup();
        this.Untive : this.CreatePaleteGroup();
        this.Unable : this.CreatePaleteGroup();

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

    maide precate Bool GroupColorSet(
        var PaleteGroup group, var DrawColor frameText, var DrawColor button,
        var DrawColor lite, var DrawColor dark, var DrawColor mid,
        var DrawColor text, var DrawColor liteText, var DrawColor varBase, 
        var DrawColor frame
    )
    {
        var DrawColor alterBase;
        var DrawColor midLite;
        var DrawColor tipBase;
        var DrawColor tipText;

        alterBase : this.DrawInfra.ColorCreate(0, 0, 0, 0);
        this.DrawInfra.ColorMix(alterBase, varBase, button);

        midLite : this.DrawInfra.ColorCreate(0, 0, 0, 0);
        this.DrawInfra.ColorMix(midLite, button, lite);

        tipBase : this.DrawInfra.ColorCreate(0hff, 255, 255, 220);
        tipText : this.DrawInfra.BlackSlash.Brush.Color;

        this.GroupSet(group, frameText, button, lite, dark, mid, text, liteText, varBase,
                  alterBase, frame, midLite, text,
                  this.DrawInfra.SlashBlack.Brush.Color, this.DrawInfra.ColorDarkBlue, this.DrawInfra.SlashWhite.Brush.Color,
                  this.DrawInfra.ColorBlue, this.DrawInfra.ColorMagenta, tipBase,
                  tipText);
        return true;
    }

    maide precate Bool GroupSet(
        var PaleteGroup group, var DrawColor fore, var DrawColor button, 
        var DrawColor lite, var DrawColor dark, var DrawColor mid, 
        var DrawColor text, var DrawColor liteText, 
        var DrawColor varBase, var DrawColor alterBase, 
        var DrawColor back, var DrawColor midLite, 
        var DrawColor buttonText, var DrawColor shade, 
        var DrawColor highLite, var DrawColor highLiteText, 
        var DrawColor link, var DrawColor linkVisit, 
        var DrawColor tipBase, var DrawColor tipText 
    )
    {
        group.FrameText : fore;
        group.Button : button;
        group.Lite : lite;
        group.Dark : dark;
        group.Mid : mid;
        group.Text : text;
        group.LiteText : liteText;
        group.Base : varBase;
        group.AlterBase : alterBase;
        group.Frame : back;
        group.MidLite : midLite;
        group.ButtonText : buttonText;
        group.Shade : shade;
        group.HighLite : highLite;
        group.HighLiteText : highLiteText;
        group.Link : link;
        group.LinkVisit : linkVisit;
        group.TipBase : tipBase;
        group.TipText : tipText;

        return true;
    }

    maide precate DrawColor ColorCreateValue(var Int alpha, var DrawChrome chrome, var Int valuePercent)
    {
        var Int kc
        var Int kd;
        kc : chrome.Alpha;
        kd : chrome.Value;

        this.DrawInfra.ChromeValueLite(this.MathComp, chrome, valuePercent);

        var DrawColor ke;
        ke : this.DrawInfra.ColorCreate(0, 0, 0, 0);

        this.DrawInfra.ColorChrome(this.MathComp, ke, chrome);

        chrome.Alpha : kc;
        chrome.Value : kd;

        ke.Alpha : alpha;

        var DrawColor a;
        a : ke;
        return a;
    }
}
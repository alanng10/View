class Palete : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;

        this.MathComp : new MathComp;
        this.MathComp.Init();

        this.Chrome : new DrawChrome;
        this.Chrome.Init();

        this.InitColor();
        return true;
    }

    field prusate DrawColor Color { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field precate DrawChrome Chrome { get { return data; } set { data : value; } }

    maide precate Bool InitColor()
    {
        this.DrawInfra.ChromeColor(this.MathComp, this.Chrome, this.Color);

        var DrawColor whiteColor;
        var DrawColor blackColor;
        var DrawColor baseColor;
        var DrawColor foreColor;
        var DrawColor buttonColor;
        var DrawColor buttonColorDark;
        var DrawColor buttonColorDark150;
        var DrawColor buttonColorLite150;
    }
}
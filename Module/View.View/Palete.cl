class Palete : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;

        this.MathComp : new MathComp;
        this.MathComp.Init();

        this.Chrome : new DrawChrome;
        this.Chrome.Init();
        return true;
    }

    field prusate DrawColor Color { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field precate DrawChrome Chrome { get { return data; } set { data : value; } }
}
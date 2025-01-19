class Comp : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.Math : share Math;

        this.MathComp : this.CreateMathComp();
        this.ModEvent : this.CreateModEvent();
        this.ModArg : this.CreateModArg();
        return true;
    }

    field prusate Event ModEvent { get { return data; } set { data : value; } }
    field prusate Mod ModArg { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate Math Math { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }

    maide precate MathComp CreateMathComp()
    {
        var MathComp a;
        a : new MathComp;
        a.Init();
        return a;
    }
}
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

    maide precate Event CreateModEvent()
    {
        var Event a;
        a : new Event;
        a.Init();
        return a;
    }

    maide precate Mod CreateModArg()
    {
        var Mod a;
        a : new Mod;
        a.Init();
        return a;
    }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        return true;
    }

    maide precate Bool Event(var Field varField)
    {
        this.ModArg.Comp : this;
        this.ModArg.Field : varField;
        this.ModEvent.Execute(this.ModArg);
        this.ModArg.Field : null;
        this.ModArg.Comp : null;
        return true;
    }
}
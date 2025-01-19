namespace View.Infra;

public class Comp : Any
{
    public override bool Init()
    {
        base.Init();
        this.MathInfra = MathInfra.This;
        this.Math = MathMath.This;

        this.MathComp = this.CreateMathComp();
        this.ModEvent = this.CreateModEvent();
        this.ModArg = this.CreateModArg();
        return true;
    }

    public virtual Event ModEvent { get; set; }
    public virtual Mod ModArg { get; set; }
    protected virtual MathInfra MathInfra { get; set; }
    protected virtual MathMath Math { get; set; }
    protected virtual MathComp MathComp { get; set; }

    protected virtual MathComp CreateMathComp()
    {
        MathComp a;
        a = new MathComp();
        a.Init();
        return a;
    }

    protected virtual Event CreateModEvent()
    {
        Event a;
        a = new Event();
        a.Init();
        return a;
    }

    protected virtual Mod CreateModArg()
    {
        Mod a;
        a = new Mod();
        a.Init();
        return a;
    }

    public virtual bool Mod(Field varField, Mod mod)
    {
        return true;
    }

    protected virtual bool Event(Field varField)
    {
        this.ModArg.Comp = this;
        this.ModArg.Field = varField;
        this.ModEvent.Execute(this.ModArg);
        this.ModArg.Field = null;
        this.ModArg.Comp = null;
        return true;
    }

    protected virtual long MathInt(long n)
    {
        long a;
        a = this.MathInfra.Int(this.MathComp, n);
        return a;
    }

    protected virtual long MathValue(long cand, long expo)
    {
        this.MathComp.Cand = cand;
        this.MathComp.Expo = expo;

        long a;
        a = this.Math.Value(this.MathComp);
        return a;
    }
}
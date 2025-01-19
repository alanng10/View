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
}
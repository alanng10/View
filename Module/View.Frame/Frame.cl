class Frame : Any
{
    maide private Bool PrivateTypeEvent(var Int index, var Int value)
    {
        var Bool b;
        b : ~(value = 0);

        var Int indexK;
        indexK : this.InternInfra.TypeIndexFromInternIndex(index);

        this.TypeEvent(indexK, b);
        return true;
    }

    maide private Bool PrivateDrawEvent()
    {
        this.DrawEvent();
        return true;
    }

    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;
        this.MathInfra : share MathInfra;
        this.TextInfra : share TextInfra;
        this.DrawInfra : share DrawInfra;
        this.Math : share Math;
    }
}
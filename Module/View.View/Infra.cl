class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        return true;
    }

    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }

    maide prusate Field FieldCreate(var Comp comp)
    {
        var Field a;
        a : new Field;
        a.Init();
        a.Comp : comp;
        return a;
    }

    maide prusate Bool AssignDrawRectValue(var DrawRect dest, var DrawRect source)
    {
        this.AssignDrawPosValue(dest.Pos, source.Pos);
        this.AssignDrawSizeValue(dest.Size, source.Size);
        return true;
    }

    maide prusate Bool AssignDrawPosValue(var DrawPos dest, var DrawPos source)
    {
        dest.Col : source.Col;
        dest.Row : source.Row;
        return true;
    }

    maide prusate Bool AssignDrawSizeValue(var DrawSize dest, var DrawSize source)
    {
        dest.Wed : source.Wed;
        dest.Het : source.Het;
        return true;
    }
}
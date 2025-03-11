class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;

        this.PaleteDefault : this.CreatePaleteDefault();
        return true;
    }

    maide precate Palete CreatePaleteDefault()
    {
        var Palete a;
        a : new Palete;
        a.Init();
        a.Base : this.DrawInfra.SlashWhite.Brush.Color;
        a.Back : this.DrawInfra.ColorCreate(0hff, 210, 210, 210);
        a.Fore : this.DrawInfra.SlashBlack.Brush.Color;
        a.Lite : this.DrawInfra.ColorCreate(0hff, 0, 200, 200);
        return a;
    }

    field prusate Palete PaleteDefault { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }

    maide prusate Field FieldCreate(var Comp comp)
    {
        var Field a;
        a : new Field;
        a.Init();
        a.Comp : comp;
        return a;
    }

    maide prusate Count CountCreate(var Int value)
    {
        var Count a;
        a : new Count;
        a.Init();
        a.Value : value;
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

    maide prusate Bool StackPushChild(var Draw draw, var DrawRect stackRect, var DrawPos stackPos, var DrawRect rect, var DrawPos pos)
    {
        this.AssignDrawPosValue(pos, rect.Pos);

        this.DrawInfra.BoundArea(rect, draw.Area);

        this.AssignDrawRectValue(stackRect, draw.Area);

        this.AssignDrawRectValue(draw.Area, rect);

        draw.AreaSet();

        this.AssignDrawPosValue(stackPos, draw.Pos);

        this.AssignDrawPosValue(draw.Pos, pos);

        draw.PosSet();
        return true;
    }

    maide prusate Bool StackPopChild(var Draw draw, var DrawRect stackRect, var DrawPos stackPos)
    {
        this.AssignDrawPosValue(draw.Pos, stackPos);

        draw.PosSet();

        this.AssignDrawRectValue(draw.Area, stackRect);

        draw.AreaSet();
        return true;
    }

    maide prusate Bool PaleteSet(var Palete palete, var DrawColor liteColor)
    {
        palete.Base : this.PaleteDefault.Base;
        palete.Back : this.PaleteDefault.Back;
        palete.Fore : this.PaleteDefault.Fore;
        palete.Lite : liteColor;
        return true;
    }
}
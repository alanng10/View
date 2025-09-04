class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;

        this.PaleteDefault : this.CreatePaleteDefault();
        return true;
    }

    maide precate Palete CreatePaleteDefault()
    {
        var Palete a;
        a : new Palete;
        a.Init();
        a.Base : this.DrawInfra.SlashCreate(this.DrawInfra.BrushCreate(this.DrawInfra.ColorCreate(0hff, 240, 240, 240)), this.DrawInfra.SlashZero.Size);
        a.Back : this.DrawInfra.SlashCreate(this.DrawInfra.BrushCreate(this.DrawInfra.ColorCreate(0hff, 231, 231, 231)), this.DrawInfra.SlashZero.Size);
        a.Bord : this.DrawInfra.SlashCreate(this.DrawInfra.BrushCreate(this.DrawInfra.ColorCreate(0hff, 222, 222, 222)), this.DrawInfra.SlashZero.Size);        
        a.Fore : this.DrawInfra.SlashBlack;
        a.Lite : this.DrawInfra.SlashCreate(this.DrawInfra.BrushCreate(this.DrawInfra.ColorCreate(0hff, 0, 200, 200)), this.DrawInfra.SlashZero.Size);
        a.FontAria : this.DrawInfra.FontCreate(this.DrawInfra.FontAriaName, 10, 400, false, false, false, false);
        a.FontMono : this.DrawInfra.FontCreate(this.DrawInfra.FontMonoName, 10, 400, false, false, false, false);
        a.Form : this.DrawInfra.FormCreate();
        return a;
    }

    field prusate Palete PaleteDefault { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
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
        dest.Width : source.Width;
        dest.Hegth : source.Hegth;
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

    maide prusate Bool PaleteSet(var Palete palete, var DrawSlash lite)
    {
        palete.Base : this.PaleteDefault.Base;
        palete.Back : this.PaleteDefault.Back;
        palete.Fore : this.PaleteDefault.Fore;
        palete.Lite : lite;
        return true;
    }

    maide private DrawPos PosSet(var DrawPos result, var Int col, var Int row)
    {
        result.Col : col;
        result.Row : row;
        return result;
    }

    maide prusate Bool ButtonChildArea(var DrawRect area)
    {
        area.Pos.Col : area.Pos.Col + 14;
        area.Pos.Row : area.Pos.Row + 14;
        area.Size.Width : this.DrawInfra.BoundSub(area.Size.Width, 14 * 2);
        area.Size.Hegth : this.DrawInfra.BoundSub(area.Size.Hegth, 14 * 2);
        return true;
    }

    maide prusate Bool ButtonChildParentSize(var DrawSize size)
    {
        size.Width : size.Width + 14 * 2;
        size.Hegth : size.Hegth + 14 * 2;
        return true;
    }

    maide prusate Bool MarkChildArea(var DrawRect area)
    {
        var Int cubeSize;
        cubeSize : 16;
        
        area.Pos.Col : area.Pos.Col + cubeSize + 6 * 2;
        area.Size.Width : this.DrawInfra.BoundSub(area.Size.Width, cubeSize + 6 * 2);
        return true;
    }

    maide prusate Bool MarkChildParentSize(var DrawSize size)
    {
        var Int cubeSize;
        cubeSize : 16;

        size.Width : size.Width + cubeSize + 6 * 2;
        return true;
    }

    maide prusate Bool RadioChildArea(var DrawRect area)
    {
        var Int roundSize;
        roundSize : 18;
        
        area.Pos.Col : area.Pos.Col + roundSize + 6 * 2;
        area.Size.Width : this.DrawInfra.BoundSub(area.Size.Width, roundSize + 6 * 2);
        return true;
    }

    maide prusate Bool RadioChildParentSize(var DrawSize size)
    {
        var Int roundSize;
        roundSize : 18;

        size.Width : size.Width + roundSize + 6 * 2;
        return true;
    }

    maide prusate Bool SelectChildArea(var DrawRect area)
    {
        var Int radius;
        radius : 6;

        area.Pos.Col : area.Pos.Col + radius;
        area.Pos.Row : area.Pos.Row + radius;
        area.Size.Width : this.DrawInfra.BoundSub(area.Size.Width, radius * 2 + 10 + 6);
        area.Size.Hegth : this.DrawInfra.BoundSub(area.Size.Hegth, radius * 2);
        return true;
    }

    maide prusate Bool SelectChildParentSize(var DrawSize size)
    {
        var Int radius;
        radius : 6;

        size.Width : size.Width + radius * 2 + 10 + 6;
        size.Hegth : size.Hegth + radius * 2;
        return true;
    }
}
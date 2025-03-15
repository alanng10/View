class Button : View
{
    maide prusate Bool Init()
    {
        base.Init();

        this.DrawPosB : this.CreateDrawPos();

        this.FocusField : this.CreateFocusField();
        this.Focus : false;
        return true;
    }

    maide precate DrawBrush CreateBack()
    {
        return this.Palete.Back.Brush;
    }

    maide precate Field CreateFocusField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    field prusate Field FocusField { get { return data; } set { data : value; } }
    field precate DrawPos DrawPosB { get { return data; } set { data : value; } }

    field prusate Bool Focus
    {
        get
        {
            return cast Bool(this.FocusField.GetAny());
        }
        set
        {
            this.FocusField.SetAny(value);
        }
    }

    maide precate Bool ModFocus(var Mod mod)
    {
        this.Event(this.FocusField);
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col);
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row);
        this.DrawRectA.Size.Wed : this.MathInt(this.Size.Wed);
        this.DrawRectA.Size.Het : this.MathInt(this.Size.Het);

        draw.Fill : this.Palete.Bord.Brush;

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(14), this.MathInt(14));

        this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col + 1);
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row + 1);
        this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(this.Size.Wed, 1 * 2));
        this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(this.Size.Het, 1 * 2));

        draw.Fill : this.Back;

        draw.ExecuteRectRound(this.DrawRectA, 
            this.MathInt(this.DrawInfra.BoundSub(14, 1)), 
            this.MathInt(this.DrawInfra.BoundSub(14, 1)));

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;

        inf (this.Focus)
        {
            draw.Line : this.Palete.Lite;

            var Int firstCol;
            var Int firstRow;
            var Int lastCol;
            var Int lastRow;
            firstCol : this.Pos.Col;
            firstRow : this.Pos.Row;
            lastCol : firstCol + this.BoundSub(this.Size.Wed, 1);
            lastRow : firstRow + this.BoundSub(this.Size.Het, 1);

            this.DrawPosA.Col = this.MathInt(firstCol);
            this.DrawPosA.Row = this.MathInt(firstRow);
            this.DrawPosB.Col = this.MathInt(lastCol);
            this.DrawPosB.Row = this.MathInt(firstRow);

            draw.ExecuteLine(this.DrawPosA, this.DrawPosB);

            this.DrawPosA.Col = this.MathInt(firstCol);
            this.DrawPosA.Row = this.MathInt(firstRow);
            this.DrawPosB.Col = this.MathInt(firstCol);
            this.DrawPosB.Row = this.MathInt(lastRow);

            draw.ExecuteLine(this.DrawPosA, this.DrawPosB);

            this.DrawPosA.Col = this.MathInt(lastCol);
            this.DrawPosA.Row = this.MathInt(firstRow);
            this.DrawPosB.Col = this.MathInt(lastCol);
            this.DrawPosB.Row = this.MathInt(lastRow);

            draw.ExecuteLine(this.DrawPosA, this.DrawPosB);

            this.DrawPosA.Col = this.MathInt(firstCol);
            this.DrawPosA.Row = this.MathInt(lastRow);
            this.DrawPosB.Col = this.MathInt(lastCol);
            this.DrawPosB.Row = this.MathInt(lastRow);

            draw.ExecuteLine(this.DrawPosA, this.DrawPosB);

            draw.Line : null;
        }

        return true;
    }

    maide precate Bool SetChildArea(var DrawRect dest, var Draw draw)
    {
        base.SetChildArea(dest, draw);

        this.ViewInfra.ButtonChildArea(dest);
        return true;
    }
}
class Button : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Focus : false;
        return true;
    }

    maide precate DrawBrush CreateBack()
    {
        return this.Palete.Back.Brush;
    }

    field prusate Field FocusField { get { return data; } set { data : value; } }

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
        base.ExecuteDrawThis(draw);

        this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col);
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row);
        this.DrawRectA.Size.Wed : this.MathInt(this.Size.Wed);
        this.DrawRectA.Size.Het : this.MathInt(this.Size.Het);

        draw.Fill : this.Back;

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(6), this.MathInt(6));

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;

        inf (this.Focus)
        {
            this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col);
            this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row);
            this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(this.Size.Wed, 1));
            this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(this.Size.Het, 1));

            draw.Line : this.Palete.Lite;

            draw.ExecuteRectRound(this.DrawRectA, this.MathInt(6), this.MathInt(6));

            draw.Line : null;
        }
        return true;
    }

    maide precate Bool SetChildArea(var DrawRect dest, var Draw draw)
    {
        base.SetChildArea(dest, draw);

        dest.Pos.Col : dest.Pos.Col + 6;
        dest.Pos.Row : dest.Pos.Row + 6;
        dest.Size.Wed : this.DrawInfra.BoundSub(dest.Size.Wed, 6 * 2);
        dest.Size.Het : this.DrawInfra.BoundSub(dest.Size.Het, 6 * 2);
        return true;
    }
}
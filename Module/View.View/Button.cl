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
            this.DrawRectA.Size.Wed : this.Math.Sub(this.MathInt(this.Size.Wed), this.Palete.Lite.Size);
            this.DrawRectA.Size.Het : this.Math.Sub(this.MathInt(this.Size.Het), this.Palete.Lite.Size);

            draw.Line : this.Palete.Lite;

            draw.ExecuteRectRound(this.DrawRectA, this.MathInt(6), this.MathInt(6));

            draw.Line : null;
        }
        return true;
    }
}
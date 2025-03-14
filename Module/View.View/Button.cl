class Button : View
{
    maide prusate Bool Init()
    {
        base.Init();

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

        inf (this.Focus)
        {
            draw.Fill : this.Palete.Lite;
        }
        inf (~this.Focus)
        {
            draw.Fill : this.Palete.Bord;
        }

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(14), this.MathInt(14));

        this.DrawRectA.Pos.Col : this.MathInt(this.DrawInfra.BoundSub(this.Pos.Col, 2));
        this.DrawRectA.Pos.Row : this.MathInt(this.DrawInfra.BoundSub(this.Pos.Row, 2));
        this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(this.Size.Wed, 2 * 2));
        this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(this.Size.Het, 2 * 2));

        draw.Fill : this.Back;

        draw.ExecuteRectRound(this.DrawRectA, 
            this.MathInt(this.DrawInfra.BoundSub(14, 2)), 
            this.MathInt(this.DrawInfra.BoundSub(14, 2)));

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;
        return true;
    }

    maide precate Bool SetChildArea(var DrawRect dest, var Draw draw)
    {
        base.SetChildArea(dest, draw);

        this.ViewInfra.ButtonChildArea(dest);
        return true;
    }
}
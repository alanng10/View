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
        this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(this.Size.Wed, 1));
        this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(this.Size.Het, 1));

        draw.Fill : this.Back;

        inf (this.Focus)
        {
            draw.Line : this.Palete.Lite;
        }

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(6), this.MathInt(6));

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Line : null;

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
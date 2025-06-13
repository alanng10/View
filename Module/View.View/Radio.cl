class Radio : View
{
    maide prusate Bool Init()
    {
        base.Init();

        this.TurnField : this.CreateTurnField();

        this.Back : this.Palete.Base.Brush;
        this.Turn : false;
        return true;
    }

    maide precate Field CreateTurnField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        base.Mod(varField, mod);

        inf (this.TurnField = varField)
        {
            this.ModTurn(mod);
        }
        return true;
    }

    field prusate Bool Focus
    {
        get
        {
            return base.Focus;
        }
        set
        {
            inf (this.Focus & ~value)
            {
                this.Turn : ~this.Turn;
            }

            base.Focus : value;
        }
    }

    field prusate Field TurnField { get { return data; } set { data : value; } }

    field prusate Bool Turn
    {
        get
        {
            return cast Bool(this.TurnField.GetAny());
        }
        set
        {
            this.TurnField.SetAny(value);
        }
    }

    maide precate Bool ModTurn(var Mod mod)
    {
        this.Event(this.TurnField);
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var Int roundSize;
        roundSize : 18;

        var Int foreRoundSize;
        foreRoundSize : 10;

        var Int roundCol;
        var Int roundRow;
        roundCol : this.Pos.Col + 6;
        roundRow : this.Pos.Row + this.DrawInfra.BoundSub(this.Size.Het, roundSize) / 2;

        this.DrawRectA.Pos.Col : this.MathInt(roundCol);
        this.DrawRectA.Pos.Row : this.MathInt(roundRow);
        this.DrawRectA.Size.Wed : this.MathInt(roundSize);
        this.DrawRectA.Size.Het : this.MathInt(roundSize);

        draw.Fill : this.Palete.Bord.Brush;

        draw.FillPos.Col : this.MathInt(roundCol);
        draw.FillPos.Row : this.MathInt(roundRow);
        draw.FillPosSet();

        draw.ExecuteRound(this.DrawRectA);

        inf (~this.Focus)
        {
            draw.Fill : this.Back;

            this.DrawRectA.Pos.Col : this.MathInt(roundCol + 1);
            this.DrawRectA.Pos.Row : this.MathInt(roundRow + 1);
            this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(roundSize, 1 * 2));
            this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(roundSize, 1 * 2));

            draw.ExecuteRound(this.DrawRectA);
        }

        inf (this.Turn)
        {
            var DrawForm form;
            form : this.Palete.Form;

            var Int formCol;
            var Int formRow;
            formCol : roundCol + roundSize / 2;
            formRow : this.Pos.Row + this.Size.Het / 2;

            form.Reset();

            form.Pos(this.MathInt(formCol), this.MathInt(formRow));

            form.Scale(this.MathValue(1, 0sn3), this.MathValue(1, 0sn3));

            draw.Form : form;
            draw.FormSet();

            draw.Fill : this.Palete.Fore.Brush;

            this.DrawRectA.Pos.Col : this.MathInt(0sn20);
            this.DrawRectA.Pos.Row : this.MathInt(0sn20);
            this.DrawRectA.Size.Wed : this.MathInt(40);
            this.DrawRectA.Size.Het : this.MathInt(40);

            draw.ExecuteRectRound(this.DrawRectA);

            draw.Form : null;
            draw.FormSet();
        }

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;

        return true;
    }

    maide precate Bool SetChildArea(var DrawRect dest, var Draw draw)
    {
        base.SetChildArea(dest, draw);

        this.ViewInfra.MarkChildArea(dest);
        return true;
    }
}
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

        var Int foreRectSize;
        foreRectSize : 8;

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
            draw.Fill : this.Palete.Fore.Brush;

            this.DrawRectA.Pos.Col : this.MathValue((roundCol + (roundSize - foreRectSize) / 2) * 64 + 31, 0sn6);
            this.DrawRectA.Pos.Row : this.MathValue((roundRow + (roundSize - foreRectSize) / 2) * 64 + 31, 0sn6);
            this.DrawRectA.Size.Wed : this.MathInt(foreRectSize);
            this.DrawRectA.Size.Het : this.MathInt(foreRectSize);

            draw.ExecuteRect(this.DrawRectA);
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
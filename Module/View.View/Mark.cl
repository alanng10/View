class Mark : View
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
        var Int cubeSize;
        cubeSize : 16;

        var Int cubeCol;
        var Int cubeRow;
        cubeCol : this.Pos.Col + 6;
        cubeRow : this.Pos.Row + this.DrawInfra.BoundSub(this.Size.Het, cubeSize) / 2;

        this.DrawRectA.Pos.Col : this.MathInt(cubeCol);
        this.DrawRectA.Pos.Row : this.MathInt(cubeRow);
        this.DrawRectA.Size.Wed : this.MathInt(cubeSize);
        this.DrawRectA.Size.Het : this.MathInt(cubeSize);

        draw.Fill : this.Palete.Bord.Brush;

        draw.FillPos.Col : this.MathInt(cubeCol);
        draw.FillPos.Row : this.MathInt(cubeRow);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(4), this.MathInt(4));

        this.DrawRectA.Pos.Col : this.MathInt(cubeCol + 1);
        this.DrawRectA.Pos.Row : this.MathInt(cubeRow + 1);
        this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(cubeSize, 1 * 2));
        this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(cubeSize, 1 * 2));

        inf (~this.Focus)
        {
            draw.Fill : this.Back;

            draw.ExecuteRectRound(this.DrawRectA, 
                this.MathInt(this.DrawInfra.BoundSub(4, 1)), 
                this.MathInt(this.DrawInfra.BoundSub(4, 1)));
        }

        inf (this.Turn)
        {
            var DrawForm form;
            form : this.Palete.Form;

            var Int angle;
            angle : 315;

            var Int formCol;
            var Int formRow;
            formCol : cubeCol + cubeSize / 2;
            formRow : this.Pos.Row + this.Size.Het / 2;

            form.Reset();

            form.Pos(this.MathInt(formCol), this.MathInt(formRow));

            form.Angle(this.MathInt(angle));

            draw.Form : form;
            draw.FormSet();

            draw.Fill : this.Palete.Fore.Brush;

            this.DrawRectA.Pos.Col : this.MathInt(0sn4);
            this.DrawRectA.Pos.Row : this.MathInt(0sn3);
            this.DrawRectA.Size.Wed : this.MathValue(3, 0sn1);
            this.DrawRectA.Size.Het : this.MathInt(4);

            draw.ExecuteRect(this.DrawRectA);

            this.DrawRectA.Pos.Col : this.MathInt(0sn4);
            this.DrawRectA.Pos.Row : this.MathInt(1);
            this.DrawRectA.Size.Wed : this.MathInt(10);
            this.DrawRectA.Size.Het : this.MathValue(3, 0sn1);

            draw.ExecuteRect(this.DrawRectA);

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
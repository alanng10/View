class Mark : View
{
    maide prusate Bool Init()
    {
        base.Init();

        this.Back : this.Palete.Base.Brush;
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var Int cubeSize;
        cubeSize : 16;

        var Int cubeCol;
        var Int cubeRow;
        cubeCol : this.Pos.Col + 12;
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

        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;
    }
}
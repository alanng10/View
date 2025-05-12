class Mark : View
{
    maide prusate Bool Init()
    {
        base.Init();

        this.Back : this.Palete.Back.Brush;
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var Int cubeSize;
        cubeSize : 14;

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

        


        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();

        draw.Fill : null;
    }
}
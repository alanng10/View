class Select : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Back : this.Palete.Back.Brush;
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var Int radius;
        radius : 6;

        this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col);
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row);
        this.DrawRectA.Size.Wed : this.MathInt(this.Size.Wed);
        this.DrawRectA.Size.Het : this.MathInt(this.Size.Het);

        draw.Fill : this.Palete.Bord.Brush;

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(radius), this.MathInt(radius));

        inf (~this.Focus)
        {
            this.DrawRectA.Pos.Col : this.MathInt(this.Pos.Col + 1);
            this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row + 1);
            this.DrawRectA.Size.Wed : this.MathInt(this.DrawInfra.BoundSub(this.Size.Wed, 1 * 2));
            this.DrawRectA.Size.Het : this.MathInt(this.DrawInfra.BoundSub(this.Size.Het, 1 * 2));

            draw.Fill : this.Back;

            draw.ExecuteRectRound(this.DrawRectA, 
                this.MathInt(this.DrawInfra.BoundSub(radius, 1)), 
                this.MathInt(this.DrawInfra.BoundSub(radius, 1)));
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

        this.ViewInfra.SelectChildArea(dest);
        return true;
    }
}
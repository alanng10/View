class Select : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.IndexField : this.CreateIndexField();

        this.Back : this.Palete.Back.Brush;
        return true;
    }

    maide precate Field CreateIndexField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    field prusate Array List { get { return data; } set { data : value; } }

    field prusate Field IndexField { get { return data; } set { data : value; } }

    field prusate Int Index
    {
        get
        {
            return cast Int(this.IndexField.GetAny());
        }
        set
        {
            this.IndexField.SetAny(value);
        }
    }

    maide precate Bool ModIndex(var Mod mod)
    {
        this.Event(this.IndexField);

        this.Child : cast View(this.List.Get(this.Index));
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

        draw.Fill : this.Palete.Fore.Brush;

        this.DrawRectA.Pos.Col : this.MathInt(this.DrawInfra.BoundSub(this.Pos.Col + this.Size.Wed, radius + 10));
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row + radius);
        this.DrawRectA.Size.Wed : this.MathInt(10);
        this.DrawRectA.Size.Het : this.MathInt(4);

        draw.ExecuteRect(this.DrawRectA);

        this.DrawRectA.Pos.Col : this.MathInt(this.DrawInfra.BoundSub(this.Pos.Col + this.Size.Wed, radius + 7));
        this.DrawRectA.Pos.Row : this.MathInt(this.Pos.Row + radius + 4);
        this.DrawRectA.Size.Wed : this.MathInt(4);
        this.DrawRectA.Size.Het : this.MathInt(4);

        draw.ExecuteRect(this.DrawRectA);

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
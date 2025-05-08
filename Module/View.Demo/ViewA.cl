class ViewA : View
{
    maide prusate Bool Init()
    {
        base.Init();

        var DrawBrush brushA;
        brushA : new DrawBrush;
        brushA.Kind : this.Demo.BrushKindList.Color;
        brushA.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0, 0, 0hff);
        brushA.Init();

        this.Brush : new DrawBrush;
        this.Brush.Kind : this.Demo.BrushKindList.Color;
        this.Brush.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0hff, 0hff, 0);
        this.Brush.Init();

        var DrawBrush slashBrush;
        slashBrush : new DrawBrush;
        slashBrush.Kind : this.Demo.BrushKindList.Color;
        slashBrush.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0hff, 0, 0hff);
        slashBrush.Init();

        var DrawSlash slash;
        slash : new DrawSlash;
        slash.Brush : slashBrush;
        slash.Line : this.Demo.SlashLineList.DashDotDot;
        slash.Cape : this.Demo.SlashCapeList.Round;
        slash.Join : this.Demo.SlashJoinList.Bevel;
        slash.Size : this.Demo.MathInt(11);
        slash.Init();

        var DrawForm form;
        form : new DrawForm;
        form.Init();

        this.Pos.Col : 0;
        this.Pos.Row : 0;
        this.Size.Wed : 600;
        this.Size.Het : 400;
        this.Back : brushA;
        this.Slash : slash;
        this.Form : form;
        return true;
    }

    maide prusate Bool Final()
    {
        this.Form.Final();

        var DrawBrush k;
        k : this.Slash.Brush;

        this.Slash.Final();

        k.Final();

        this.Brush.Final();

        this.Back.Final();
        return true;
    }

    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate DrawSlash Slash { get { return data; } set { data : value; } }
    field prusate DrawBrush Brush { get { return data; } set { data : value; } }
    field prusate DrawForm Form { get { return data; } set { data : value; } }
    field prusate Int RotateValue { get { return data; } set { data : value; } }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var Int col;
        var Int row;
        col : this.Pos.Col;
        row : this.Pos.Row;
        var Int wed;
        var Int het;
        wed : this.Size.Wed;
        het : this.Size.Het;

        this.DrawRectA.Pos.Col : this.MathInt(col);
        this.DrawRectA.Pos.Row : this.MathInt(row);
        this.DrawRectA.Size.Wed : this.MathInt(wed);
        this.DrawRectA.Size.Het : this.MathInt(het);

        draw.Fill : this.Back;
        draw.Line : this.Slash;

        draw.FillPos.Col : this.MathInt(col);
        draw.FillPos.Row : this.MathInt(row);
        draw.FillPosSet();

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(40), this.MathInt(30));
    
        var Int oa;
        oa : this.RotateValue * 10;
        var Int ob;
        ob : oa / 360;
        ob : ob * 360;
        oa : oa - ob;

        var Int angle;
        angle : this.MathInt(oa);

        this.Form.Reset();

        this.Form.Pos(this.MathInt(col), this.MathInt(row));

        this.Form.Angle(angle);

        draw.Form : this.Form;
        draw.FormSet();

        draw.Fill : this.Brush;

        this.DrawRectA.Pos.Col : 0;
        this.DrawRectA.Pos.Row : 0;
        this.DrawRectA.Size.Wed : this.MathInt(300);
        this.DrawRectA.Size.Het : this.MathInt(200);

        draw.ExecuteRectRound(this.DrawRectA, this.MathInt(40), this.MathInt(30));

        draw.Form : null;
        draw.FormSet();

        draw.Line : null;
        draw.Fill : null;
        return true;
    }
}
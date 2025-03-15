class Image : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DestField : this.CreateDestField();
        this.SourceField : this.CreateSourceField();

        this.Back : this.DrawInfra.SlashZero.Brush;

        this.Dest : this.CreateDest();
        this.Source : this.CreateSource();
        return true;
    }

    maide precate Field CreateDestField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateSourceField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Rect CreateDest()
    {
        return this.CreateRect();
    }

    maide precate Rect CreateSource()
    {
        return this.CreateRect();
    }

    maide precate Rect CreateRect()
    {
        var Rect a;
        a : new Rect;
        a.Init();
        return a;
    }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        base.Mod(varField, mod);

        inf (this.ValueField = varField)
        {
            this.ModValue(mod);
        }
        inf (this.DestField = varField)
        {
            this.ModDest(mod);
        }
        inf (this.SourceField = varField)
        {
            this.ModSource(mod);
        }
        return true;
    }

    field prusate Field ValueField { get { return data; } set { data : value; } }

    field prusate DrawImage Value
    {
        get
        {
            return cast DrawImage(this.ValueField.GetAny());
        }
        set
        {
            this.ValueField.SetAny(value);
        }
    }

    maide precate Bool ModValue(var Mod mod)
    {
        this.Event(this.ValueField);
        return true;
    }

    field prusate Field DestField { get { return data; } set { data : value; } }

    field prusate Rect Dest
    {
        get
        {
            return cast Rect(this.DestField.Get());
        }
        set
        {
            this.DestField.Set(value);
        }
    }

    maide precate Bool ModDest(var Mod mod)
    {
        this.Event(this.DestField);
        return true;
    }

    field prusate Field SourceField { get { return data; } set { data : value; } }

    field prusate Rect Source
    {
        get
        {
            return cast Rect(this.SourceField.Get());
        }
        set
        {
            this.SourceField.Set(value);
        }
    }

    maide precate Bool ModSource(var Mod mod)
    {
        this.Event(this.SourceField);
        return true;
    }

    maide precate Bool ValidDrawChild()
    {
        return false;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        base.ExecuteDrawThis(draw);

        inf (this.Value = null)
        {
            return true;
        }

        this.DrawRectA.Pos.Col : this.MathInt(this.Dest.Pos.Col);
        this.DrawRectA.Pos.Row : this.MathInt(this.Dest.Pos.Row);
        this.DrawRectA.Size.Wed : this.MathInt(this.Dest.Size.Wed);
        this.DrawRectA.Size.Het : this.MathInt(this.Dest.Size.Het);

        this.DrawRectB.Pos.Col : this.MathInt(this.Source.Pos.Col);
        this.DrawRectB.Pos.Row : this.MathInt(this.Source.Pos.Row);
        this.DrawRectB.Size.Wed : this.MathInt(this.Source.Size.Wed);
        this.DrawRectB.Size.Het : this.MathInt(this.Source.Size.Het);
        return true;
    }
}
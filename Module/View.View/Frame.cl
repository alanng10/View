class Frame : FrameFrame
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;

        this.Draw : this.CreateDraw();
        return true;
    }

    maide prusate Bool Final()
    {
        this.FinalDraw(this.Draw);

        base.Final();
        return true;
    }

    maide precate Draw CreateDraw()
    {
        var Draw a;
        a : new Draw;
        a.Init();
        a.Out : this.DrawImage.Out;
        a.Size.Wed : this.Size.Wed;
        a.Size.Het : this.Size.Het;
        a.SizeSet();
        return a;
    }

    maide precate Bool FinalDraw(var Draw a)
    {
        a.Final();
        return true;
    }

    field prusate View View { get { return data; } set { data : value; } }
    field prusate Type Type { get { return data; } set { data : value; } }
    field precate Infra ViewInfra { get { return data; } set { data : value; } }
    field precate Draw Draw { get { return data; } set { data : value; } }

    maide precate Bool TypeEvent(var Int index, var Bool value)
    {
        inf (~(this.Type = null))
        {
            this.Type.Set(index, value);
        }
        return true;
    }

    maide precate Bool DrawEvent()
    {
        var Draw draw;
        draw : this.Draw;

        draw.Start();

        draw.Clear(this.DrawClearColor);

        inf (this.ValidDrawView())
        {
            this.ExecuteDrawView(draw);
        }

        draw.End();
        return true;
    }

    maide precate Bool ValidDrawView()
    {
        return ~(this.View = null);
    }

    maide precate Bool ExecuteDrawView(var Draw draw)
    {
        this.View.ExecuteDraw(draw);
        return true;
    }
}
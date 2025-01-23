namespace View.View;

public class Frame : FrameFrame
{
    public override bool Init()
    {
        base.Init();
        this.ViewInfra = Infra.This;
        return true;
    }

    public override bool Final()
    {
        base.Final();
        return true;
    }

    public virtual View View { get; set; }
    public virtual TypeType Type { get; set; }
    protected virtual Infra ViewInfra { get; set; }
    protected virtual DrawDraw Draw { get; set; }

    protected override bool DrawEvent()
    {
        DrawDraw draw;
        draw = this.Draw;

        draw.Start();

        draw.Clear(this.DrawClearColor);

        if (this.ValidDrawView())
        {
            this.ExecuteDrawView(draw);
        }

        draw.End();
        return true;
    }

    protected virtual bool ValidDrawView()
    {
        return !(this.View == null);
    }

    protected virtual bool ExecuteDrawView(DrawDraw draw)
    {
        this.View.ExecuteDraw(draw);
        return true;
    }
}
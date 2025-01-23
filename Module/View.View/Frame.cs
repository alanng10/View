namespace View.View;

public class Frame : FrameFrame
{
    public override bool Init()
    {
        base.Init();
        this.ViewInfra = Infra.This;

        this.Draw = this.CreateDraw();
        return true;
    }

    public override bool Final()
    {
        this.FinalDraw(this.Draw);

        base.Final();
        return true;
    }

    protected virtual DrawDraw CreateDraw()
    {
        DrawDraw a;
        a = new DrawDraw();
        a.Init();
        a.Out = this.DrawImage.Out;
        a.Size.Wed = this.Size.Wed;
        a.Size.Het = this.Size.Het;
        a.SizeSet();
        return a;
    }

    protected virtual bool FinalDraw(DrawDraw a)
    {
        a.Final();
        return true;
    }

    public virtual View View { get; set; }
    public virtual TypeType Type { get; set; }
    protected virtual Infra ViewInfra { get; set; }
    protected virtual DrawDraw Draw { get; set; }

    protected override bool TypeEvent(long index, bool value)
    {
        if (!(this.Type == null))
        {
            this.Type.Set(index, value);
        }
        return true;
    }

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
namespace View.Media;

public class VideoOut : Any
{
    private bool PrivateFrameEvent()
    {
        this.FrameEvent();
        return true;
    }

    public override bool Init()
    {
        base.Init();
        this.InternIntern = InternIntern.This;
        this.InternInfra = InternInfra.This;
        this.MediaInfra = Infra.This;
        this.InternHandle = new Handle();
        this.InternHandle.Any = this;
        this.InternHandle.Init();

        MaideAddress ua;
        ua = this.MediaInfra.VideoOutFrameMaideAddress;
        ulong arg;
        arg = this.InternHandle.ULong();
        this.InternFrameEventState = this.InternInfra.StateCreate(ua, arg);

        this.InternFrame = Extern.VideoFrame_New();
        Extern.VideoFrame_Init(this.InternFrame);

        this.Intern = Extern.VideoOut_New();
        Extern.VideoOut_Init(this.Intern);
        Extern.VideoOut_FrameEventStateSet(this.Intern, this.InternFrameEventState);

        Extern.VideoOut_FrameSet(this.Intern, this.InternFrame);
        return true;
    }

    public virtual bool Final()
    {
        Extern.VideoOut_Final(this.Intern);
        Extern.VideoOut_Delete(this.Intern);

        Extern.VideoFrame_Final(this.InternFrame);
        Extern.VideoFrame_Delete(this.InternFrame);

        this.InternInfra.StateDelete(this.InternFrameEventState);

        this.InternHandle.Final();
        return true;
    }

    private InternIntern InternIntern { get; set; }
    private InternInfra InternInfra { get; set; }
    private Infra MediaInfra { get; set; }
    internal virtual ulong Intern { get; set; }
    internal virtual ulong InternFrame { get; set; }
    private ulong InternFrameEventState { get; set; }
    private Handle InternHandle { get; set; }

    internal static ulong InternFrameEvent(ulong videoOut, ulong frame, ulong arg)
    {
        InternIntern internIntern;
        internIntern = InternIntern.This;

        object ao;
        ao = internIntern.HandleTarget(arg);

        VideoOut a;
        a = (VideoOut)ao;
        a.PrivateFrameEvent();
        return 1;
    }

    protected virtual bool FrameEvent()
    {
        return false;
    }

    public virtual bool Image(Image image)
    {
        Extern.VideoFrame_Image(this.InternFrame, image.Ident);

        ulong k;
        k = Extern.Image_SizeGet(image.Ident);

        image.Size.Wed = (long)Extern.Size_WedGet(k);
        image.Size.Het = (long)Extern.Size_HetGet(k);
        return true;
    }
}
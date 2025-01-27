class VideoOut : Any
{
    maide private Bool PrivateFrameEvent()
    {
        this.FrameEvent();
        return true;
    }

    maide prusate Bool Init()
    {
        base.Init();
        this.InternIntern : share Intern;
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;

        var Int ka;
        ka : this.InternIntern.StateVideoOutFrameEvent();
        var Int arg;
        arg : this.InternIntern.Memory(this);
        this.InternFrameEventState : this.InternInfra.StateCreate(ka, arg);

        var Extern extern;
        extern : this.Extern;

        this.InternFrame : extern.VideoFrame_New();
        extern.VideoFrame_Init(this.InternFrame);

        this.Intern : extern.VideoOut_New();
        extern.VideoOut_Init(this.Intern);
        extern.VideoOut_FrameEventStateSet(this.Intern, this.InternFrameEventState);

        extern.VideoOut_FrameSet(this.Intern, this.InternFrame);
        return true;
    }
}
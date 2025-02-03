namespace Demo;

class Play : MediaPlay
{
    public override bool Init()
    {
        StorageMode mode;
        mode = new StorageMode();
        mode.Init();
        mode.Read = true;

        this.MediaStorage = new Storage();
        this.MediaStorage.Init();
        this.MediaStorage.Path = this.S("ViewDemoData/Video.mp4");
        this.MediaStorage.Mode = mode;
        this.MediaStorage.Open();

        VideoOut videoOut;
        videoOut = new VideoOut();
        videoOut.Init();
        videoOut.Demo = this.Demo;

        long scaleFactor;
        scaleFactor = 1 << 20;

        long volume;
        volume = this.MathValue(scaleFactor / 8, -20);

        MediaAudioOut audioOut;
        audioOut = new MediaAudioOut();
        audioOut.Init();
        audioOut.Volume = volume;

        base.Init();
        this.Source = this.MediaStorage.Stream;
        this.SourceSet();
        this.VideoOut = videoOut;
        this.AudioOut = audioOut;
        this.VideoOutSet();
        this.AudioOutSet();
        return true;
    }

    public virtual bool Final()
    {
        base.Final();

        this.AudioOut.Final();

        this.VideoOut.Final();

        this.MediaStorage.Close();

        this.MediaStorage.Final();
        return true;
    }

    public virtual Demo Demo { get; set; }
    private Storage MediaStorage { get; set; }
}
class Play : MediaPlay
{
    maide prusate Bool Init()
    {
        var StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Read : true;

        this.MediaStorage : new Storage;
        this.MediaStorage.Init();
        this.MediaStorage.Path : "ViewDemoData/Media.mp4";
        this.MediaStorage.Mode : mode;
        this.MediaStorage.Open();

        var VideoOut videoOut;
        videoOut : new VideoOut;
        videoOut.Init();
        videoOut.Demo : this.Demo;

        var Int scaleFactor;
        scaleFactor : bit <(1, 20);

        var Int volume;
        volume : this.MathValue(scaleFactor / 8, -20);

        var MediaAudioOut audioOut;
        audioOut : new MediaAudioOut;
        audioOut.Init();
        audioOut.Volume : volume;
    }
}
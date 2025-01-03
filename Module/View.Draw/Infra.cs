namespace View.Draw;

public class Infra : Any
{
    public static Infra This { get; } = ShareCreate();

    private static Infra ShareCreate()
    {
        Infra share;
        share = new Infra();
        Any a;
        a = share;
        a.Init();
        return share;
    }

    public override bool Init()
    {
        base.Init();
        this.MathInfra = MathInfra.This;
        this.TextInfra = TextInfra.This;
        this.StorageStatusList = StorageStatusList.This;
        this.BrushInfra = BrushInfra.This;
        this.BrushKindList = BrushKindList.This;
        this.SlashLineList = SlashLineList.This;
        this.SlashCapeList = SlashCapeList.This;
        this.SlashJoinList = SlashJoinList.This;

        this.PixelByteCount = 4;

        this.ColorCompMax = byte.MaxValue;

        Color blackColor;
        blackColor = this.ColorCreate(this.ColorCompMax, 0, 0, 0);

        Color whiteColor;
        whiteColor = this.ColorCreate(this.ColorCompMax, this.ColorCompMax, this.ColorCompMax, this.ColorCompMax);

        Color zeroColor;
        zeroColor = this.ColorCreate(0, 0, 0, 0);

        MathComp ka;
        ka = new MathComp();
        ka.Init();

        long k;
        k = this.MathInfra.Int(ka, 1);

        this.BlackSlash = this.SlashCreate(blackColor, k);
        this.WhiteSlash = this.SlashCreate(whiteColor, k);
        this.ZeroSlash = this.SlashCreate(zeroColor, k);

        this.FontAriaName = this.TextInfra.S("Segoe UI Variable");
        this.FontMonoName = this.TextInfra.S("Cascadia Mono");
        return true;
    }

    public virtual long PixelByteCount { get; set; }
    public virtual long ColorCompMax { get; set; }
    public virtual Slash BlackSlash { get; set; }
    public virtual Slash WhiteSlash { get; set; }
    public virtual Slash ZeroSlash { get; set; }
    public virtual String FontAriaName { get; set; }
    public virtual String FontMonoName { get; set; }
    protected virtual MathInfra MathInfra { get; set; }
    protected virtual TextInfra TextInfra { get; set; }
    protected virtual StorageStatusList StorageStatusList { get; set; }
    protected virtual BrushKindList BrushKindList { get; set; }
    protected virtual SlashLineList SlashLineList { get; set; }
    protected virtual SlashCapeList SlashCapeList { get; set; }
    protected virtual SlashJoinList SlashJoinList { get; set; }
    private BrushInfra BrushInfra { get; set; }

    public virtual Color ColorCreate(long alpha, long red, long green, long blue)
    {
        Color a;
        a = new Color();
        a.Init();
        a.Alpha = alpha;
        a.Red = red;
        a.Green = green;
        a.Blue = blue;
        return a;
    }

    private Slash SlashCreate(Color color, long size)
    {
        Brush ka;
        ka = new Brush();
        ka.Kind = this.BrushKindList.Color;
        ka.Color = color;
        ka.Init();

        Slash a;
        a = new Slash();
        a.Brush = ka;
        a.Line = this.SlashLineList.Solid;
        a.Size = size;
        a.Cape = this.SlashCapeList.Plane;
        a.Join = this.SlashJoinList.Miter;
        a.Init();
        return a;
    }

    internal virtual bool ColorSet(Color color, ulong internColor)
    {
        color.Blue = (long)((internColor >> (0 * 8)) & 0xff);
        color.Green = (long)((internColor >> (1 * 8)) & 0xff);
        color.Red = (long)((internColor >> (2 * 8)) & 0xff);
        color.Alpha = (long)((internColor >> (3 * 8)) & 0xff);
        return true;
    }

    internal virtual ulong InternColor(Color color)
    {
        return this.BrushInfra.InternColor(color);
    }

    public virtual Pos PosCreate(long col, long row)
    {
        Pos a;
        a = new Pos();
        a.Init();
        a.Col = col;
        a.Row = row;
        return a;
    }

    public virtual Size SizeCreate(long wed, long het)
    {
        Size a;
        a = new Size();
        a.Init();
        a.Wed = wed;
        a.Het = het;
        return a;
    }

    public virtual Rect RectCreate(long col, long row, long wed, long het)
    {
        Rect a;
        a = new Rect();
        a.Init();
        a.Pos = this.PosCreate(col, row);
        a.Size = this.SizeCreate(wed, het);
        return a;
    }

    public virtual Image ImageCreateSize(Size size)
    {
        Image a;
        a = new Image();
        a.Init();
        a.Size.Wed = size.Wed;
        a.Size.Het = size.Het;
        a.DataCreate();
        return a;
    }

    public virtual Image ImageCreateStorage(String path)
    {
        Image k;
        k = null;

        Storage storage;
        storage = new Storage();
        storage.Init();
        StorageMode mode;
        mode = new StorageMode();
        mode.Init();
        mode.Read = true;
        storage.Path = path;
        storage.Mode = mode;

        storage.Open();

        if (storage.Status == this.StorageStatusList.NoError)
        {
            Stream stream;
            stream = storage.Stream;

            Image ka;
            ka = new Image();
            ka.Init();

            ImageRead imageRead;
            imageRead = new ImageRead();
            imageRead.Init();
            imageRead.Stream = stream;
            imageRead.Image = ka;

            bool b;
            b = imageRead.Execute();
            if (b)
            {
                k = ka;
            }
            if (!b)
            {
                ka.Final();
            }
            imageRead.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    public virtual bool ImageWrite(String path, Image image, ImageBinary binary)
    {
        Storage storage;
        storage = new Storage();
        storage.Init();
        StorageMode mode;
        mode = new StorageMode();
        mode.Init();
        mode.Write = true;
        storage.Path = path;
        storage.Mode = mode;
        storage.Open();

        bool o;
        o = false;
        if (storage.Status == this.StorageStatusList.NoError)
        {
            Stream stream;
            stream = storage.Stream;

            ImageWrite imageWrite;
            imageWrite = new ImageWrite();
            imageWrite.Init();
            imageWrite.Stream = stream;
            imageWrite.Binary = binary;
            imageWrite.Image = image;
            o = imageWrite.Execute();
            imageWrite.Final();
        }
        storage.Close();
        storage.Final();
        return o;
    }

    public virtual bool BoundArea(Rect bound, Rect area)
    {
        long lite;
        lite = area.Pos.Col;
        long nite;
        nite = area.Pos.Row;
        long wed;
        wed = area.Size.Wed;
        long het;
        het = area.Size.Het;
        long rite;
        rite = lite + wed;
        long site;
        site = nite + het;

        long boundLite;
        long boundNite;
        boundLite = bound.Pos.Col;
        boundNite = bound.Pos.Row;
        long boundRite;
        long boundSite;
        boundRite = boundLite + bound.Size.Wed;
        boundSite = boundNite + bound.Size.Het;

        if (lite < boundLite)
        {
            lite = boundLite;
        }
        if (nite < boundNite)
        {
            nite = boundNite;
        }
        if (boundRite < rite)
        {
            rite = boundRite;
        }
        if (boundSite < site)
        {
            site = boundSite;
        }

        long w;
        w = this.BoundSub(rite, lite);
        long h;
        h = this.BoundSub(site, nite);

        area.Pos.Col = lite;
        area.Pos.Row = nite;
        area.Size.Wed = w;
        area.Size.Het = h;
        return true;
    }

    protected virtual long BoundSub(long lite, long rite)
    {
        long k;
        k = 0;
        if (!(lite < rite))
        {
            k = lite - rite;
        }
        return k;
    }
}
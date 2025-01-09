namespace View.Frame;

public class Frame : Any
{
    private bool PrivateTypeEvent(ulong index, ulong value)
    {
        long indexA;
        indexA = (long)index;
        bool b;
        b = !(value == 0);

        long indexK;
        indexK = this.InternInfra.TypeIndexFromInternIndex(indexA);

        this.TypeEvent(indexK, b);
        return true;
    }

    private bool PrivateDrawEvent()
    {
        this.DrawEvent();
        return true;
    }

    public override bool Init()
    {
        base.Init();
        this.InternIntern = InternIntern.This;
        this.InternInfra = InternInfra.This;
        this.MathInfra = MathInfra.This;
        this.TextInfra = TextInfra.This;
        this.DrawInfra = DrawInfra.This;
        this.FrameInfra = Infra.This;
        this.Math = MathMath.This;

        this.MathComp = this.CreateMathComp();

        this.InternHandle = new Handle();
        this.InternHandle.Any = this;
        this.InternHandle.Init();

        MaideAddress ua;
        ua = this.FrameInfra.FrameTypeMaideAddress;
        MaideAddress ub;
        ub = this.FrameInfra.FrameDrawMaideAddress;
        ulong arg;
        arg = this.InternHandle.ULong();

        this.InternTypeState = this.InternInfra.StateCreate(ua, arg);
        this.InternDrawState = this.InternInfra.StateCreate(ub, arg);

        this.InternUpdateRect = this.InternInfra.RectCreate();

        this.Intern = Extern.Frame_New();
        Extern.Frame_Init(this.Intern);

        this.Title = this.TextInfra.S("Frame");
        this.TitleSet();

        ulong size;
        size = Extern.Frame_SizeGet(this.Intern);
        ulong w;
        w = Extern.Size_WedGet(size);
        ulong h;
        h = Extern.Size_HetGet(size);
        long wed;
        wed = (long)w;
        long het;
        het = (long)h;
        this.Size = this.DrawInfra.SizeCreate(wed, het);

        Extern.Frame_TypeStateSet(this.Intern, this.InternTypeState);
        Extern.Frame_DrawStateSet(this.Intern, this.InternDrawState);

        this.DestRect = this.CreateDestRect();
        this.SourceRect = this.CreateSourceRect();

        this.DrawImage = this.CreateDrawImage();

        ulong k;
        k = Extern.Frame_Out(this.Intern);

        this.FrameDraw = new DrawDraw();
        this.FrameDraw.Init();
        this.DrawSet(this.FrameDraw, k);

        this.Draw = this.CreateDraw();
 
        this.DrawClearColor = this.CreateDrawClearColor();
        return true;
    }

    public virtual bool Final()
    {
        this.FinalDraw(this.Draw);

        this.FrameDraw.Final();

        this.FinalDrawImage(this.DrawImage);

        Extern.Frame_Final(this.Intern);
        Extern.Frame_Delete(this.Intern);

        this.InternInfra.RectDelete(this.InternUpdateRect);

        this.InternInfra.StateDelete(this.InternDrawState);

        this.InternInfra.StateDelete(this.InternTypeState);

        this.InternHandle.Final();
        return true;
    }

    protected virtual MathComp CreateMathComp()
    {
        MathComp a;
        a = new MathComp();
        a.Init();
        return a;
    }

    protected virtual DrawRect CreateDestRect()
    {
        return this.CreateFrameRect();
    }

    protected virtual DrawRect CreateSourceRect()
    {
        return this.CreateFrameRect();
    }

    protected virtual DrawImage CreateDrawImage()
    {
        DrawImage a;
        a = new DrawImage();
        a.Init();
        a.Size.Wed = this.Size.Wed;
        a.Size.Het = this.Size.Het;
        a.DataCreate();
        return a;
    }

    protected virtual bool FinalDrawImage(DrawImage a)
    {
        a.Final();
        return true;
    }

    protected virtual DrawDraw CreateDraw()
    {
        DrawDraw a;
        a = new DrawDraw();
        a.Init();
        this.DrawSet(this.Draw, this.DrawImage.Out);
        return a;
    }

    protected virtual bool FinalDraw(DrawDraw a)
    {
        a.Final();
        return true;
    }

    protected virtual DrawColor CreateDrawClearColor()
    {
        DrawColor a;
        a = this.DrawInfra.WhiteSlash.Brush.Color;
        return a;
    }

    public virtual DrawSize Size { get; set; }
    public virtual String Title { get; set; }
    public virtual TypeType Type { get; set; }
    public virtual DrawImage DrawImage { get; set; }
    private InternIntern InternIntern { get; set; }
    private InternInfra InternInfra { get; set; }
    protected virtual MathInfra MathInfra { get; set; }
    protected virtual TextInfra TextInfra { get; set; }
    protected virtual DrawInfra DrawInfra { get; set; }
    protected virtual MathMath Math { get; set; }
    protected virtual MathComp MathComp { get; set; }
    protected virtual DrawDraw Draw { get; set; }
    protected virtual DrawRect DestRect { get; set; }
    protected virtual DrawRect SourceRect { get; set; }
    protected virtual VideoColor DrawClearColor { get; set; }
    private Infra FrameInfra { get; set; }
    private ulong Intern { get; set; }
    private ulong InternTitle { get; set; }
    private ulong InternUpdateRect { get; set; }
    private ulong InternDrawState { get; set; }
    private ulong InternTypeState { get; set; }
    private Handle InternHandle { get; set; }
    private DrawDraw FrameDraw { get; set; }

    public virtual bool TitleSet()
    {
        this.InternTitle = this.InternInfra.StringCreate(this.Title);

        Extern.Frame_TitleSet(this.Intern, this.InternTitle);
        Extern.Frame_TitleThisSet(this.Intern);
        Extern.Frame_TitleSet(this.Intern, 0);

        this.InternInfra.StringDelete(this.InternTitle);
        return true;
    }

    internal static ulong InternType(ulong frame, ulong index, ulong value, ulong arg)
    {
        InternIntern internIntern;
        internIntern = InternIntern.This;

        object ao;
        ao = internIntern.HandleTarget(arg);

        Frame a;
        a = (Frame)ao;
        a.PrivateTypeEvent(index, value);

        return 1;
    }

    protected virtual bool TypeEvent(long index, bool value)
    {
        if (!(this.Type == null))
        {
            this.Type.Set(index, value);
        }
        return true;
    }

    internal static ulong InternDraw(ulong frame, ulong arg)
    {
        InternIntern internIntern;
        internIntern = InternIntern.This;

        object ao;
        ao = internIntern.HandleTarget(arg);

        Frame a;
        a = (Frame)ao;
        a.PrivateDrawEvent();
        return 1;
    }

    protected virtual bool DrawEvent()
    {
        DrawDraw draw;
        draw = this.FrameDraw;

        draw.Start();

        this.ExecuteDraw();

        draw.ExecuteImage(this.DrawImage, this.DestRect, this.SourceRect);

        draw.End();
        return true;
    }

    protected virtual bool ExecuteDraw()
    {
        DrawDraw draw;
        draw = this.Draw;

        draw.Start();

        draw.Clear(this.DrawClearColor);

        draw.End();
        return true;
    }

    public virtual bool Update(DrawRect rect)
    {
        this.InternInfra.RectSet(this.InternUpdateRect,
            rect.Pos.Col, rect.Pos.Row, rect.Size.Wed, rect.Size.Het
        );

        Extern.Frame_Update(this.Intern, this.InternUpdateRect);
        return true;
    }

    public virtual bool Shown
    {
        get
        {
            ulong k;
            k = Extern.Frame_ShownGet(this.Intern);
            bool a;
            a = !(k == 0);
            return a;
        }
        set
        {
            ulong u;
            u = (ulong)(value ? 1 : 0);
            Extern.Frame_ShownSet(this.Intern, u);
        }
    }

    public virtual bool Close()
    {
        Extern.Frame_Close(this.Intern);
        return true;
    }

    protected virtual long MathInt(long n)
    {
        MathInfra mathInfra;
        mathInfra = this.MathInfra;

        MathComp mathComp;
        mathComp = this.MathComp;

        long a;
        a = mathInfra.Int(mathComp, n);
        return a;
    }

    protected virtual long MathValue(long cand, long expo)
    {
        MathComp mathComp;
        mathComp = this.MathComp;

        mathComp.Cand = cand;
        mathComp.Expo = expo;

        long a;
        a = this.Math.Value(mathComp);
        return a;
    }

    protected virtual DrawRect CreateFrameRect()
    {
        DrawSize size;
        size = this.Size;

        DrawRect a;
        a = this.DrawInfra.RectCreate(0, 0, this.MathInt(size.Wed), this.MathInt(size.Het));
        return a;
    }

    private bool DrawSet(DrawDraw draw, ulong videoOut)
    {
        DrawSize size;
        size = this.Size;

        draw.Out = videoOut;
        draw.Size.Wed = size.Wed;
        draw.Size.Het = size.Het;
        draw.SizeSet();

        return true;
    }
}
namespace View.Draw;

public class Draw : Any
{
    public override bool Init()
    {
        base.Init();
        this.InternIntern = InternIntern.This;
        this.InternInfra = InternInfra.This;
        this.MathInfra = MathInfra.This;
        this.DrawInfra = Infra.This;
        this.Math = MathMath.This;

        this.Size = this.CreateSize();
        this.Area = this.CreateArea();
        this.Pos = this.CreatePos();
        this.FillPos = this.CreateFillPos();

        this.MathComp = this.CreateMathComp();

        this.PosA = this.CreatePosA();
        this.WorldForm = this.CreateWorldForm();

        this.TextCount = 1024;

        ulong ka;
        ka = (ulong)this.TextCount;
        ka = ka * sizeof(uint);
        this.InternTextData = Extern.New(ka);

        this.InternText = Extern.String_New();
        Extern.String_Init(this.InternText);
        Extern.String_ValueSet(this.InternText, this.InternTextData);
        Extern.String_CountSet(this.InternText, 0);

        this.InternRangeA = this.InternInfra.RangeCreate();
        this.InternRectA = this.InternInfra.RectCreate();
        this.InternRectB = this.InternInfra.RectCreate();
        this.InternPosA = this.InternInfra.PosCreate();
        this.InternPosB = this.InternInfra.PosCreate();

        this.InternSize = this.InternInfra.SizeCreate();

        this.InternArea = this.InternInfra.RectCreate();

        this.InternFillPos = this.InternInfra.PosCreate();

        this.Intern = Extern.Draw_New();
        Extern.Draw_Init(this.Intern);
        Extern.Draw_SizeSet(this.Intern, this.InternSize);
        Extern.Draw_AreaSet(this.Intern, this.InternArea);
        Extern.Draw_FillPosSet(this.Intern, this.InternFillPos);
        return true;
    }

    public virtual bool Final()
    {
        Extern.Draw_Final(this.Intern);
        Extern.Draw_Delete(this.Intern);

        this.InternInfra.PosDelete(this.InternFillPos);

        this.InternInfra.RectDelete(this.InternArea);

        this.InternInfra.SizeDelete(this.InternSize);

        this.InternInfra.PosDelete(this.InternPosB);
        this.InternInfra.PosDelete(this.InternPosA);
        this.InternInfra.RectDelete(this.InternRectB);
        this.InternInfra.RectDelete(this.InternRectA);
        this.InternInfra.RangeDelete(this.InternRangeA);

        Extern.String_Final(this.InternText);
        Extern.String_Delete(this.InternText);

        Extern.Delete(this.InternTextData);

        this.FinalWorldForm(this.WorldForm);
        return true;
    }

    protected virtual Size CreateSize()
    {
        Size a;
        a = new Size();
        a.Init();
        return a;
    }

    protected virtual Rect CreateArea()
    {
        Rect a;
        a = new Rect();
        a.Init();
        a.Pos = new Pos();
        a.Pos.Init();
        a.Size = new Size();
        a.Size.Init();
        return a;
    }

    protected virtual Pos CreatePos()
    {
        Pos a;
        a = new Pos();
        a.Init();
        return a;
    }

    protected virtual Pos CreateFillPos()
    {
        Pos a;
        a = new Pos();
        a.Init();
        return a;
    }

    protected virtual MathComp CreateMathComp()
    {
        MathComp a;
        a = new MathComp();
        a.Init();
        return a;
    }

    protected virtual Pos CreatePosA()
    {
        Pos a;
        a = new Pos();
        a.Init();
        return a;
    }

    protected virtual Form CreateWorldForm()
    {
        Form a;
        a = new Form();
        a.Init();
        return a;
    }

    protected virtual bool FinalWorldForm(Form a)
    {
        a.Final();
        return true;
    }

    public virtual ulong Out { get; set; }
    public virtual Size Size { get; set; }
    public virtual Rect Area { get; set; }
    public virtual Pos Pos { get; set; }
    public virtual Pos FillPos { get; set; }

    public virtual Brush Fill
    {
        get
        {
            return this.FillData;
        }
        set
        {
            this.FillData = value;

            ulong k;
            k = 0;
            if (!(this.FillData == null))
            {
                k = this.FillData.Intern;
            }
            Extern.Draw_FillSet(this.Intern, k);
        }
    }

    protected virtual Brush FillData { get; set; }

    public virtual Slash Line
    {
        get
        {
            return this.LineData;
        }
        set
        {
            this.LineData = value;

            ulong k;
            k = 0;
            if (!(this.LineData == null))
            {
                k = this.LineData.Intern;
            }
            Extern.Draw_LineSet(this.Intern, k);
        }
    }

    protected virtual Slash LineData { get; set; }

    public virtual Font Font
    {
        get
        {
            return this.FontData;
        }
        set
        {
            this.FontData = value;

            ulong k;
            k = 0;
            if (!(this.FontData == null))
            {
                k = this.FontData.Intern;
            }
            Extern.Draw_FontSet(this.Intern, k);
        }
    }

    protected virtual Font FontData { get; set; }

    public virtual Comp Comp
    {
        get
        {
            return this.CompData;
        }
        set
        {
            this.CompData = value;

            ulong k;
            k = 0;
            if (!(this.CompData == null))
            {
                k = this.CompData.Intern;
            }
            Extern.Draw_CompSet(this.Intern, k);
        }
    }

    protected virtual Comp CompData { get; set; }

    public virtual Form Form { get; set; }

    private InternIntern InternIntern { get; set; }
    private InternInfra InternInfra { get; set; }
    protected virtual MathInfra MathInfra { get; set; }
    protected virtual Infra DrawInfra { get; set; }
    protected virtual MathMath Math { get; set; }
    protected virtual MathComp MathComp { get; set; }
    protected virtual Form WorldForm { get; set; }
    protected virtual Pos PosA { get; set; }
    protected virtual long TextCount { get; set; }
    private ulong Intern { get; set; }
    private ulong InternFillPos { get; set; }
    private ulong InternArea { get; set; }
    private ulong InternSize { get; set; }
    private ulong InternPosB { get; set; }
    private ulong InternPosA { get; set; }
    private ulong InternRectB { get; set; }
    private ulong InternRectA { get; set; }
    private ulong InternRangeA { get; set; }
    private ulong InternText { get; set; }
    private ulong InternTextData { get; set; }

    public virtual bool Start()
    {
        Extern.Draw_OutSet(this.Intern, this.Out);
        Extern.Draw_Start(this.Intern);

        Rect area;
        area = this.Area;
        area.Pos.Col = 0;
        area.Pos.Row = 0;
        area.Size.Wed = this.Size.Wed;
        area.Size.Het = this.Size.Het;
        this.AreaSet();

        Pos pos;
        pos = this.Pos;
        pos.Col = 0;
        pos.Row = 0;
        this.PosSet();

        this.Fill = null;
        this.Line = null;
        this.Comp = null;
        this.Font = null;
        this.FillPos.Col = 0;
        this.FillPos.Row = 0;
        this.FillPosSet();
        this.Form = null;
        this.FormSet();
        return true;
    }

    public virtual bool End()
    {
        Extern.Draw_End(this.Intern);
        return true;
    }

    public virtual bool SizeSet()
    {
        ulong w;
        ulong h;
        w = (ulong)(this.Size.Wed);
        h = (ulong)(this.Size.Het);
        Extern.Size_WedSet(this.InternSize, w);
        Extern.Size_HetSet(this.InternSize, h);
        return true;
    }

    public virtual bool AreaSet()
    {
        this.InternRectSetFromRect(this.InternArea, this.Area);

        Extern.Draw_AreaThisSet(this.Intern);
        return true;
    }

    public virtual bool FillPosSet()
    {
        this.InternInfra.PosSet(this.InternFillPos, this.FillPos.Col, this.FillPos.Row);

        Extern.Draw_FillPosThisSet(this.Intern);
        return true;
    }

    public virtual bool PosSet()
    {
        this.PosA.Col = this.MathInt(this.Pos.Col);
        this.PosA.Row = this.MathInt(this.Pos.Row);
        this.DrawFormSet();
        return true;
    }

    public virtual bool FormSet()
    {
        this.DrawFormSet();
        return true;
    }

    protected virtual bool DrawFormSet()
    {
        this.WorldForm.Reset();

        this.WorldFormPosSet(this.PosA);

        if (!(this.Form == null))
        {
            this.WorldForm.Mul(this.Form);
        }

        Extern.Draw_FormSet(this.Intern, this.WorldForm.Intern);
        return true;
    }

    protected virtual bool WorldFormPosSet(Pos pos)
    {
        this.WorldForm.Pos(pos.Col, pos.Row);
        return true;
    }

    public virtual bool Clear(Color color)
    {
        ulong k;
        k = this.DrawInfra.InternColor(color);

        Extern.Draw_Clear(this.Intern, k);
        return true;
    }

    public virtual bool ExecuteRect(Rect rect)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        Extern.Draw_ExecuteRect(this.Intern, this.InternRectA);
        return true;
    }

    public virtual bool ExecuteRectRound(Rect rect, long colRadius, long rowRadius)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        ulong c;
        ulong r;
        c = (ulong)colRadius;
        r = (ulong)rowRadius;
        Extern.Draw_ExecuteRectRound(this.Intern, this.InternRectA, c, r);
        return true;
    }

    public virtual bool ExecuteRound(Rect rect)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        Extern.Draw_ExecuteRound(this.Intern, this.InternRectA);
        return true;
    }

    public virtual bool ExecuteRoundLine(Rect rect, Range range)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.InternRangeSetFromRange(this.InternRangeA, range);

        Extern.Draw_ExecuteRoundLine(this.Intern, this.InternRectA, this.InternRangeA);
        return true;
    }

    public virtual bool ExecuteRoundPart(Rect rect, Range range)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.InternRangeSetFromRange(this.InternRangeA, range);

        Extern.Draw_ExecuteRoundPart(this.Intern, this.InternRectA, this.InternRangeA);
        return true;
    }

    public virtual bool ExecuteRoundShape(Rect rect, Range range)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.InternRangeSetFromRange(this.InternRangeA, range);

        Extern.Draw_ExecuteRoundShape(this.Intern, this.InternRectA, this.InternRangeA);
        return true;
    }

    public virtual bool ExecuteLine(Pos startPos, Pos endPos)
    {
        this.InternPosSetFromPos(this.InternPosA, startPos);
        this.InternPosSetFromPos(this.InternPosB, endPos);

        Extern.Draw_ExecuteLine(this.Intern, this.InternPosA, this.InternPosB);
        return true;
    }

    public virtual bool ExecuteShape(PointList pointList)
    {
        ulong ka;
        ka = (ulong)pointList.Count;

        Extern.Draw_ExecuteShape(this.Intern, ka, pointList.Intern);
        return true;
    }

    public virtual bool ExecuteShapeLine(PointList pointList)
    {
        ulong ka;
        ka = (ulong)pointList.Count;

        Extern.Draw_ExecuteShapeLine(this.Intern, ka, pointList.Intern);
        return true;
    }

    public virtual bool ExecuteImage(Image image, Rect destRect, Rect sourceRect)
    {
        this.InternRectSetFromRect(this.InternRectA, destRect);
        this.InternRectSetFromRect(this.InternRectB, sourceRect);

        Extern.Draw_ExecuteImage(this.Intern, image.Intern, this.InternRectA, this.InternRectB);
        return true;
    }

    public virtual bool ExecuteText(TextText text, Align colAlign, Align rowAlign, bool wordWarp, Rect destRect)
    {
        if (this.TextCount < text.Range.Count)
        {
            return false;
        }

        this.TextSet(text);

        this.InternRectSetFromRect(this.InternRectA, destRect);

        ulong kaa;
        ulong kab;
        kaa = (ulong)colAlign.Index;
        kab = (ulong)rowAlign.Index;

        ulong wordWrapU;
        wordWrapU = 0;
        if (wordWarp)
        {
            wordWrapU = 1;
        }

        Extern.Draw_ExecuteText(this.Intern, this.InternText, kaa, kab, wordWrapU, this.InternRectA, this.InternRectB);
        return true;
    }

    private bool TextSet(TextText text)
    {
        long count;
        count = text.Range.Count;

        ulong countA;
        countA = (ulong)count;

        ulong dataCount;
        dataCount = countA * sizeof(uint);

        this.InternIntern.CopyFromByteArray(this.InternTextData, text.Data.Value, 0, dataCount);

        Extern.String_CountSet(this.InternText, countA);
        return true;
    }

    protected virtual long MathInt(long n)
    {
        long a;
        a = this.MathInfra.Int(this.MathComp, n);
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

    private bool InternRangeSetFromRange(ulong internRange, Range range)
    {
        this.InternInfra.RangeSet(internRange, range.Index, range.Count);
        return true;
    }

    private bool InternPosSetFromPos(ulong internPos, Pos pos)
    {
        this.InternInfra.PosSet(internPos, pos.Col, pos.Row);
        return true;
    }

    private bool InternRectSetFromRect(ulong internRect, Rect rect)
    {
        Pos pos;
        Size size;
        pos = rect.Pos;
        size = rect.Size;
        this.InternInfra.RectSet(internRect, pos.Col, pos.Row, size.Wed, size.Het);
        return true;
    }
}
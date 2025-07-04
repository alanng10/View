class Draw : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;
        this.MathInfra : share MathInfra;
        this.DrawInfra : share Infra;
        this.Math : share Math;

        this.Size : this.CreateSize();
        this.Area : this.CreateArea();
        this.Pos : this.CreatePos();
        this.FillPos : this.CreateFillPos();

        this.MathComp : this.CreateMathComp();

        this.PosA : this.CreatePosA();
        this.WorldForm : this.CreateWorldForm();

        this.TextCount : 1024;

        var Extern extern;
        extern : this.Extern;

        var Int ka;
        ka : this.TextCount;
        ka : ka * 4;
        this.InternTextData : extern.Environ_New(ka);

        this.InternText : extern.String_New();
        extern.String_Init(this.InternText);
        extern.String_ValueSet(this.InternText, this.InternTextData);
        extern.String_CountSet(this.InternText, 0);

        this.InternRangeA : this.InternInfra.RangeCreate();
        this.InternRectA : this.InternInfra.RectCreate();
        this.InternRectB : this.InternInfra.RectCreate();
        this.InternPosA : this.InternInfra.PosCreate();
        this.InternPosB : this.InternInfra.PosCreate();

        this.InternSize : this.InternInfra.SizeCreate();

        this.InternArea : this.InternInfra.RectCreate();

        this.InternFillPos : this.InternInfra.PosCreate();

        this.Intern : extern.Draw_New();
        extern.Draw_Init(this.Intern);
        extern.Draw_SizeSet(this.Intern, this.InternSize);
        extern.Draw_AreaSet(this.Intern, this.InternArea);
        extern.Draw_FillPosSet(this.Intern, this.InternFillPos);
        return true;
    }

    maide prusate Bool Final()
    {
        var Extern extern;
        extern : this.Extern;

        extern.Draw_Final(this.Intern);
        extern.Draw_Delete(this.Intern);

        this.InternInfra.PosDelete(this.InternFillPos);

        this.InternInfra.RectDelete(this.InternArea);

        this.InternInfra.SizeDelete(this.InternSize);

        this.InternInfra.PosDelete(this.InternPosB);
        this.InternInfra.PosDelete(this.InternPosA);
        this.InternInfra.RectDelete(this.InternRectB);
        this.InternInfra.RectDelete(this.InternRectA);
        this.InternInfra.RangeDelete(this.InternRangeA);

        extern.String_Final(this.InternText);
        extern.String_Delete(this.InternText);

        extern.Environ_Delete(this.InternTextData);

        this.FinalWorldForm(this.WorldForm);
        return true;
    }

    maide precate Size CreateSize()
    {
        var Size a;
        a : new Size;
        a.Init();
        return a;
    }

    maide precate Rect CreateArea()
    {
        var Rect a;
        a : new Rect;
        a.Init();
        a.Pos : new Pos;
        a.Pos.Init();
        a.Size : new Size;
        a.Size.Init();
        return a;
    }

    maide precate Pos CreatePos()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate Pos CreateFillPos()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate MathComp CreateMathComp()
    {
        var MathComp a;
        a : new MathComp;
        a.Init();
        return a;
    }

    maide precate Pos CreatePosA()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate Form CreateWorldForm()
    {
        var Form a;
        a : new Form;
        a.Init();
        return a;
    }

    maide precate Bool FinalWorldForm(var Form a)
    {
        a.Final();
        return true;
    }

    field prusate Any Out { get { return data; } set { data : value; } }
    field prusate Size Size { get { return data; } set { data : value; } }
    field prusate Rect Area { get { return data; } set { data : value; } }
    field prusate Pos Pos { get { return data; } set { data : value; } }
    field prusate Pos FillPos { get { return data; } set { data : value; } }

    field prusate Brush Fill
    {
        get
        {
            return data;
        }
        set
        {
            data : value;

            var Int k;
            k : 0;
            inf (~(data = null))
            {
                k : data.Intern;
            }
            this.Extern.Draw_FillSet(this.Intern, k);
        }
    }

    field prusate Slash Line
    {
        get
        {
            return data;
        }
        set
        {
            data : value;

            var Int k;
            k : 0;
            inf (~(data = null))
            {
                k : data.Intern;
            }
            this.Extern.Draw_LineSet(this.Intern, k);
        }
    }

    field prusate Font Font
    {
        get
        {
            return data;
        }
        set
        {
            data : value;

            var Int k;
            k : 0;
            inf (~(data = null))
            {
                k : data.Intern;
            }
            this.Extern.Draw_FontSet(this.Intern, k);
        }
    }

    field prusate Comp Comp
    {
        get
        {
            return data;
        }
        set
        {
            data : value;

            var Int k;
            k : 0;
            inf (~(data = null))
            {
                k : data.Intern;
            }
            this.Extern.Draw_CompSet(this.Intern, k);
        }
    }

    field prusate Form Form { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }
    field private InternInfra InternInfra { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate Infra DrawInfra { get { return data; } set { data : value; } }
    field precate Math Math { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field precate Form WorldForm { get { return data; } set { data : value; } }
    field precate Pos PosA { get { return data; } set { data : value; } }
    field precate Int TextCount { get { return data; } set { data : value; } }
    field private Int Intern { get { return data; } set { data : value; } }
    field private Int InternFillPos { get { return data; } set { data : value; } }
    field private Int InternArea { get { return data; } set { data : value; } }
    field private Int InternSize { get { return data; } set { data : value; } }
    field private Int InternPosB { get { return data; } set { data : value; } }
    field private Int InternPosA { get { return data; } set { data : value; } }
    field private Int InternRectB { get { return data; } set { data : value; } }
    field private Int InternRectA { get { return data; } set { data : value; } }
    field private Int InternRangeA { get { return data; } set { data : value; } }
    field private Int InternText { get { return data; } set { data : value; } }
    field private Int InternTextData { get { return data; } set { data : value; } }

    maide prusate Bool Start()
    {
        var Extern extern;
        extern : this.Extern;

        var Int k;
        k : cast Int(this.Out);

        extern.Draw_OutSet(this.Intern, k);
        extern.Draw_Start(this.Intern);

        var Rect area;
        area : this.Area;
        area.Pos.Col : 0;
        area.Pos.Row : 0;
        area.Size.Wed : this.Size.Wed;
        area.Size.Het : this.Size.Het;
        this.AreaSet();

        var Pos pos;
        pos : this.Pos;
        pos.Col : 0;
        pos.Row : 0;
        this.PosSet();

        this.Fill : null;
        this.Line : null;
        this.Comp : null;
        this.Font : null;
        this.FillPos.Col : 0;
        this.FillPos.Row : 0;
        this.FillPosSet();
        this.Form : null;
        this.FormSet();
        return true;
    }

    maide prusate Bool End()
    {
        this.Extern.Draw_End(this.Intern);
        return true;
    }

    maide prusate Bool SizeSet()
    {
        var Extern extern;
        extern : this.Extern;

        extern.Size_WedSet(this.InternSize, this.Size.Wed);
        extern.Size_WedSet(this.InternSize, this.Size.Het);
        return true;
    }

    maide prusate Bool AreaSet()
    {
        this.InternRectSetFromRect(this.InternArea, this.Area);

        this.Extern.Draw_AreaThisSet(this.Intern);
        return true;
    }

    maide prusate Bool FillPosSet()
    {
        this.InternInfra.PosSet(this.InternFillPos, this.FillPos.Col, this.FillPos.Row);

        this.Extern.Draw_FillPosThisSet(this.Intern);
        return true;
    }

    maide prusate Bool PosSet()
    {
        this.PosA.Col : this.MathInt(this.Pos.Col);
        this.PosA.Row : this.MathInt(this.Pos.Row);
        this.DrawFormSet();
        return true;
    }

    maide prusate Bool FormSet()
    {
        this.DrawFormSet();
        return true;
    }

    maide precate Bool DrawFormSet()
    {
        this.WorldForm.Reset();

        this.WorldFormPosSet(this.PosA);

        inf (~(this.Form = null))
        {
            this.WorldForm.Mul(this.Form);
        }

        this.Extern.Draw_FormSet(this.Intern, this.WorldForm.Intern);
        return true;
    }

    maide precate Bool WorldFormPosSet(var Pos pos)
    {
        this.WorldForm.Pos(pos.Col, pos.Row);
        return true;
    }

    maide prusate Bool Clear()
    {
        this.Extern.Draw_Clear(this.Intern);
        return true;
    }

    maide prusate Bool ExecuteRect(var Rect rect)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.Extern.Draw_ExecuteRect(this.Intern, this.InternRectA);
        return true;
    }

    maide prusate Bool ExecuteRectRound(var Rect rect, var Int colRadius, var Int rowRadius)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.Extern.Draw_ExecuteRectRound(this.Intern, this.InternRectA, colRadius, rowRadius);
        return true;
    }

    maide prusate Bool ExecuteRound(var Rect rect)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.Extern.Draw_ExecuteRound(this.Intern, this.InternRectA);
        return true;
    }
    
    maide prusate Bool ExecuteRoundLine(var Rect rect, var Range range)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.InternRangeSetFromRange(this.InternRangeA, range);

        this.Extern.Draw_ExecuteRoundLine(this.Intern, this.InternRectA, this.InternRangeA);
        return true;
    }

    maide prusate Bool ExecuteRoundPart(var Rect rect, var Range range)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.InternRangeSetFromRange(this.InternRangeA, range);

        this.Extern.Draw_ExecuteRoundPart(this.Intern, this.InternRectA, this.InternRangeA);
        return true;
    }

    maide prusate Bool ExecuteRoundShape(var Rect rect, var Range range)
    {
        this.InternRectSetFromRect(this.InternRectA, rect);

        this.InternRangeSetFromRange(this.InternRangeA, range);

        this.Extern.Draw_ExecuteRoundShape(this.Intern, this.InternRectA, this.InternRangeA);
        return true;
    }

    maide prusate Bool ExecuteLine(var Pos startPos, var Pos endPos)
    {
        this.InternPosSetFromPos(this.InternPosA, startPos);
        this.InternPosSetFromPos(this.InternPosB, endPos);

        this.Extern.Draw_ExecuteLine(this.Intern, this.InternPosA, this.InternPosB);
        return true;
    }

    maide prusate Bool ExecuteShape(var PointList pointList)
    {
        this.Extern.Draw_ExecuteShape(this.Intern, pointList.Count, pointList.Intern);
        return true;
    }

    maide prusate Bool ExecuteImage(var Image image, var Rect destRect, var Rect sourceRect)
    {
        this.InternRectSetFromRect(this.InternRectA, destRect);
        this.InternRectSetFromRect(this.InternRectB, sourceRect);

        this.Extern.Draw_ExecuteImage(this.Intern, image.Intern, this.InternRectA, this.InternRectB);
        return true;
    }

    maide prusate Bool ExecuteText(var Text text, var Align colAlign, var Align rowAlign, var Bool wordWrap, var Rect destRect, var Rect boundRect)
    {
        inf (this.TextCount < text.Range.Count)
        {
            return false;
        }

        this.TextSet(text);

        this.InternRectSetFromRect(this.InternRectA, destRect);

        var Int wordWrapK;
        wordWrapK = this.InternInfra.Bool(wordWrap);

        this.Extern.Draw_ExecuteText(this.Intern, this.InternText, colAlign.Index + 1, rowAlign.Index + 1, wordWrapK, this.InternRectA, this.InternRectB);

        inf (~(boundRect = null))
        {
            this.RectSetFromInternRect(boundRect, this.InternRectB);
        }
        return true;
    }

    maide private Bool TextSet(var Text text)
    {
        var Int count;
        count : text.Range.Count;

        var Int dataCount;
        dataCount : count * 4;

        this.InternInfra.CopyFromByteArray(this.InternTextData, text.Data.Value, 0, dataCount);

        this.Extern.String_CountSet(this.InternText, count);
        return true;
    }

    maide precate Int MathInt(var Int n)
    {
        var Int a;
        a : this.MathInfra.Int(this.MathComp, n);
        return a;
    }

    maide precate Int MathValue(var Int cand, var Int expo)
    {
        this.MathComp.Cand : cand;
        this.MathComp.Expo : expo;

        var Int a;
        a : this.Math.Value(this.MathComp);
        return a;
    }

    maide private Bool InternRangeSetFromRange(var Int internRange, var Range range)
    {
        this.InternInfra.RangeSet(internRange, range.Index, range.Count);
        return true;
    }

    maide private Bool InternPosSetFromPos(var Int internPos, var Pos pos)
    {
        this.InternInfra.PosSet(internPos, pos.Col, pos.Row);
        return true;
    }

    maide private Bool InternRectSetFromRect(var Int internRect, var Rect rect)
    {
        this.InternInfra.RectSet(internRect, rect.Pos.Col, rect.Pos.Row, rect.Size.Wed, rect.Size.Het);
        return true;
    }

    maide private Bool RectSetFromInternRect(var Rect rect, var Int internRect)
    {
        var Extern extern;
        extern : this.Extern;

        var Int pos;
        var Int size;
        pos : extern.Rect_PosGet(internRect);
        size : extern.Rect_SizeGet(internRect);

        var Int col;
        var Int row;
        col : extern.Pos_ColGet(pos);
        row : extern.Pos_RowGet(pos);

        var Int wed;
        var Int het;
        wed : extern.Size_WedGet(size);
        het : extern.Size_HetGet(size);

        rect.Pos.Col : col;
        rect.Pos.Row : row;
        rect.Size.Wed : wed;
        rect.Size.Het : het;
        return true;
    }
}
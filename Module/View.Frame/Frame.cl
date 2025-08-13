class Frame : Any
{
    maide private Bool PrivateTypeEvent(var Int index, var Int value)
    {
        var Bool b;
        b : ~(value = 0);

        var Bool ba;
        ba : index = 0h01000022;

        inf (ba)
        {
            inf (~(this.TypeIndexSystem = b))
            {
                this.TypeIndexSystem : b;
            }
        }

        inf (~ba)
        {
            inf (this.TypeIndexSystem)
            {
                inf (index = 0h20)
                {
                    inf (~(this.TypeIndexSystemSpace = b))
                    {
                        this.TypeIndexSystemSpace : b;

                        inf (this.TypeIndexSystemSpace)
                        {
                            this.IndexEvent(this.IndexInit.List);
                        }
                    }
                }
            }

            inf (~this.TypeIndexSystem)
            {
                var Int indexK;
                indexK : this.InternInfra.TypeIndexFromInternIndex(index);

                this.TypeEvent(indexK, b);
            }
        }
        return true;
    }

    maide private Bool PrivateDrawEvent()
    {
        var Draw draw;
        draw : this.Draw;

        draw.Start();

        this.DrawEvent();

        inf (this.TypeIndexSystem & this.TypeIndexSystemSpace)
        {
            this.IndexDraw();
        }

        draw.End();
        return true;
    }

    maide prusate Bool Init()
    {
        base.Init();
        this.InternIntern : share Intern;
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;
        this.ViewInfra : share ViewInfra;
        this.Math : share Math;
        this.IndexInit : share IndexInit;

        this.MathComp : this.CreateMathComp();

        var Int ka;
        var Int kb;
        ka : this.InternIntern.StateFrameTypeEvent();
        kb : this.InternIntern.StateFrameDrawEvent();
        var Int arg;
        arg : this.InternIntern.StateArgMemory(this);
        this.InternTypeState : this.InternInfra.StateCreate(ka, arg);
        this.InternDrawState : this.InternInfra.StateCreate(kb, arg);

        this.InternUpdateRect : this.InternInfra.RectCreate();

        var Extern extern;
        extern : this.Extern;

        this.Intern : extern.Frame_New();
        extern.Frame_Init(this.Intern);

        this.Title : "Frame";
        this.TitleSet();

        extern.Frame_TypeStateSet(this.Intern, this.InternTypeState);
        extern.Frame_DrawStateSet(this.Intern, this.InternDrawState);

        this.Out : extern.Frame_Out(this.Intern);

        this.Draw : this.CreateDraw();

        this.IndexBackRect : this.DrawInfra.RectCreate(0, 0, 0, 0);
        return true;
    }

    maide prusate Bool Final()
    {
        this.FinalDraw(this.Draw);

        var Extern extern;
        extern : this.Extern;

        extern.Frame_Final(this.Intern);
        extern.Frame_Delete(this.Intern);

        this.InternInfra.RectDelete(this.InternUpdateRect);

        this.InternInfra.StateDelete(this.InternDrawState);

        this.InternInfra.StateDelete(this.InternTypeState);
        return true;
    }

    maide precate MathComp CreateMathComp()
    {
        var MathComp a;
        a : new MathComp;
        a.Init();
        return a;
    }

    maide precate Draw CreateDraw()
    {
        var Screen screen;
        screen : share Screen;

        var Draw a;
        a : new Draw;
        a.Init();
        a.Out : this.Out;
        a.Size.Wed : screen.Size.Wed;
        a.Size.Het : screen.Size.Het;
        a.SizeSet();
        return a;
    }

    maide precate Bool FinalDraw(var Draw a)
    {
        a.Final();
        return true;
    }

    field prusate String Title { get { return data; } set { data : value; } }
    field prusate View View { get { return data; } set { data : value; } }
    field prusate Type Type { get { return data; } set { data : value; } }
    field prusate Any Out { get { return data; } set { data : value; } }
    field precate Draw Draw { get { return data; } set { data : value; } }

    field prusate Bool Shown
    {
        get
        {
            var Int k;
            k : this.Extern.Frame_ShownGet(this.Intern);
            var Bool a;
            a : ~(k = 0);
            return a;
        }
        set
        {
            var Int k;
            k : this.InternInfra.Bool(value);
            this.Extern.Frame_ShownSet(this.Intern, k);
        }
    }

    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field precate DrawRect DestRect { get { return data; } set { data : value; } }
    field precate DrawRect SourceRect { get { return data; } set { data : value; } }
    field private Intern InternIntern { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }
    field private InternInfra InternInfra { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate ViewInfra ViewInfra { get { return data; } set { data : value; } }
    field precate Math Math { get { return data; } set { data : value; } }
    field private IndexInit IndexInit { get { return data; } set { data : value; } }
    field private Int Intern { get { return data; } set { data : value; } }
    field private Int InternTitle { get { return data; } set { data : value; } }
    field private Int InternUpdateRect { get { return data; } set { data : value; } }
    field private Int InternDrawState { get { return data; } set { data : value; } }
    field private Int InternTypeState { get { return data; } set { data : value; } }
    field private Bool TypeIndexSystem { get { return data; } set { data : value; } }
    field private Bool TypeIndexSystemSpace { get { return data; } set { data : value; } }
    field private DrawRect IndexBackRect { get { return data; } set { data : value; } }

    maide prusate Bool TitleSet()
    {
        this.InternTitle : this.InternInfra.StringCreate(this.Title);

        var Extern extern;
        extern : this.Extern;

        extern.Frame_TitleSet(this.Intern, this.InternTitle);
        extern.Frame_TitleThisSet(this.Intern);
        extern.Frame_TitleSet(this.Intern, 0);

        this.InternInfra.StringDelete(this.InternTitle);
        return true;
    }

    maide precate Bool TypeEvent(var Int index, var Bool value)
    {
        inf (~(this.Type = null))
        {
            this.Type.Set(index, value);
        }
        return true;
    }

    maide precate Bool IndexEvent(var Array array)
    {
    }

    maide precate Bool DrawEvent()
    {
        var Draw draw;
        draw : this.Draw;

        draw.Clear();

        inf (this.ValidDrawView())
        {
            this.ExecuteDrawView(draw);
        }
        return true;
    }

    maide precate Bool ValidDrawView()
    {
        return ~(this.View = null);
    }

    maide precate Bool ExecuteDrawView(var Draw draw)
    {
        this.View.ExecuteDraw(draw);
        return true;
    }

    maide private Bool IndexDraw()
    {
        var Draw draw;
        draw : this.Draw;

        var DrawRect area;
        area : draw.Area;
        area.Pos.Col : 0;
        area.Pos.Row : 0;
        area.Size.Wed : draw.Size.Wed;
        area.Size.Het : draw.Size.Het;
        draw.AreaSet();

        var DrawPos pos;
        pos : draw.Pos;
        pos.Col : 0;
        pos.Row : 0;
        draw.PosSet();

        draw.Fill : this.IndexInit.BrushBack;
        draw.Line : null;
        draw.Comp : null;
        draw.Font : null;
        draw.FillPos.Col : 0;
        draw.FillPos.Row : 0;
        draw.FillPosSet();
        draw.Form : null;
        draw.FormSet();

        var DrawRect rectA;
        rectA : this.IndexBackRect;
        rectA.Pos.Col : this.MathInt(area.Pos.Col);
        rectA.Pos.Row : this.MathInt(area.Pos.Row);
        rectA.Size.Wed : this.MathInt(area.Size.Wed);
        rectA.Size.Het : this.MathInt(area.Size.Het);

        draw.ExecuteRect(rectA);

        draw.Fill : null;
        return true;
    }

    maide prusate Bool Update(var DrawRect rect)
    {
        this.InternInfra.RectSet(this.InternUpdateRect, 
            rect.Pos.Col, rect.Pos.Row, rect.Size.Wed, rect.Size.Het
        );

        this.Extern.Frame_Update(this.Intern, this.InternUpdateRect);
        return true;
    }

    maide prusate Bool Close()
    {
        this.Extern.Frame_Close(this.Intern);
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
}
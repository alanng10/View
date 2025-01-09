class Frame : Any
{
    maide private Bool PrivateTypeEvent(var Int index, var Int value)
    {
        var Bool b;
        b : ~(value = 0);

        var Int indexK;
        indexK : this.InternInfra.TypeIndexFromInternIndex(index);

        this.TypeEvent(indexK, b);
        return true;
    }

    maide private Bool PrivateDrawEvent()
    {
        this.DrawEvent();
        return true;
    }

    maide prusate Bool Init()
    {
        base.Init();
        this.InternIntern : share Intern;
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;
        this.MathInfra : share MathInfra;
        this.TextInfra : share TextInfra;
        this.DrawInfra : share DrawInfra;
        this.Math : share Math;

        this.MathComp : this.CreateMathComp();

        var Int ka;
        var Int kb;
        ka : this.InternIntern.StateFrameTypeEvent();
        kb : this.InternIntern.StateFrameDrawEvent();
        var Int arg;
        arg : this.InternIntern.Memory(this);
        this.InternTypeState : this.InternInfra.StateCreate(ka, arg);
        this.InternDrawState : this.InternInfra.StateCreate(kb, arg);

        this.InternUpdateRect : this.InternInfra.RectCreate();

        var Extern extern;
        extern : this.Extern;

        this.Intern : extern.Frame_New();
        extern.Frame_Init(this.Intern);

        this.Title : "Frame";
        this.TitleSet();

        var Int size;
        size : extern.Frame_SizeGet(this.Intern);
        var Int wed;
        var Int het;
        wed : extern.Size_WedGet(size);
        het : extern.Size_HetGet(size);
        this.Size : this.DrawInfra.SizeCreate(wed, het);

        extern.Frame_TypeStateSet(this.Intern, this.InternTypeState);
        extern.Frame_DrawStateSet(this.Intern, this.InternDrawState);

        this.DestRect : this.CreateDestRect();
        this.SourceRect : this.CreateSourceRect();

        this.DrawImage : this.CreateDrawImage();

        var Int k;
        k : extern.Frame_Out(this.Intern);
        
        this.FrameDraw : new DrawDraw;
        this.FrameDraw.Init();
        this.DrawSet(this.FrameDraw, k);

        this.Draw : this.CreateDraw();
        this.DrawSet(this.Draw, this.DrawImage.Out);

        this.DrawClearColor : this.CreateDrawClearColor();
        return true;
    }

    maide prusate Bool Final()
    {
        this.FinalDraw(this.Draw);

        this.FrameDraw.Final();
        
        this.FinalDrawImage(this.DrawImage);

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

    maide precate DrawRect CreateDestRect()
    {
        return this.CreateFrameRect();
    }

    maide precate DrawRect CreateSourceRect()
    {
        return this.CreateFrameRect();
    }

    maide precate DrawImage CreateDrawImage()
    {
        var DrawImage a;
        a : new DrawImage;
        a.Init();
        a.Size.Wed : this.Size.Wed;
        a.Size.Het : this.Size.Het;
        a.DataCreate();
        return a;
    }

    maide precate Bool FinalDrawImage(var DrawImage a)
    {
        a.Final();
        return true;
    }
}
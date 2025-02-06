namespace Demo;

class TypeA : Type
{
    public virtual Demo Demo { get; set; }
    public virtual long TitleIndex { get; set; }

    public override bool Event(TypeIndex index, bool value)
    {
        TypeIndex a;
        a = index;

        bool o;
        o = value;

        TypeIndexList d;
        d = this.Demo.Frame.Type.Index;

        if (a == d.AlphaB & o)
        {
            this.Demo.Frame.Close();
        }

        bool b;
        b = false;

        long k;
        k = 0;

        if (a == d.AlphaJ & o)
        {
            k = this.Demo.ViewA.Pos.Col;
            k = k - 10;
            this.Demo.ViewA.Pos.Col = k;
            b = true;
        }
        if (a == d.AlphaL & o)
        {
            k = this.Demo.ViewA.Pos.Col;
            k = k + 10;
            this.Demo.ViewA.Pos.Col = k;
            b = true;
        }
        if (a == d.AlphaI & o)
        {
            k = this.Demo.ViewA.Pos.Row;
            k = k - 10;
            this.Demo.ViewA.Pos.Row = k;
            b = true;
        }
        if (a == d.AlphaK & o)
        {
            k = this.Demo.ViewA.Pos.Row;
            k = k + 10;
            this.Demo.ViewA.Pos.Row = k;
            b = true;
        }

        if (a == d.AlphaU & o)
        {
            bool bo;
            bo = this.Demo.ViewA.Shown;
            bo = !bo;
            this.Demo.ViewA.Shown = bo;
            b = true;
        }

        if (a == d.AlphaF & o)
        {
            k = this.Demo.ViewA.RotateValue;
            k = k + 1;
            this.Demo.ViewA.RotateValue = k;
            b = true;
        }

        bool ba;
        ba = false;

        if (a == d.AlphaA & o)
        {
            k = this.Demo.ViewC.Pos.Col;
            k = k - 10;
            this.Demo.ViewC.Pos.Col = k;
            ba = true;
        }
        if (a == d.AlphaD & o)
        {
            k = this.Demo.ViewC.Pos.Col;
            k = k + 10;
            this.Demo.ViewC.Pos.Col = k;
            ba = true;
        }
        if (a == d.AlphaW & o)
        {
            k = this.Demo.ViewC.Pos.Row;
            k = k - 10;
            this.Demo.ViewC.Pos.Row = k;
            ba = true;
        }
        if (a == d.AlphaS & o)
        {
            k = this.Demo.ViewC.Pos.Row;
            k = k + 10;
            this.Demo.ViewC.Pos.Row = k;
            ba = true;
        }

        if (a == d.AlphaH & o)
        {
            bool baa;
            baa = this.Demo.Play.AudioOut.Muted;
            baa = !baa;
            this.Demo.Play.AudioOut.Muted = baa;
        }

        long scaleFactor;
        scaleFactor = 1 << 20;

        if (a == d.AlphaC & o)
        {
            k = this.Demo.Play.AudioOut.Volume;
            long ao;
            ao = this.Demo.MathValue(scaleFactor / 16, -20);

            k = this.Demo.Math.Add(k, ao);

            this.Demo.Play.AudioOut.Volume = k;
        }

        if (a == d.AlphaV & o)
        {
            k = this.Demo.Play.AudioOut.Volume;
            long ao;
            ao = this.Demo.MathValue(scaleFactor / 16, -20);

            k = this.Demo.Math.Sub(k, ao);

            this.Demo.Play.AudioOut.Volume = k;
        }

        if (a == d.AlphaE & o)
        {
            this.Demo.Play.Execute();
        }

        if (a == d.AlphaR & o)
        {
            this.Demo.Play.Pause();
        }

        if (a == d.AlphaG & o)
        {
            long kaaa;
            kaaa = this.Demo.Play.Pos;

            long kkaa;
            kkaa = kaaa + 10 * 1000;

            long time;
            time = this.Demo.Play.Time;
            if (time < kkaa)
            {
                kkaa = time;
            }

            this.Demo.Play.Pos = kkaa;
        }

        if (a == d.AlphaN & o)
        {
            String frameTitle;
            frameTitle = this.Demo.AddClear().AddS("View Demo ").Add(this.Demo.StringInt(this.TitleIndex)).AddResult();

            this.Demo.Frame.Title = frameTitle;
            this.Demo.Frame.TitleSet();

            this.TitleIndex = this.TitleIndex + 1;
        }

        if (b)
        {
            this.Demo.ViewInfra.AssignDrawRectValue(this.Demo.UpdateRect, this.Demo.ViewA.Area);

            this.Demo.Frame.EventDraw(this.Demo.UpdateRect);
        }

        if (ba)
        {
            this.Demo.ViewInfra.AssignDrawRectValue(this.Demo.UpdateRect, this.Demo.ViewC.Area);

            this.Demo.Frame.EventDraw(this.Demo.UpdateRect);
        }
        return true;
    }

    protected virtual String S(string o)
    {
        return this.Demo.S(o);
    }
}
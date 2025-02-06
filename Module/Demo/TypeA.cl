class TypeA : Type
{
    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate Int TitleIndex { get { return data; } set { data : value; } }

    field prusate Bool Event(var TypeIndex index, var Bool value)
    {
        var TypeIndex a;
        a : index;

        var Bool o;
        o : value;

        var TypeIndexList d;
        d : this.Demo.Frame.Type.Index;

        inf (a = d.AlphaB & o)
        {
            this.Demo.Frame.Close();
        }

        var Bool b;
        b : false;

        var Int k;

        inf (a = d.AlphaJ & o)
        {
            k : this.Demo.ViewA.Pos.Col;
            k : k - 10;
            this.Demo.ViewA.Pos.Col : k;
            b : true;
        }
        inf (a = d.AlphaL & o)
        {
            k : this.Demo.ViewA.Pos.Col;
            k : k + 10;
            this.Demo.ViewA.Pos.Col : k;
            b : true;
        }
        inf (a = d.AlphaI & o)
        {
            k : this.Demo.ViewA.Pos.Row;
            k : k - 10;
            this.Demo.ViewA.Pos.Row : k;
            b : true;
        }
        inf (a = d.AlphaK & o)
        {
            k : this.Demo.ViewA.Pos.Row;
            k : k + 10;
            this.Demo.ViewA.Pos.Row : k;
            b : true;
        }

        inf (a = d.AlphaU & o)
        {
            var Bool bo;
            bo : this.Demo.ViewA.Shown;
            bo : ~bo;
            this.Demo.ViewA.Shown : bo;
            b : true;
        }

        var Bool ba;
        ba : false;

        inf (a = d.AlphaA & o)
        {
            k : this.Demo.ViewC.Pos.Col;
            k : k - 10;
            this.Demo.ViewC.Pos.Col : k;
            ba : true; 
        }
        inf (a = d.AlphaD & o)
        {
            k : this.Demo.ViewC.Pos.Col;
            k : k + 10;
            this.Demo.ViewC.Pos.Col : k;
            ba : true; 
        }
        inf (a = d.AlphaW & o)
        {
            k : this.Demo.ViewC.Pos.Row;
            k : k - 10;
            this.Demo.ViewC.Pos.Row : k;
            ba : true; 
        }
        inf (a = d.AlphaS & o)
        {
            k : this.Demo.ViewC.Pos.Row;
            k : k + 10;
            this.Demo.ViewC.Pos.Row : k;
            ba : true; 
        }

        inf (a = d.AlphaH & o)
        {
            var Bool baa;
            baa : this.Demo.Play.AudioOut.Mute;
            baa : ~baa;
            this.Demo.Play.AudioOut.Mute : baa;
        }

        var Int scaleFactor;
        scaleFactor : bit <(1, 20);

        var Int ao;

        inf (a = d.AlphaC & o)
        {
            k : this.Demo.Play.AudioOut.Volume;

            ao : this.Demo.MathValue(scaleFactor / 16, 0 - 20);

            k : this.Demo.Math.Add(k, ao);

            this.Demo.Play.AudioOut.Volume : k;
        }

        inf (a = d.AlphaV & o)
        {
            k : this.Demo.Play.AudioOut.Volume;

            ao : this.Demo.MathValue(scaleFactor / 16, 0 - 20);

            k : this.Demo.Math.Sub(k, ao);

            this.Demo.Play.AudioOut.Volume : k;
        }

        inf (a = d.AlpheE & o)
        {
            this.Demo.Play.Execute();
        }

        inf (a = d.AlpheR & o)
        {
            this.Demo.Play.Pause();
        }
    }
}
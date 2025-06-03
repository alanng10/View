class TypeA : Type
{
    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate Int TitleIndex { get { return data; } set { data : value; } }

    maide prusate Bool Event(var TypeIndex index, var Bool value)
    {
        var TypeIndex a;
        a : index;

        var Bool o;
        o : value;

        var TypeIndexList d;
        d : this.Demo.Frame.Type.IndexList;

        inf (a = d.AlphaB & o)
        {
            this.Demo.Frame.Close();

            this.Demo.ThreadThis.Thread.Exit(0);
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

        inf (a = d.AlphaY & o)
        {
            this.Demo.ViewA.RotateValue : this.Demo.ViewA.RotateValue + 1;
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

        inf (a = d.AlphaM)
        {
            this.Demo.ViewC.Button.Focus : o;
            ba : true;
        }

        inf (a = d.AlphaN)
        {
            this.Demo.ViewC.Mark.Focus : o;
            ba : true;
        }

        var Int scaleFactor;
        scaleFactor : bit <(1, 20);

        inf (a = d.AlphaP & o)
        {
            var String frameTitle;
            frameTitle : this.Demo.AddClear().Add("View Demo ").Add(this.Demo.StringInt(this.TitleIndex)).AddResult();

            this.Demo.Frame.Title : frameTitle;
            this.Demo.Frame.TitleSet();

            this.TitleIndex : this.TitleIndex + 1;
        }

        inf (b)
        {
            this.Demo.ViewInfra.AssignDrawRectValue(this.Demo.UpdateRect, this.Demo.ViewA.Area);

            this.Demo.Frame.Update(this.Demo.UpdateRect);
        }

        inf (ba)
        {
            this.Demo.ViewInfra.AssignDrawRectValue(this.Demo.UpdateRect, this.Demo.ViewC.Area);

            this.Demo.Frame.Update(this.Demo.UpdateRect);
        }
        return true;
    }
}
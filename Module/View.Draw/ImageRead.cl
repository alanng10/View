class ImageRead : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;

        var Extern extern;
        extern : this.Extern;

        this.Intern : extern.ImageRead_New();
        extern.ImageRead_Init(this.Intern);
        return true;
    }

    maide prusate Bool Final()
    {
        var Extern extern;
        extern : this.Extern;

        extern.ImageRead_Final(this.Intern);
        extern.ImageRead_Delete(this.Intern);
        return true;
    }

    field prusate Stream Stream { get { return data; } set { data : value; } }
    field prusate Image Image { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }
    field private Int Intern { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var Int streamK;
        streamK : cast Int(this.Stream.Ident);

        var Extern extern;
        extern : this.Extern;

        extern.ImageRead_StreamSet(this.Intern, streamK);
        extern.ImageRead_ImageSet(this.Intern, this.Image.Intern);

        var Int k;
        k : extern.ImageRead_Execute(this.Intern);

        extern.ImageRead_ImageSet(this.Intern, 0);
        extern.ImageRead_StreamSet(this.Intern, 0);

        var Bool b;
        b : ~(k = 0);

        inf (b)
        {
            var Int ka;
            ka : extern.Image_SizeGet(this.Image.Intern);

            this.Image.Size.Wed : extern.Size_WedGet(ka);
            this.Image.Size.Het : extern.Size_HetGet(ka);
        }

        var Bool a;
        a : b;
        return a;
    }
}
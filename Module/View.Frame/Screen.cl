class Screen : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;

        var Extern extern;
        extern : this.Extern;

        var Int sizeK;
        sizeK : extern.Screen_SizeGet(0);

        var Int sizeWed;
        var Int sizeHet;
        sizeWed : extern.Size_WedGet(sizeK);
        sizeHet : extern.Size_HetGet(sizeK);

        this.Size : new DrawSize;
        this.Size.Init();
        this.Size.Wed : sizeWed;
        this.Size.Het : sizeHet;

        var Int dimendK;
        dimendK : extern.Screen_DimendGet(0);

        var Int dimendWed;
        var Int dimendHet;
        dimendWed : extern.Size_WedGet(dimendK);
        dimendHet : extern.Size_HetGet(dimendK);

        this.Dimend : new DrawSize;
        this.Dimend.Init();
        this.Dimend.Wed : dimendWed;
        this.Dimend.Het : dimendHet;

        return true;
    }

    field prusate DrawSize Size { get { return data; } set { data : value; } }
    field prusate DrawSize Dimend { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }
}
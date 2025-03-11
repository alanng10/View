class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.Math : share Math;
        this.StorageStatusList : share StorageStatusList;
        this.BrushInfra : share BrushInfra;
        this.BrushKindList : share BrushKindList;
        this.SlashLineList : share SlashLineList;
        this.SlashCapeList : share SlashCapeList;
        this.SlashJoinList : share SlashJoinList;

        this.PixelByteCount : 4;

        this.ColorCompMax : 0hff;

        var Color blackColor;
        blackColor : this.ColorCreate(this.ColorCompMax, 0, 0, 0);

        var Color whiteColor;
        whiteColor : this.ColorCreate(this.ColorCompMax, this.ColorCompMax, this.ColorCompMax, this.ColorCompMax);

        var Color zeroColor;
        zeroColor : this.ColorCreate(0, 0, 0, 0);

        var MathComp ka;
        ka : new MathComp;
        ka.Init();

        var Int k;
        k : this.MathInt(ka, 1);

        this.SlashBlack : this.SlashCreate(this.BrushCreate(blackColor), k);
        this.SlashWhite : this.SlashCreate(this.BrushCreate(whiteColor), k);
        this.SlashZero : this.SlashCreate(this.BrushCreate(zeroColor), k);

        this.ColorDarkGray : this.ColorCreate(0hff, 0h80, 0h80, 0h80);
        this.ColorGray : this.ColorCreate(0hff, 0ha0, 0ha0, 0ha0);
        this.ColorLiteGray : this.ColorCreate(0hff, 0hc0, 0hc0, 0hc0);
        this.ColorRed : this.ColorCreate(0hff, 0hff, 0h00, 0h00);
        this.ColorGreen : this.ColorCreate(0hff, 0h00, 0hff, 0h00);
        this.ColorBlue : this.ColorCreate(0hff, 0h00, 0h00, 0hff);
        this.ColorCyan : this.ColorCreate(0hff, 0h00, 0hff, 0hff);
        this.ColorMageta : this.ColorCreate(0hff, 0hff, 0h00, 0hff);
        this.ColorYellow : this.ColorCreate(0hff, 0hff, 0hff, 0h00);
        this.ColorDarkRed : this.ColorCreate(0hff, 0h80, 0h00, 0h00);
        this.ColorDarkGreen : this.ColorCreate(0hff, 0h00, 0h80, 0h00);
        this.ColorDarkBlue : this.ColorCreate(0hff, 0h00, 0h00, 0h80);
        this.ColorDarkCyan : this.ColorCreate(0hff, 0h00, 0h80, 0h80);
        this.ColorDarkMageta : this.ColorCreate(0hff, 0h80, 0h00, 0h80);
        this.ColorDarkYellow : this.ColorCreate(0hff, 0h80, 0h80, 0h00);

        this.FontAriaName : "Noto Sans";
        this.FontMonoName : "Cascadia Mono";
        return true;
    }

    field prusate Int PixelByteCount { get { return data; } set { data : value; } }
    field prusate Int ColorCompMax { get { return data; } set { data : value; } }
    field prusate Slash SlashBlack { get { return data; } set { data : value; } }
    field prusate Slash SlashWhite { get { return data; } set { data : value; } }
    field prusate Slash SlashZero { get { return data; } set { data : value; } }
    field prusate Color ColorDarkGray { get { return data; } set { data : value; } }
    field prusate Color ColorGray { get { return data; } set { data : value; } }
    field prusate Color ColorLiteGray { get { return data; } set { data : value; } }
    field prusate Color ColorRed { get { return data; } set { data : value; } }
    field prusate Color ColorGreen { get { return data; } set { data : value; } }
    field prusate Color ColorBlue { get { return data; } set { data : value; } }
    field prusate Color ColorCyan { get { return data; } set { data : value; } }
    field prusate Color ColorMageta { get { return data; } set { data : value; } }
    field prusate Color ColorYellow { get { return data; } set { data : value; } }
    field prusate Color ColorDarkRed { get { return data; } set { data : value; } }
    field prusate Color ColorDarkGreen { get { return data; } set { data : value; } }
    field prusate Color ColorDarkBlue { get { return data; } set { data : value; } }
    field prusate Color ColorDarkCyan { get { return data; } set { data : value; } }
    field prusate Color ColorDarkMageta { get { return data; } set { data : value; } }
    field prusate Color ColorDarkYellow { get { return data; } set { data : value; } }
    field prusate String FontAriaName { get { return data; } set { data : value; } }
    field prusate String FontMonoName { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate Math Math { get { return data; } set { data : value; } }
    field precate StorageStatusList StorageStatusList { get { return data; } set { data : value; } }
    field precate BrushKindList BrushKindList { get { return data; } set { data : value; } }
    field precate SlashLineList SlashLineList { get { return data; } set { data : value; } }
    field precate SlashCapeList SlashCapeList { get { return data; } set { data : value; } }
    field precate SlashJoinList SlashJoinList { get { return data; } set { data : value; } }
    field private BrushInfra BrushInfra { get { return data; } set { data : value; } }

    maide prusate Color ColorCreate(var Int alpha, var Int red, var Int green, var Int blue)
    {
        var Color a;
        a : new Color;
        a.Init();
        a.Alpha : alpha;
        a.Red : red;
        a.Green : green;
        a.Blue : blue;
        return a;
    }

    maide prusate Brush BrushCreate(var Color color)
    {
        var Brush a;
        a : new Brush;
        a.Kind : this.BrushKindList.Color;
        a.Color : color;
        a.Init();
        return a;
    }

    maide prusate Slash SlashCreate(var Brush brush, var Int size)
    {
        var Slash a;
        a : new Slash;
        a.Brush : brush;
        a.Line : this.SlashLineList.Solid;
        a.Size : size;
        a.Cape : this.SlashCapeList.Plane;
        a.Join : this.SlashJoinList.Miter;
        a.Init();
        return a;
    }

    maide pronate Bool ColorSet(var Color color, var Int internColor)
    {
        color.Blue : this.ColorSetComp(internColor, 0);
        color.Green : this.ColorSetComp(internColor, 1);
        color.Red : this.ColorSetComp(internColor, 2);
        color.Alpha : this.ColorSetComp(internColor, 3);
        return true;
    }

    maide private Int ColorSetComp(var Int internColor, var Int index)
    {
        return bit &(bit >(internColor, index * 8), 0hff);
    }

    maide pronate Int InternColor(var Color color)
    {
        return this.BrushInfra.InternColor(color);
    }

    maide prusate Int RateColorComp(var MathComp mathComp, var Int value)
    {
        var Int k;
        k : this.MathInt(mathComp, value);

        var Int ka;
        ka : this.MathInt(mathComp, 0hff);

        k : this.Math.Div(k, ka);

        k : this.BoundValue(k, this.MathInt(mathComp, 0), this.MathInt(mathComp, 1));

        return k;
    }

    maide prusate Int ColorCompRate(var MathComp mathComp, var Int value)
    {
        var Int ka;
        ka : this.MathInt(mathComp, 1);

        inf (value = ka)
        {
            return 0hff;
        }

        var Int kb;
        kb : this.MathInt(mathComp, 0h100);

        var Int k;
        k : this.Math.Mul(value, kb);

        k : this.Math.Floor(k);

        this.Math.Comp(mathComp, k);

        var Int ke;
        ke : bit >(mathComp.Cand, 0 - mathComp.Expo);

        var Int a;
        a : ke;
        return a;
    }

    maide prusate Bool ChromeColor(var MathComp mathComp, var Chrome result, var Color color)
    {
        var Int r;
        var Int g;
        var Int b;
        r : this.RateColorComp(mathComp, color.Red);
        g : this.RateColorComp(mathComp, color.Green);
        b : this.RateColorComp(mathComp, color.Blue);

        var Int max;
        max : this.MaxThree(r, g, b);

        var Int min;
        min : this.MinThree(r, g, b);

        var Int chroma;
        chroma : this.Math.Sub(max, min);

        var Int kind;
        var Int alpha;
        var Int value;

        var Int zero;
        zero : this.MathInt(mathComp, 0);

        inf (~(chroma = zero))
        {
            var Bool ba;
            ba : false;

            var Int ka;

            inf (~ba)
            {
                inf (max = r)
                {
                    ka : this.Math.Sub(g, b);

                    ka : this.Math.Div(ka, chroma);

                    var Bool baa;
                    baa : this.Math.Less(ka, zero);

                    inf (baa)
                    {
                        ka : this.Math.Add(ka, this.MathInt(mathComp, 6));

                        ka : this.BoundValue(ka, this.MathInt(mathComp, 5), this.MathInt(mathComp, 6));
                    }

                    inf (~baa)
                    {
                        ka : this.BoundValue(ka, zero, this.MathInt(mathComp, 1));
                    }

                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (max = g)
                {
                    ka : this.Math.Sub(b, r);

                    ka : this.Math.Div(ka, chroma);

                    ka : this.Math.Add(ka, this.MathInt(mathComp, 2));

                    ka : this.BoundValue(ka, this.MathInt(mathComp, 1), this.MathInt(mathComp, 3));

                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (max = b)
                {
                    ka : this.Math.Sub(r, g);

                    ka : this.Math.Div(ka, chroma);

                    ka : this.Math.Add(ka, this.MathInt(mathComp, 4));

                    ka : this.BoundValue(ka, this.MathInt(mathComp, 3), this.MathInt(mathComp, 5));

                    ba : true;
                }
            }

            var Int sixty;
            sixty : this.MathInt(mathComp, 60);

            ka : this.Math.Mul(ka, sixty);

            ka : this.BoundValue(ka, zero, this.MathInt(mathComp, 360));

            inf (ka = this.MathInt(mathComp, 360))
            {
                ka : zero;
            }

            kind : ka;
        }

        value : max;

        var Bool bb;
        bb : value = zero;

        inf (bb)
        {
            alpha : zero;
        }

        inf (~bb)
        {
            var Int kb;
            kb : this.Math.Div(chroma, value);

            kb : this.BoundValue(kb, zero, this.MathInt(mathComp, 1));

            alpha : kb;
        }

        result.Kind : kind;
        result.Alpha : alpha;
        result.Value : value;
        return true;
    }

    maide prusate Bool ColorChrome(var MathComp mathComp, var Color result, var Chrome chrome)
    {
        var Int kind;
        var Int alpha;
        var Int value;
        kind : chrome.Kind;
        alpha : chrome.Alpha;
        value : chrome.Value;

        var Int v0;
        var Int v1;
        var Int v2;
        var Int v3;
        var Int v4;
        var Int v5;
        var Int v6;
        v0 : this.MathInt(mathComp, 0);
        v1 : this.MathInt(mathComp, 1);
        v2 : this.MathInt(mathComp, 2);
        v3 : this.MathInt(mathComp, 3);
        v4 : this.MathInt(mathComp, 4);
        v5 : this.MathInt(mathComp, 5);
        v6 : this.MathInt(mathComp, 6);

        var Int ka;
        ka : this.Math.Mul(value, alpha);

        ka : this.BoundValue(ka, v0, v1);

        var Int chroma;
        chroma : ka;

        ka : this.Math.Div(kind, this.MathInt(mathComp, 60));

        ka : this.BoundValue(ka, v0, v6);

        inf (ka = v6)
        {
            ka : v0;
        }

        var Int kb;
        kb : this.Math.Div(ka, v2);

        kb : this.Math.Floor(kb);

        kb : this.Math.Mul(kb, v2);

        kb : this.Math.Sub(ka, kb);

        kb : this.Math.Sub(kb, v1);

        kb : this.Math.Abs(kb);

        kb : this.BoundValue(kb, v0, v1);

        kb : this.Math.Sub(v1, kb);

        kb : this.BoundValue(kb, v0, v1);

        kb : this.Math.Mul(kb, chroma);

        kb : this.BoundValue(kb, v0, chroma);

        var Int x;
        x : kb;

        var Int red;
        var Int green;
        var Int blue;

        inf (ka = v0 | (this.Math.Less(v0, ka) & this.Math.Less(ka, v1)))
        {
            red : chroma;
            green : x;
            blue : v0;
        }

        inf (ka = v1 | (this.Math.Less(v1, ka) & this.Math.Less(ka, v2)))
        {
            red : x;
            green : chroma;
            blue : v0;
        }

        inf (ka = v2 | (this.Math.Less(v2, ka) & this.Math.Less(ka, v3)))
        {
            red : v0;
            green : chroma;
            blue : x;
        }

        inf (ka = v3 | (this.Math.Less(v3, ka) & this.Math.Less(ka, v4)))
        {
            red : v0;
            green : x;
            blue : chroma;
        }

        inf (ka = v4 | (this.Math.Less(v4, ka) & this.Math.Less(ka, v5)))
        {
            red : x;
            green : v0;
            blue : chroma;
        }

        inf (ka = v5 | (this.Math.Less(v5, ka) & this.Math.Less(ka, v6)))
        {
            red : chroma;
            green : v0;
            blue : x;
        }

        var Int min;
        min : this.Math.Sub(value, chroma);

        min : this.BoundValue(min, v0, v1);

        red : this.Math.Add(red, min);

        green : this.Math.Add(green, min);

        blue : this.Math.Add(blue, min);

        red : this.BoundValue(red, v0, v1);

        green : this.BoundValue(green, v0, v1);

        blue : this.BoundValue(blue, v0, v1);

        result.Red : red;
        result.Green : green;
        result.Blue : blue;
        return true;
    }

    maide prusate Bool ChromeValueLite(var MathComp mathComp, var Chrome chrome, var Int percent)
    {
        var Int ka;
        ka : this.MathInt(mathComp, percent);

        var Int v0;
        var Int v1;
        var Int v100;
        v0 : this.MathInt(mathComp, 0);
        v1 : this.MathInt(mathComp, 1);
        v100 : this.MathInt(mathComp, 100);

        ka : this.Math.Div(ka, v100);

        var Int k;
        k : this.Math.Mul(chrome.Value, ka);

        ka : chrome.Alpha;

        inf (this.Math.Less(v1, k))
        {
            var Int kb;
            kb : this.Math.Sub(k, v1);

            ka : this.Math.Sub(ka, kb);
        }

        ka : this.BoundValue(ka, v0, v1);

        k : this.BoundValue(k, v0, v1);

        chrome.Alpha : ka;
        chrome.Value : k;
        return true;
    }

    maide prusate Int ChromeValueDarkPercent(var Int percent)
    {
        inf (percent = 0)
        {
            return 0;
        }

        return 100 * 100 / percent;
    }

    maide prusate Bool ColorMix(var Color result, var Color lite, var Color rite)
    {
        result.Alpha : this.Mean(lite.Alpha, rite.Alpha);
        result.Red : this.Mean(lite.Red, rite.Red);
        result.Green : this.Mean(lite.Green, rite.Green);
        result.Blue : this.Mean(lite.Blue, rite.Blue);
        return true;
    }

    maide prusate Int Mean(var Int ka, var Int kb)
    {
        return (ka + kb) / 2;
    }

    maide prusate Int MaxThree(var Int ka, var Int kb, var Int kc)
    {
        var Int k;
        k : ka;

        inf (this.Math.Less(k, kb))
        {
            k : kb;
        }

        inf (this.Math.Less(k, kc))
        {
            k : kc;
        }

        var Int a;
        a : k;
        return a;
    }

    maide prusate Int MinThree(var Int ka, var Int kb, var Int kc)
    {
        var Int k;
        k : ka;

        inf (this.Math.Less(kb, k))
        {
            k : kb;
        }

        inf (this.Math.Less(kc, k))
        {
            k : kc;
        }

        var Int a;
        a : k;
        return a;
    }

    maide prusate Int BoundValue(var Int value, var Int min, var Int max)
    {
        var Int k;
        k : value;

        inf (this.Math.Less(k, min))
        {
            k : min;
        }

        inf (this.Math.Less(max, k))
        {
            k : max;
        }

        var Int a;
        a : k;
        return a;
    }

    maide prusate Int MathInt(var MathComp mathComp, var Int n)
    {
        return this.MathInfra.Int(mathComp, n);
    }

    maide prusate Pos PosCreate(var Int col, var Int row)
    {
        var Pos a;
        a : new Pos;
        a.Init();
        a.Col : col;
        a.Row : row;
        return a;
    }

    maide prusate Size SizeCreate(var Int wed, var Int het)
    {
        var Size a;
        a : new Size;
        a.Init();
        a.Wed : wed;
        a.Het : het;
        return a;
    }

    maide prusate Rect RectCreate(var Int col, var Int row, var Int wed, var Int het)
    {
        var Rect a;
        a : new Rect;
        a.Init();
        a.Pos : this.PosCreate(col, row);
        a.Size : this.SizeCreate(wed, het);
        return a;
    }

    maide prusate Image ImageCreateSize(var Size size)
    {
        var Image a;
        a : new Image;
        a.Init();
        a.Size.Wed : size.Wed;
        a.Size.Het : size.Het;
        a.DataCreate();
        return a;
    }

    maide prusate Image ImageCreateStorage(var String path)
    {
        var Image k;

        var Storage storage;
        storage : new Storage;
        storage.Init();
        var StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Read : true;
        storage.Path : path;
        storage.Mode : mode;

        storage.Open();

        inf (storage.Status = this.StorageStatusList.NoError)
        {
            var Stream stream;
            stream : storage.Stream;

            var Image ka;
            ka : new Image;
            ka.Init();

            var ImageRead imageRead;
            imageRead : new ImageRead;
            imageRead.Init();
            imageRead.Stream : stream;
            imageRead.Image : ka;

            var Bool b;
            b : imageRead.Execute();
            inf (b)
            {
                k : ka;
            }
            inf (~b)
            {
                ka.Final();
            }
            imageRead.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    maide prusate Bool ImageWrite(var String path, var Image image, var ImageFormat format)
    {
        var Storage storage;
        storage : new Storage;
        storage.Init();
        var StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Write : true;
        storage.Path : path;
        storage.Mode : mode;
        storage.Open();

        var Bool k;
        k : false;
        inf (storage.Status = this.StorageStatusList.NoError)
        {
            var Stream stream;
            stream : storage.Stream;

            var ImageWrite imageWrite;
            imageWrite : new ImageWrite;
            imageWrite.Init();
            imageWrite.Stream : stream;
            imageWrite.Image : image;
            imageWrite.Format : format;
            k : imageWrite.Execute();
            imageWrite.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    maide prusate Bool BoundArea(var Rect area, var Rect bound)
    {
        var Int lite;
        lite : area.Pos.Col;
        var Int nite;
        nite : area.Pos.Row;
        var Int wed;
        wed : area.Size.Wed;
        var Int het;
        het : area.Size.Het;
        var Int rite;
        rite : lite + wed;
        var Int site;
        site : nite + het;

        var Int boundLite;
        var Int boundNite;
        boundLite : bound.Pos.Col;
        boundNite : bound.Pos.Row;
        var Int boundRite;
        var Int boundSite;
        boundRite : boundLite + bound.Size.Wed;
        boundSite : boundNite + bound.Size.Het;

        inf (lite < boundLite)
        {
            lite : boundLite;
        }
        inf (nite < boundNite)
        {
            nite : boundNite;
        }
        inf (boundRite < rite)
        {
            rite : boundRite;
        }
        inf (boundSite < site)
        {
            site : boundSite;
        }

        var Int w;
        w : this.BoundSub(rite, lite);
        var Int h;
        h : this.BoundSub(site, nite);

        area.Pos.Col : lite;
        area.Pos.Row : nite;
        area.Size.Wed : w;
        area.Size.Het : h;
        return true;
    }

    maide precate Int BoundSub(var Int lite, var Int rite)
    {
        var Int k;
        k : 0;
        inf (~(lite < rite))
        {
            k : lite - rite;
        }
        return k;
    }
}
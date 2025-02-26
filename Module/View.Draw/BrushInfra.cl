class BrushInfra : Any
{
    maide pronate Int InternColor(var Color color)
    {
        var Int k;
        k : 0;
        k : bit |(k, this.InternColorComp(color.Blue, 0));
        k : bit |(k, this.InternColorComp(color.Gren, 1));
        k : bit |(k, this.InternColorComp(color.Red, 2));
        k : bit |(k, this.InternColorComp(color.Alpha, 3));
        return k;
    }

    maide private Int InternColorComp(var Int comp, var Int index)
    {
        return bit <(bit &(comp, 0hff), index * 8); 
    }
}
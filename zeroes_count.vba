Sub ColCheck()

Dim ColNum, rCount, i As Long
Dim OneArray, TwoArray As Variant

rCount = Sheet2.Range("A" & Rows.Count).End(xlUp).Row

i = 2

Do While i <= rCount

OneArray = ""
TwoArray = ""

For Each cell In Sheet2.Range("B" & i & ":K" & i)
    If cell.Value = -1 And OneArray = "" Then
        OneArray = cell.Column
    ElseIf cell.Value = -1 And OneArray <> "" Then
        OneArray = OneArray & ", " & cell.Column
    End If
Next


For Each cell In Sheet2.Range("B" & i & ":K" & i)
    If cell.Value = 1 And TwoArray = "" Then
        TwoArray = cell.Column
    ElseIf cell.Value = 1 And TwoArray <> "" Then
        TwoArray = TwoArray & ", " & cell.Column
    End If
Next

If OneArray = "" Then OneArray = "No value found"
If TwoArray = "" Then TwoArray = "No value found"

With Sheet2
    .Range("M1").Value = "-1 Position"
    .Range("M" & i).Value = OneArray
    .Range("N1").Value = "1 Position"
    .Range("N" & i).Value = TwoArray
End With

i = i + 1


Loop

End Sub

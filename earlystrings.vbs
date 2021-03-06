'================================================================================
'= Glory in the hightest to God, and on the earth piece, in humans benevolence.
'================================================================================
 

' 2000 Antonin Foller, http://www.motobit.com
Function str2bin(MultiByte)
  ' MultiByteToBinary converts multibyte string To real binary data (VT_UI1 | VT_ARRAY)
  ' Using recordset
  Dim RS, LMultiByte, Binary
  Const adLongVarBinary = 205
  Set RS = CreateObject("ADODB.Recordset")
  LMultiByte = LenB(MultiByte)
  If LMultiByte>0 Then
    RS.Fields.Append "mBinary", adLongVarBinary, LMultiByte
    RS.Open
    RS.AddNew
      RS("mBinary").AppendChunk MultiByte & ChrB(0)
    RS.Update
    Binary = RS("mBinary").GetChunk(LMultiByte)
  End If
  str2bin = Binary
  set rs=nothing
End Function


Function bin2str(S)
  Dim I, B
  B=""
  For I = 1 To LenB(S)
    B = B + Chr(AscB(MidB(S, I, 1)))
  Next
  bin2str = B
End Function



Function StrBegin(str, begin)
	StrBegin=RegExTest(str, "^" & begin)
End Function

Function StrEnd(str, ending)
	StrEnd=RegExTest(str, ending & "$")
End function

'=====================================================================================



'Function DisplayXmlText(xmlUrl)
'	xml.async=false
'	xml.load xmlurl
'	echo xml.text
'End Function

Function RegExTest(str, pattern)
	regex.pattern=pattern
	RegExTest=regex.test(str)
End function

Function RegExReplace(str, pattern, patch)
	regex.Pattern=pattern
	RegExReplace=regex.Replace (str, patch)
End Function

Function RegExMatch(source, pattern)
	regex.Pattern=pattern
	Set matches=regex.Execute(source)
	If matches.count Then
		RegExMatch=matches(0).Value
	Else
		RegExMatch=""
	End if
End Function

Function RegExSubMatch(source, pattern)
	regex.Pattern=pattern
	Set matches=regex.Execute(source)
	If matches.count Then
		RegExSubMatch=matches(0).submatches(0)
	Else
		RegExSubMatch=""
	End If
End Function

Function RegExMatches(source, pattern)
	regex.Pattern=pattern
	Set RegExMatches=regex.Execute(source)
End Function


Function Transcribe(word)
	For Each c In regexmatches(word, ".")
		echo c.value, Hex(ascw(c.value))
	Next
End Function

If False Then
	Set fso = CreateObject("scripting.filesystemobject")
	Set wShell = CreateObject("WScript.Shell")
	Set shApp = CreateObject("Shell.Application")
	
	Set xmlHttp = CreateObject("MSXML2.ServerXMLHTTP.6.0")
	'Set oStream = CreateObject("ADODB.Stream")
	'Set ie = CreateObject("InternetExplorer.Application")
	
	Set xml = CreateObject("MSXML2.DomDocument.6.0") 
End If

Set regEx = CreateObject("VBScript.RegExp") 
regEx.Global = True
regex.IgnoreCase=True

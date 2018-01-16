<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl"
xmlns:html="http://www.w3.org/Profiles/XHTML-transitional" xmlns:kyss="http://user.shikoku.ne.jp/kyss/" xml:lang="ja">

<xsl:template match="/">
<html lang="ja" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<title><xsl:value-of select="html/head/kyss:管理情報/kyss:コンテンツタイトル" /><xsl:value-of select="html/head/kyss:管理情報/kyss:コーナタイトル" /></title>

<OBJECT ID="kyss1" WIDTH="11" HEIGHT="11"
 CLASSID="CLSID:D7A7D7C3-D47F-11D0-89D3-00A0C90833E6">
    <PARAM NAME="Autostart" VALUE="0" />
    <PARAM NAME="Bounce" VALUE="0" />
    <PARAM NAME="Direction" VALUE="0" />
    <PARAM NAME="Duration" VALUE="15" />
    <PARAM NAME="Repeat" VALUE="0" />
    <PARAM NAME="Target" VALUE="hotaru3" />
    <PARAM NAME="Relative" VALUE="-1" />
    <PARAM NAME="TimerInterval" VALUE="0.001" />
    <PARAM NAME="Shape" VALUE="spline(10,0,0,300,-400,150,-250,450,-250,600,-350,200,-200,300,-450,50,-400,650,-300,0,-500)" />
</OBJECT>

<object id="VMLRender" classid="CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E"></object>

<style>
v\:* { behavior: url(#VMLRender); }
</style>

<script type="text/vbscript">
<xsl:comment><![CDATA[
option explicit
dim no,timer1,selnode,patternstring
dim fire,hotaruno,hotarucount,yokokumoji
dim ennno,timer2,textheight,mojino,openno
dim treeno,imageno
dim openno2,kysstimer
sub window_onload()
	textheight=0
	imageno=0
	hotaruno=0
	ennno=0
	mojino=0
	hotarucount=0
	fire=0
	openno=0
	openno2=0
	treeno=0
	
	patternstring="html/body/kyss:予告"
	set selnode=document.XMLDocument.selectNodes(patternstring)
	yokokumoji=selnode(0).text

	patternstring="html/body/kyss:グラフィックス/kyss:背景/kyss:フィル/kyss:タイプ"
	set selnode=document.XMLDocument.selectNodes(patternstring)
	kyss.type=selnode(0).text
	kysstree.type=selnode(0).text
	no=0
	timer1=window.setinterval("opengo()",10)
	'timer1=window.setinterval("go()",10)
	'call opengo()
end sub


sub opengo()
	if imageno>=250 then
		window.clearinterval(timer1)
		imageno=250
		riverimage1.style.margintop=-250+imageno
		riverimage1.style.marginleft=-500+imageno

		riverimage2.style.margintop=-250+imageno
		riverimage2.style.marginleft=250-imageno

		riverimage3.style.margintop=450-imageno
		riverimage3.style.marginleft=-500+imageno

		riverimage4.style.margintop=450-imageno
		riverimage4.style.marginleft=250-imageno
		
		'call opengogo2()
		 button1.style.display=""
		'exit sub
	else
		riverimage1.style.margintop=-250+imageno
		riverimage1.style.marginleft=-500+imageno

		riverimage2.style.margintop=-250+imageno
		riverimage2.style.marginleft=250-imageno

		riverimage3.style.margintop=450-imageno
		riverimage3.style.marginleft=-500+imageno

		riverimage4.style.margintop=450-imageno
		riverimage4.style.marginleft=250-imageno

		imageno=imageno+5
	end if
end sub

sub opengogo2()
		button1.style.display="none"
		kysstimer=window.settimeout("opengogo2()",200,"VBScript")
	if imageno<=0 then
		window.clearinterval(kysstimer)

		imageno=0
		riverimage1.style.margintop=-250+imageno
		riverimage1.style.marginleft=-500+imageno

		riverimage2.style.margintop=-250+imageno
		riverimage2.style.marginleft=250-imageno

		riverimage3.style.margintop=450-imageno
		riverimage3.style.marginleft=-500+imageno

		riverimage4.style.margintop=450-imageno
		riverimage4.style.marginleft=250-imageno
		imagegazou.style.display="none"
		call opengo2()
		exit sub
	else
		riverimage1.style.margintop=-250+imageno
		riverimage1.style.marginleft=-500+imageno

		riverimage2.style.margintop=-250+imageno
		riverimage2.style.marginleft=250-imageno

		riverimage3.style.margintop=450-imageno
		riverimage3.style.marginleft=-500+imageno

		riverimage4.style.margintop=450-imageno
		riverimage4.style.marginleft=250-imageno

		imageno=imageno-5
	end if

		
end sub




'sub opengo()
'	mainopen.filters(0).apply()
'	mainopen.style.visibility="visible"
'	mainopen.filters(0).play()
'end sub

'sub mainopen_onFilterChange()
'	if openno>0 then
'		mainopen.filters(0).stop()
'		mainopen.style.visibility="hidden"
'		mainopen.style.display="none"
'		call opengo2()
'		exit sub
'	else
'		openno=openno+1
'		call opengo()
'	end if
'end sub

sub opengo2()
	mainopen2.filters(0).apply()
	mainopen2.style.visibility="visible"
	mainopen2.filters(0).play()
end sub

sub mainopen2_onFilterChange()
	if openno2>0 then
		mainopen2.filters(0).stop()
		timer1=window.setinterval("go()",10)
		exit sub
	else
		openno2=openno2+1
		call opengo2()
	end if
end sub


sub go()
	if no>=360 then	
		no=360
		hotaruno=hotaruno+1
		if hotaruno>1 then
			window.clearinterval(timer1)
			hotaru1.style.visibility="visible"
			timer1=window.setinterval("hotarugo()",20)
			exit sub 
		else
			timer1=window.setinterval("go2()",10)
			
		end if
	else
		kysstree.angle=no
		no=no+5
	end if
end sub

sub go2()
	if no<=0 then	
		no=0
		window.clearinterval(timer1)
		timer1=window.setinterval("go()",10)
		exit sub
	else
		kysstree.angle=no
		no=no-5
	end if	
end sub

sub hotarugo()
	if fire>=20 then
		hotarucount=hotarucount+1

			select case hotarucount
				case 10
					fire=5
					hotaru2.style.visibility="visible"
				case 20
					fire=15
					hotaru3.style.visibility="visible"
				case 30
					fire=25
					call hotaru3_go()
					exit sub
			end select
	
		fire=20
		window.clearinterval(timer1)
		timer1=window.setinterval("hotarugo2()",10)
		exit sub
	else
		hotaru1.filters.glow.strength=fire
		hotaru2.filters.glow.strength=fire
		hotaru3.filters.glow.strength=fire
		fire=fire+2	
	end if
end sub

sub hotarugo2()
	if fire<=0 then
		fire=0
		window.clearinterval(timer1)
		timer1=window.setinterval("hotarugo()",20)
		exit sub
	else
		hotaru1.filters.glow.strength=fire
		hotaru2.filters.glow.strength=fire
		hotaru3.filters.glow.strength=fire
		fire=fire-2	
	end if
end sub

sub hotaru3_go()
   kyss1.repeat=1
   kyss1.addtimemarker 15,"kkk1",false
   kyss1.play()
end sub

sub kyss1_onplaymarker(kkk1)
	kyss1.stop()
	kyss1.style.display="none"
	window.clearinterval(timer1)
 	all_hotaru.style.display="none"
	imagegazou.style.display="none"
	imagegazou.style.visibility="hidden"
	ennno=0	
	kyss1.Stop()
	call enn_enter()
	
end sub

sub enn_enter()
	timer2=window.setinterval("enngo()",10)
end sub

sub enngo()
	if ennno>=1000 then
		ennno=1000
		window.clearinterval(timer2)
		window.clearinterval(timer1)
		kyss1.stop()
		enn.style.display="none"
		enn2.style.display="none"
		honntai.style.backgroundcolor="black"
		textbox1.style.display=""
		treegazou.style.display="none"
		timer2=window.setinterval("textgo()",10)
		'call tree()
		exit sub
	end if
		enn.style.width=ennno
		enn.style.height=ennno
		enn2.style.width=ennno
		enn2.style.height=ennno
		ennno=ennno+10
end sub

'sub tree()
'	mainopen2.style.visibility="visible"
'	treegazou.style.display=""
'	maku.style.display=""
'	window.clearinterval(timer2)
'	timer2=window.setinterval("makuup()",10)
'	exit sub
'end sub

'sub makuup()
'	if treeno>=400 then
'		window.clearinterval(timer2)
'		maku.style.display="none"
'		exit sub
'	end if
'		maku.style.margintop=treeno
'		treeno=treeno+5
'end sub

sub textgo()
	if textheight>=500 then
		textheight=500
		window.clearinterval(timer2)
		yokoku.style.display=""
		yokoku.innerHTML=yokokumoji
		timer2=window.setinterval("mojigo()",10)
		exit sub
	end if
		moji.style.height=textheight
		textheight=textheight+5
end sub

sub mojigo()
	if mojino>=100 then
		mojino=100
		window.clearinterval(timer2)
		exit sub
	end if
		yokoku.filters.alpha.opacity=mojino
		mojino=mojino+1
end sub

]]></xsl:comment>
</script>
</head>

<body id="honntai" bgcolor="black" topmargin="150" leftmargin="0">


<div align="center">

<div id="treegazou" style="visibility:hidden">
<v:rect style='margin-left:-250;width:490px;height:390px;position:absolute' fillcolor="#8a2be2">
	<xsl:apply-templates select="html/body/kyss:グラフィックス/kyss:背景/kyss:フィル/kyss:画像[index()='1']" />
<v:fill id="kysstree" angle="0" color2="black"  type="" />
</v:rect>
</div>



<div id="imagegazou">
<v:rect style='margin-left:-250;width:490px;height:390px;position:absolute' fillcolor="#66cdaa">

<!--
	<xsl:apply-templates select="html/body/kyss:グラフィックス/kyss:背景/kyss:フィル/kyss:画像[index()='0']" />
-->

<v:image id="riverimage1" style='position:absolute;margin-top:-250;margin-left:-500;width:250;height:200' src="river.gif" cropbottom="0.5" cropright="0.5" />

<v:image id="riverimage2" style='position:absolute;margin-left:250;margin-top:-250;width:250;height:200' src="river.gif" cropbottom="0.5" cropleft="0.5" />

<v:image id="riverimage3" style='margin-left:-500;margin-top:450;position:absolute;width:250;height:200' src="river.gif" croptop="0.5" cropright="0.5" />

<v:image id="riverimage4" style='margin-top:450;margin-left:250;position:absolute;width:250;height:200' src="river.gif" croptop="0.5" cropleft="0.5" />

<v:fill id="kyss" angle="0" color2="#dc143c"  type="" />
</v:rect>
</div>

<div align="center">
<button id="button1" onclick="opengogo2()" style="background-color:black;color:white;margin-top:-50;display:none;font-family:Verdana;font-size:11pt;">What's your Nostalgia?</button>
</div>



</div>

<div id="all_hotaru">
<div id="hotaru1" style="visibility:hidden;margin-left:500;margin-top:300;text-align:center;width:30%;filter:glow(color=#adff2f,strength=0);position:relative;font-size:8pt;color:gray">●</div>

<div id="hotaru2" style="visibility:hidden;margin-left:400;margin-top:10;text-align:center;width:30%;filter:glow(color=#adff2f,strength=0);position:relative;font-size:8pt;color:gray">●</div>

<div id="hotaru3" style="visibility:hidden;top:490;left:10;text-align:center;width:30%;filter:glow(color=#adff2f,strength=0);position:absolute;font-size:8pt;color:gray">●</div>
</div>

<div align="center">
<v:arc id="enn" style='position:absolute;margin-left:-450;margin-top:-200;width:0;height:0' startangle="0" endangle="360" fillcolor="#ffffaa" strokecolor="white" strokeweight="2pt">
<v:arc id="enn2" style='position:absolute;margin-left:-450;margin-top:-250;width:0;height:0' startangle="0" endangle="360" fillcolor="black" strokecolor="black" strokeweight="1pt" />
</v:arc>
</div>

<div align="center">
<div id="textbox1" style="display:none;font-family:ＭＳ Ｐゴシック;font-size:11pt;color:black;line-height:16pt">
<v:rect id="moji" style='width:350;height:0;' fillcolor="#b0c4de">
<v:fill type="gradient" color2="black" angle="180" />
<v:textbox style='text-align:left'>
<xsl:apply-templates select="html/body/kyss:テクスト" />
<div id="yokoku" style="display:none;width:100%;filter:alpha(opacity=0);font-family:ＭＳ Ｐゴシック;font-size:11pt;color:white;font-weight:bold"></div>
</v:textbox>
</v:rect>
</div>
</div>

<!--
<v:rect id="maku" style='margin-top:0;width:1000;height:600;position:absolute;display:none' fillcolor="black">
<v:fill angle="180" color2="gray" type="gradient" />
</v:rect>
-->

</body>
</html>
</xsl:template>

<xsl:template match="html/body/kyss:テクスト|div|p|br">
	<xsl:copy>
		<xsl:apply-templates select="*|@*|text()" />
	</xsl:copy>
</xsl:template>

<xsl:template match="*/@*">
	<xsl:copy>
		<xsl:apply-templates select="text()" />
	</xsl:copy>
</xsl:template>

<!--
<xsl:template match="html/body/kyss:グラフィックス/kyss:背景/kyss:フィル/kyss:画像[index()='0']">
	<img id="mainopen" width="500" height="350" border="0" alt="river" style="visibility:hidden;filter:RevealTrans(duration=5,transition=3)">
		<xsl:attribute name="src"><xsl:value-of /></xsl:attribute>
	</img>
</xsl:template>
-->

<xsl:template match="html/body/kyss:グラフィックス/kyss:背景/kyss:フィル/kyss:画像[index()='1']">
	<img id="mainopen2" width="500" height="400" border="0" alt="river" style="visibility:hidden;filter:RevealTrans(duration=5,transition=3)">
		<xsl:attribute name="src"><xsl:value-of /></xsl:attribute>
	</img>
</xsl:template>

<xsl:template match="text()">
	<xsl:value-of />
</xsl:template>



</xsl:stylesheet>

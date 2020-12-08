⍝ Day 7: bare assembly intepreter

∇f
⍝ Part 1:
a←0
i←1
prev←⍬
acc←{a+←⍵⋄i+←1}
jmp←{i+←⍵}
nop←{i+←1}
ins←'|'(≠⊆⊢)inp
{i∊prev:0⋄⎕←'prev',prev⊢←prev,i⋄⎕←⍎⊃ins[i]⋄⎕←'acc',a⋄∇0}0
∇

∇f
⍝ Part 2(streamlined with Adam's help):

a←0
i←1
prev←⍬
acc←{a+←⍵⋄i+←1}
jmp←{i+←⍵}
nop←{i+←1}
ins←'|'(≠⊆⊢)inp
f←{i←1⋄prev←⍬⋄a←0⋄{(i∊prev)∨i>≢ins:(i>≢ins)/a⋄prev⊢←prev,i⋄x←⍎⊃⍵[i]⋄∇⍵}⍵}
f¨({'no'⎕R'jm'@⍵⊢ins}¨⍸'n'=l),{'jm'⎕R'no'@⍵⊢ins}¨⍸'j'=l←⊃¨ins

∇

⍝ Input:
inp←'acc +45|nop +631|acc +12|acc -10|jmp +127|acc +28|jmp +460|jmp +619|acc +15|jmp +277|nop +83|acc +40|acc +34|acc +15|jmp +108|acc +10|nop +61|jmp +485|jmp +44|acc +3|jmp +460|acc +46|acc +32|jmp +12|acc -1|jmp +213|acc +40|acc +4|nop +97|acc +18|jmp +613|acc +15|acc +14|nop +374|jmp +487|jmp +1|acc -1|acc +32|jmp +1|jmp +418|acc +10|acc -9|jmp +1|jmp +117|acc -5|nop +539|nop +456|jmp +191|acc +16|jmp +431|jmp +341|acc -17|acc +22|acc +33|acc +15|jmp +152|nop +277|jmp +394|acc -13|acc +49|acc -19|jmp -26|acc -5|acc +13|jmp +49|acc +37|acc +49|nop +420|acc +38|jmp +515|nop +168|acc +22|nop +151|acc +25|jmp +504|acc -16|jmp +73|acc -6|acc +40|acc +9|jmp +143|acc +40|acc -6|acc +31|nop +530|jmp +265|acc -13|acc +40|jmp +312|acc +36|jmp -55|jmp +430|jmp +551|acc +10|acc +18|nop -25|jmp +178|acc +22|jmp +176|jmp +462|acc +22|acc +23|acc +3|acc +0|jmp +162|acc +0|acc +27|jmp +100|nop +234|acc +3|nop +70|nop +112|jmp -62|acc +8|jmp +214|jmp -38|acc -15|acc +48|jmp +289|nop +6|nop +523|jmp +286|nop -9|jmp +234|jmp -74|acc +33|acc +14|nop -11|jmp -37|acc +30|jmp +277|acc +35|acc +4|jmp +96|acc +26|nop +256|acc -14|jmp +389|acc -19|acc -12|jmp +397|jmp +477|nop +141|acc +21|acc +16|nop +29|jmp +407|acc +48|jmp +243|acc +43|acc +41|nop +384|acc +24|jmp +180|jmp +372|jmp +44|acc +4|nop +234|acc +49|jmp +343|acc +0|jmp -91|acc -8|acc +26|jmp -9|acc +37|nop +321|jmp +143|jmp +278|jmp -38|acc +46|nop +67|acc +32|jmp +445|nop +143|acc +35|acc -19|acc +33|jmp +39|jmp -24|nop +393|acc +0|acc +36|acc +44|jmp -134|acc +31|acc +37|acc +5|acc -1|jmp +291|acc +37|acc +36|acc -3|jmp -183|acc -10|acc +29|acc +7|acc +32|jmp +205|acc +38|acc +20|jmp +45|acc +26|acc +0|acc +17|acc +37|jmp +289|acc +20|acc +6|acc +18|jmp -50|acc +41|acc +50|jmp +419|acc +20|jmp +333|jmp +250|acc +35|acc +13|jmp -175|acc -4|nop +179|jmp -57|jmp +243|acc -6|acc +23|nop -149|jmp +1|jmp -97|acc -14|acc +26|acc +5|nop +6|jmp -223|acc +12|nop +115|acc +38|jmp -77|acc +1|acc +25|acc +0|jmp +276|acc +37|acc +31|acc +7|jmp +201|acc +16|acc +39|acc +24|jmp +54|acc +45|nop -96|acc +17|acc -7|jmp +339|acc +6|jmp +317|acc +12|acc -1|acc -4|acc +14|jmp +89|acc +2|acc +30|jmp +60|jmp +239|acc +25|acc -9|jmp +82|acc +45|jmp +1|nop +3|jmp +1|jmp +311|jmp +142|acc +36|nop +253|jmp +341|acc +26|acc +32|acc +30|jmp -182|jmp +184|jmp +331|acc +6|jmp -68|nop -209|acc +1|acc +48|jmp -23|acc +11|acc +30|acc +45|acc -3|jmp -238|jmp +1|acc +9|jmp +45|acc +45|jmp +1|acc +44|acc +29|jmp -73|acc -4|acc +0|acc +0|jmp +294|acc +35|acc +21|jmp +309|nop +316|acc -13|jmp +1|jmp +324|acc -14|acc +42|jmp -99|nop -103|acc +16|jmp -226|nop +317|nop +316|acc -16|jmp -192|acc +33|nop -47|jmp -305|jmp -81|nop -197|nop +249|jmp +157|nop -85|jmp -246|acc +8|acc -14|acc +20|jmp -181|acc +46|nop +164|acc +12|acc -18|jmp -199|acc +10|acc -9|acc +17|acc +15|jmp +134|acc -17|acc -3|jmp +18|acc +35|acc -14|jmp +254|acc -4|acc +41|acc +45|jmp -346|acc -18|acc +41|acc +48|acc +27|jmp -33|acc -1|acc -3|acc +11|acc -13|jmp -224|acc +22|nop -73|acc -12|acc -18|jmp +213|jmp +1|acc +39|acc +19|jmp +66|jmp +126|acc +37|acc -17|acc +17|jmp -4|acc -6|acc +18|acc +9|acc -7|jmp -195|acc +33|acc +24|acc +25|acc -19|jmp -340|acc +40|acc +10|acc +23|jmp -308|jmp +1|acc +9|jmp +1|nop +104|jmp +233|jmp -24|acc +29|jmp -367|acc -15|jmp +107|acc +12|jmp +89|nop -381|jmp +1|acc -2|nop +233|jmp +238|acc +46|acc -15|acc +47|jmp -290|nop -323|acc -9|acc -6|acc +0|jmp -315|acc +21|nop +196|acc +24|acc +18|jmp -49|acc +21|jmp +1|jmp -47|acc +49|nop -120|jmp -413|acc +30|jmp -284|acc -17|jmp -212|nop +39|nop -87|acc -18|jmp -122|jmp -90|nop +76|jmp -277|acc +34|acc +49|jmp +92|nop +168|acc -1|acc +0|jmp +26|jmp -270|jmp +1|acc +14|acc +11|jmp +41|acc -15|jmp +144|jmp +149|acc +48|jmp -260|acc +27|acc -3|jmp +105|acc +47|acc -10|jmp -316|acc -4|acc +41|acc -3|nop -289|jmp -332|nop -281|nop -379|nop +62|jmp -456|acc +34|acc +23|jmp +52|acc +7|jmp -374|acc -18|acc +45|jmp +53|acc +29|nop -407|acc +34|jmp +9|acc +49|acc -1|acc -1|jmp +1|jmp -55|acc -3|acc +5|jmp -280|jmp +1|acc -13|nop -173|jmp -131|acc +5|acc +34|jmp +105|jmp -56|jmp -485|acc -14|nop -389|acc +13|acc +27|jmp -482|nop -418|jmp -394|acc -9|jmp -435|acc -14|nop -172|acc +43|jmp -159|jmp +67|acc +9|acc +22|jmp +15|nop -405|jmp -406|jmp +1|acc -19|jmp -118|acc +49|jmp -385|jmp +90|acc -10|jmp +10|acc +8|nop -315|acc -14|jmp -167|jmp +49|jmp -49|jmp -275|acc -1|jmp -136|acc +24|acc +45|jmp -259|acc +2|nop -370|acc -18|acc +4|jmp -45|acc +9|jmp -542|nop -39|nop -16|jmp +66|acc -1|nop -59|acc +23|acc -8|jmp -91|acc +7|acc +37|jmp -400|acc +39|jmp -162|nop -346|acc +5|acc +50|jmp -115|jmp -141|acc +2|acc -18|nop -179|acc -19|jmp -306|acc -10|acc +30|jmp -115|nop -47|jmp -82|acc +9|acc -4|jmp -139|acc +18|acc +16|jmp -241|jmp +1|acc -3|acc +11|jmp -309|acc +3|acc +0|acc +40|jmp +1|jmp -369|acc +31|jmp +1|acc +35|jmp -427|acc +5|acc -2|jmp -26|acc +29|nop -121|acc +6|jmp -86|nop -294|jmp -391|acc +50|nop -96|nop -325|nop -134|jmp -355|acc +6|jmp +1|jmp -396|nop -440|jmp -89|acc +22|jmp -437|acc +41|acc +8|acc +29|jmp -603|acc -18|acc +16|acc +42|jmp -339|acc +43|acc -19|nop -168|nop -253|jmp -198|jmp -613|jmp -346|acc -4|acc +7|acc +40|jmp -294|jmp -423|acc -4|acc +48|acc +41|jmp +1|jmp -49|acc +4|acc +28|acc +9|acc +38|jmp -522|jmp -5|acc +3|acc +6|acc -8|acc +44|jmp +1'
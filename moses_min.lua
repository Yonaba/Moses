local SWFtRywD='2.1.0'local e,v,l6Sm5=next,type,pcall;local oUA,QFKEzBf=setmetatable,getmetatable
local odpE,p=table.insert,table.sort;local lIpFkbLI,JdUtcU=table.remove,table.concat
local GQLN,toXyq,S9TO=math.randomseed,math.random,math.huge;local pS78Y,BCf7,RlMSrmdD,VCD=math.floor,math.max,math.min,math.ceil
local OV7=coroutine.wrap;local X83a=coroutine.yield;local PizLA9mj=rawget
local hUL=table.unpack or unpack;local l,kyWtqIf0=pairs,ipairs;local zupvsz=error;local Mw=os and os.clock or nil
local S1wg_DG={}local function sf0(cmWo_v,RoXZEsn)return cmWo_v>RoXZEsn end;local function qxZa6ozV(BKLwtAVx,BMZNmf0)
return BKLwtAVx<BMZNmf0 end;local function hgW2H5(qL9C)local Colg=0
for ex2xo17,I in l(qL9C)do Colg=Colg+1 end;return Colg end
local function z5i2i(K66,Tq,jmB,...)
jmB=jmB or S1wg_DG.identity;local bjO;for QoYPziln,Hj in l(K66)do
if not bjO then bjO=jmB(Hj,...)else local KBlIVi=jmB(Hj,...)bjO=
Tq(bjO,KBlIVi)and bjO or KBlIVi end end;return bjO end
local function MGSnnzOI(OR8it1,GAqAsa,Oc_,Qj)
for Ybp8=0,#OR8it1,GAqAsa do
local ZmzyNm=S1wg_DG.slice(OR8it1,Ybp8+1,Ybp8+GAqAsa)
if#ZmzyNm>0 then while(#ZmzyNm<GAqAsa and Qj)do
ZmzyNm[#ZmzyNm+1]=Qj end;Oc_(ZmzyNm)end end end
local function B0o5xpg7(akG0mUnS,iy,gc7SaW,FnbJWd2)
for cpdLk=0,#akG0mUnS,iy-1 do
local FbQX=S1wg_DG.slice(akG0mUnS,cpdLk+1,cpdLk+iy)if#FbQX>0 and cpdLk+1 <#akG0mUnS then while
(#FbQX<iy and FnbJWd2)do FbQX[#FbQX+1]=FnbJWd2 end
gc7SaW(FbQX)end end end
local function VQT(ejMVLYZd,eS0X,XDQS4ASf,IiNU)
for gUfudNUg=0,#ejMVLYZd,1 do
local d3=S1wg_DG.slice(ejMVLYZd,gUfudNUg+1,gUfudNUg+eS0X)
if#d3 >0 and gUfudNUg+eS0X<=#ejMVLYZd then while
(#d3 <eS0X and IiNU)do d3[#d3+1]=IiNU end;XDQS4ASf(d3)end end end
local function Id(gTOcAHv,vY_4HT1n,DzPbzg)if vY_4HT1n==0 then DzPbzg(gTOcAHv)end
for UMD=1,vY_4HT1n do
gTOcAHv[vY_4HT1n],gTOcAHv[UMD]=gTOcAHv[UMD],gTOcAHv[vY_4HT1n]Id(gTOcAHv,vY_4HT1n-1,DzPbzg)
gTOcAHv[vY_4HT1n],gTOcAHv[UMD]=gTOcAHv[UMD],gTOcAHv[vY_4HT1n]end end;local function Ub(K3ZE7Ou)return K3ZE7Ou>=0 and 1 or-1 end
local qJExeUn2=-1;S1wg_DG.operator={}
S1wg_DG.operator.add=function(fBI,wMSY)return fBI+wMSY end
S1wg_DG.operator.sub=function(_nD2rl,aVh8xSly)return _nD2rl-aVh8xSly end
S1wg_DG.operator.mul=function(i,P_NNVDyt)return i*P_NNVDyt end
S1wg_DG.operator.div=function(cVEyN,uj2AiF)return cVEyN/uj2AiF end
S1wg_DG.operator.mod=function(W,lbHN2)return W%lbHN2 end
S1wg_DG.operator.exp=function(PwgW3lfq,z)return PwgW3lfq^z end;S1wg_DG.operator.pow=S1wg_DG.operator.exp;S1wg_DG.operator.unm=function(K)return
-K end
S1wg_DG.operator.neg=S1wg_DG.operator.unm
S1wg_DG.operator.floordiv=function(xx,aYb)return pS78Y(xx/aYb)end
S1wg_DG.operator.intdiv=function(JM2,bmAjLT)return JM2 >=0 and pS78Y(JM2/bmAjLT)or
VCD(JM2/bmAjLT)end
S1wg_DG.operator.eq=function(eExYnwnh,XMBmJyiP)return eExYnwnh==XMBmJyiP end
S1wg_DG.operator.neq=function(nowqEU6m,iKD8V)return nowqEU6m~=iKD8V end
S1wg_DG.operator.lt=function(YtRS,A)return YtRS<A end
S1wg_DG.operator.gt=function(mHJ,Q57BJ)return mHJ>Q57BJ end
S1wg_DG.operator.le=function(vM,JeGCDX)return vM<=JeGCDX end
S1wg_DG.operator.ge=function(A,UFZlp)return A>=UFZlp end
S1wg_DG.operator.land=function(VsrKM,uhIq)return VsrKM and uhIq end
S1wg_DG.operator.lor=function(EEOUzhy,hbrt)return EEOUzhy or hbrt end;S1wg_DG.operator.lnot=function(D)return not D end;S1wg_DG.operator.concat=function(Q,mRqle)return
Q..mRqle end;S1wg_DG.operator.length=function(sBEZ8)return
#sBEZ8 end
S1wg_DG.operator.len=S1wg_DG.operator.length;function S1wg_DG.clear(WhHB0ygh)for rYSD0 in l(WhHB0ygh)do WhHB0ygh[rYSD0]=nil end
return WhHB0ygh end;function S1wg_DG.each(BIL5,GQLlkH)for aN4J2zRQ,eWca in l(BIL5)do
GQLlkH(eWca,aN4J2zRQ)end end
function S1wg_DG.eachi(AGUR2QK,FK)
local _=S1wg_DG.sort(S1wg_DG.select(S1wg_DG.keys(AGUR2QK),S1wg_DG.isInteger))
for YQZ729qQ,rZh2wG in kyWtqIf0(_)do FK(AGUR2QK[rZh2wG],rZh2wG)end end;function S1wg_DG.at(sef4eW6Q,...)local Z={}
for UacO6D,FdnzjW in kyWtqIf0({...})do Z[#Z+1]=sef4eW6Q[FdnzjW]end;return Z end
function S1wg_DG.adjust(o,lMAL,CpQ)
if(
o[lMAL]==nil)then zupvsz("key not existing in table")end;local L=S1wg_DG.clone(o)L[lMAL]=
v(CpQ)=='function'and CpQ(L[lMAL])or CpQ;return L end
function S1wg_DG.count(HnQS_Z,rib)
if rib==nil then return S1wg_DG.size(HnQS_Z)end;local hgW2H5=0;for w,YT6wZ in l(HnQS_Z)do
if S1wg_DG.isEqual(YT6wZ,rib)then hgW2H5=hgW2H5+1 end end;return hgW2H5 end
function S1wg_DG.countf(VYv,gU)local hgW2H5=0;for JzG8W4Ya,dZ54oc in l(VYv)do
if gU(dZ54oc,JzG8W4Ya)then hgW2H5=hgW2H5+1 end end;return hgW2H5 end
function S1wg_DG.allEqual(v_LoR,gRY)local z,ad=e(v_LoR)
for z,Ui0Qa in l(v_LoR)do if gRY then
if not gRY(ad,Ui0Qa)then return false end else
if not S1wg_DG.isEqual(ad,Ui0Qa)then return false end end end;return true end
function S1wg_DG.cycle(g,Itx)Itx=Itx or 1;if Itx<=0 then return S1wg_DG.noop end
local JpoaGH,cyAcCT;local RCA=0
while true do
return
function()JpoaGH=JpoaGH and e(g,JpoaGH)or e(g)cyAcCT=not
cyAcCT and JpoaGH or cyAcCT;if Itx then RCA=
(JpoaGH==cyAcCT)and RCA+1 or RCA
if RCA>Itx then return end end;return g[JpoaGH],JpoaGH end end end
function S1wg_DG.map(L46S,GKTYT)local hXSTz8FJ={}
for C24r7o4G,b_4Q38cU in l(L46S)do local N,JbPw,j=C24r7o4G,GKTYT(b_4Q38cU,C24r7o4G)hXSTz8FJ[
j and JbPw or N]=j or JbPw end;return hXSTz8FJ end
function S1wg_DG.mapi(S,cg4FV7bl)local flf9sWX={}for uNoS,ZWoH9V08 in kyWtqIf0(S)do
local RWo,GWBQL,PCldTUn9=uNoS,cg4FV7bl(ZWoH9V08,uNoS)
flf9sWX[PCldTUn9 and GWBQL or RWo]=PCldTUn9 or GWBQL end;return
flf9sWX end
function S1wg_DG.reduce(sO_,ALbdmINL,b)for DUgF0E,vGxJ6f in l(sO_)do
if b==nil then b=vGxJ6f else b=ALbdmINL(b,vGxJ6f)end end;return b end
function S1wg_DG.best(a4ga2I,syGyB_)local VO,J1r=e(a4ga2I)
for iBcU3_7D,N in l(a4ga2I)do if J1r==nil then J1r=N else
J1r=syGyB_(J1r,N)and J1r or N end end;return J1r end
function S1wg_DG.reduceBy(M4V,_feve,OPz_7bk,H64aD)return
S1wg_DG.reduce(S1wg_DG.select(M4V,OPz_7bk),_feve,H64aD)end
function S1wg_DG.reduceRight(ny7,QDj6GAX,k6pXzd)return
S1wg_DG.reduce(S1wg_DG.reverse(ny7),QDj6GAX,k6pXzd)end
function S1wg_DG.mapReduce(hsLwu,R,JKZ)local yHbsh={}for d4z,i in l(hsLwu)do
yHbsh[d4z]=not JKZ and i or R(JKZ,i)JKZ=yHbsh[d4z]end;return yHbsh end
function S1wg_DG.mapReduceRight(HyEk4lbh,PhU,rWwbNge)return
S1wg_DG.mapReduce(S1wg_DG.reverse(HyEk4lbh),PhU,rWwbNge)end
function S1wg_DG.include(SKxD,o3uQKvJ)local vAZm=(v(o3uQKvJ)=='function')and o3uQKvJ or
S1wg_DG.isEqual;for q,fFuE in l(SKxD)do if
vAZm(fFuE,o3uQKvJ)then return true end end;return false end
function S1wg_DG.detect(KypMW,JJT4nKO)local TFLF=(v(JJT4nKO)=='function')and JJT4nKO or
S1wg_DG.isEqual;for hEoAa,PGN in l(KypMW)do if
TFLF(PGN,JJT4nKO)then return hEoAa end end end
function S1wg_DG.where(K2_kF5,YpimJ)
local Gg7Ttui=S1wg_DG.select(K2_kF5,function(_)for EGeAf in l(YpimJ)do
if _[EGeAf]~=YpimJ[EGeAf]then return false end end;return true end)return#Gg7Ttui>0 and Gg7Ttui or nil end
function S1wg_DG.findWhere(ymP,z5pHKyoa)
local h=S1wg_DG.detect(ymP,function(xwT)for y33ux in l(z5pHKyoa)do if z5pHKyoa[y33ux]~=xwT[y33ux]then
return false end end;return true end)return h and ymP[h]end
function S1wg_DG.select(Ut,GOijBp)local oUi={}for b2a3,xer in l(Ut)do
if GOijBp(xer,b2a3)then oUi[#oUi+1]=xer end end;return oUi end
function S1wg_DG.reject(SQHAAR,qybRcP1)local z={}for N0NaR,FBfW in l(SQHAAR)do
if not qybRcP1(FBfW,N0NaR)then z[#z+1]=FBfW end end;return z end;function S1wg_DG.all(lnM4,_oDmX_)
for t,K in l(lnM4)do if not _oDmX_(K,t)then return false end end;return true end
function S1wg_DG.invoke(ppm021I,ASUXhD)
return
S1wg_DG.map(ppm021I,function(KCm,u)
if(
v(KCm)=='table')then
if KCm[ASUXhD]then
if S1wg_DG.isCallable(KCm[ASUXhD])then return
KCm[ASUXhD](KCm,u)else return KCm[ASUXhD]end else
if S1wg_DG.isCallable(ASUXhD)then return ASUXhD(KCm,u)end end elseif S1wg_DG.isCallable(ASUXhD)then return ASUXhD(KCm,u)end end)end
function S1wg_DG.pluck(fDk,gxYY)local sVMxk={}for SyD,v4 in l(fDk)do
if v4[gxYY]then sVMxk[#sVMxk+1]=v4[gxYY]end end;return sVMxk end;function S1wg_DG.max(j7siW,Hl)return z5i2i(j7siW,sf0,Hl)end;function S1wg_DG.min(AP060rq,DIEKD10)return
z5i2i(AP060rq,qxZa6ozV,DIEKD10)end
function S1wg_DG.same(lLJ,EicsS)
return
S1wg_DG.all(lLJ,function(JubU)return
S1wg_DG.include(EicsS,JubU)end)and
S1wg_DG.all(EicsS,function(L)return S1wg_DG.include(lLJ,L)end)end;function S1wg_DG.sort(JKci,SsBe)p(JKci,SsBe)return JKci end
function S1wg_DG.sortedk(o,ZOmcmO)
local _G19JrRB=S1wg_DG.keys(o)p(_G19JrRB,ZOmcmO)local m0r3_J=0
return function()m0r3_J=m0r3_J+1;return _G19JrRB[m0r3_J],
o[_G19JrRB[m0r3_J]]end end
function S1wg_DG.sortedv(MLrs,hP5)local oqjhEZb0=S1wg_DG.keys(MLrs)hP5=hP5 or qxZa6ozV
p(oqjhEZb0,function(G,MOrzq4)return
hP5(MLrs[G],MLrs[MOrzq4])end)local Pha=0;return
function()Pha=Pha+1;return oqjhEZb0[Pha],MLrs[oqjhEZb0[Pha]]end end
function S1wg_DG.sortBy(bEMp,dd,MOQN)local O=dd or S1wg_DG.identity;if(v(dd)=='string')then O=function(bEMp)return
bEMp[dd]end end;MOQN=
MOQN or qxZa6ozV
p(bEMp,function(FEpet,P)return MOQN(O(FEpet),O(P))end)return bEMp end
function S1wg_DG.groupBy(G,EcLLM)local wo={}for ur,XTX in l(G)do local wc8hjKp1=EcLLM(XTX,ur)
if wo[wc8hjKp1]then wo[wc8hjKp1][#
wo[wc8hjKp1]+1]=XTX else wo[wc8hjKp1]={XTX}end end;return wo end
function S1wg_DG.countBy(f,Hjag)local Yg={}for uc,bw in l(f)do local ad=Hjag(bw,uc)
Yg[ad]=(Yg[ad]or 0)+1 end;return Yg end
function S1wg_DG.size(...)local EG344W={...}local MVlUhPEM=EG344W[1]return

(v(MVlUhPEM)=='table')and hgW2H5(EG344W[1])or hgW2H5(EG344W)end;function S1wg_DG.containsKeys(LT,pfiWYrg)
for smnX9H6 in l(pfiWYrg)do if not LT[smnX9H6]then return false end end;return true end
function S1wg_DG.sameKeys(FzRhHR,mMBxOoQa)
for xYSLIT in
l(FzRhHR)do if not mMBxOoQa[xYSLIT]then return false end end
for Eae7ILmk in l(mMBxOoQa)do if not FzRhHR[Eae7ILmk]then return false end end;return true end
function S1wg_DG.sample(Jy23ZRAA,V8IWw,uyYdf)V8IWw=V8IWw or 1;if V8IWw==0 then return{}end;if V8IWw==1 then if uyYdf then
GQLN(uyYdf)end
return{Jy23ZRAA[toXyq(1,#Jy23ZRAA)]}end;return
S1wg_DG.slice(S1wg_DG.shuffle(Jy23ZRAA,uyYdf),1,V8IWw)end
function S1wg_DG.sampleProb(K,ZX,tbdC)if tbdC then GQLN(tbdC)end;local VaY3={}
for HK7Mbgze,VXPfx in kyWtqIf0(K)do if toXyq()<ZX then VaY3[
#VaY3+1]=VXPfx end end;return VaY3 end
function S1wg_DG.nsorted(j3Qk,X1,GpruB)GpruB=GpruB or qxZa6ozV;X1=X1 or 1;local r,hgW2H5={},0
for V7YqV,JbvH7 in
S1wg_DG.sortedv(j3Qk,GpruB)do if hgW2H5 <X1 then hgW2H5=hgW2H5+1;r[hgW2H5]=JbvH7 end end;return r end
function S1wg_DG.shuffle(Cqk9Luq,PeAP9X)if PeAP9X then GQLN(PeAP9X)end;local vN5AF9={}for j,EOgmP in kyWtqIf0(Cqk9Luq)do local jmJof=pS78Y(
toXyq()*j)+1;vN5AF9[j]=vN5AF9[jmJof]
vN5AF9[jmJof]=EOgmP end;return vN5AF9 end;function S1wg_DG.pack(...)return{...}end;function S1wg_DG.find(yz1Kuwby,KVE6TG,YY)
for r9=YY or 1,#yz1Kuwby do if
S1wg_DG.isEqual(yz1Kuwby[r9],KVE6TG)then return r9 end end end;function S1wg_DG.reverse(mtUG)
local PFRuf={}
for KhK1gRj9=#mtUG,1,-1 do PFRuf[#PFRuf+1]=mtUG[KhK1gRj9]end;return PFRuf end;function S1wg_DG.fill(Xgj,Ko,A,IU6Om)IU6Om=
IU6Om or S1wg_DG.size(Xgj)
for A=A or 1,IU6Om do Xgj[A]=Ko end;return Xgj end;function S1wg_DG.zeros(sKIIqz)return
S1wg_DG.fill({},0,1,sKIIqz)end;function S1wg_DG.ones(wmhARqEa)return
S1wg_DG.fill({},1,1,wmhARqEa)end;function S1wg_DG.vector(_RT3,V)return
S1wg_DG.fill({},_RT3,1,V)end
function S1wg_DG.selectWhile(BTA,QVEYENaX)local gxqa={}
for q4,QyKi in
kyWtqIf0(BTA)do if QVEYENaX(QyKi,q4)then gxqa[q4]=QyKi else break end end;return gxqa end
function S1wg_DG.dropWhile(_o3FE,n)local WM;for zb8b,YBqeh in kyWtqIf0(_o3FE)do
if not n(YBqeh,zb8b)then WM=zb8b;break end end;if(WM==nil)then return{}end;return
S1wg_DG.rest(_o3FE,WM)end
function S1wg_DG.sortedIndex(WRkIg,RH_vLUg,aEH,g20N7)local puZN=aEH or qxZa6ozV
if(g20N7 ==true)then p(WRkIg,puZN)end;for _Dy=1,#WRkIg do
if not puZN(WRkIg[_Dy],RH_vLUg)then return _Dy end end;return#WRkIg+1 end;function S1wg_DG.indexOf(MC,WOBSVeqF)
for A=1,#MC do if MC[A]==WOBSVeqF then return A end end end
function S1wg_DG.lastIndexOf(vqW6,R4oRlgh)
local rBRXA=S1wg_DG.indexOf(S1wg_DG.reverse(vqW6),R4oRlgh)if rBRXA then return#vqW6-rBRXA+1 end end
function S1wg_DG.findIndex(qfFSJN,Va8fT08T)for d778=1,#qfFSJN do
if Va8fT08T(qfFSJN[d778],d778)then return d778 end end end
function S1wg_DG.findLastIndex(aZT,ni9je9bJ)
local uwwNE=S1wg_DG.findIndex(S1wg_DG.reverse(aZT),ni9je9bJ)if uwwNE then return#aZT-uwwNE+1 end end;function S1wg_DG.addTop(X40cF,...)
for EW,asgq in kyWtqIf0({...})do odpE(X40cF,1,asgq)end;return X40cF end;function S1wg_DG.prepend(IQybL1,...)return
S1wg_DG.append({...},IQybL1)end;function S1wg_DG.push(hYKT45,...)
local Rq7={...}
for LQ_EIcl,uaL in kyWtqIf0({...})do hYKT45[#hYKT45+1]=uaL end;return hYKT45 end
function S1wg_DG.shift(gujcrFp,ph06vXj)ph06vXj=RlMSrmdD(
ph06vXj or 1,#gujcrFp)local nH0LB4c={}
for ALwJ9=1,ph06vXj do
local _X=gujcrFp[1]nH0LB4c[#nH0LB4c+1]=_X;lIpFkbLI(gujcrFp,1)end;return hUL(nH0LB4c)end
function S1wg_DG.unshift(ruXMob,E)E=RlMSrmdD(E or 1,#ruXMob)local jcgjAE={}
for BZmaGN=1,E do
local HSav=ruXMob[#ruXMob]jcgjAE[#jcgjAE+1]=HSav;lIpFkbLI(ruXMob)end;return hUL(jcgjAE)end
function S1wg_DG.pull(sDjMr,...)local biQX3Ut={...}
for BLEXN_=#sDjMr,1,-1 do local Ljc=false
for fpN7T,FNSk_ in kyWtqIf0(biQX3Ut)do if(Ljc==false)then
if
S1wg_DG.isEqual(sDjMr[BLEXN_],FNSk_)then lIpFkbLI(sDjMr,BLEXN_)Ljc=true end end end end;return sDjMr end
function S1wg_DG.removeRange(LmE,pZTFVP,XL)pZTFVP=pZTFVP or 1;XL=XL or#LmE;if pZTFVP>XL then
zupvsz("start cannot be greater than finish.")end
for L5vC0Jx=XL,pZTFVP,-1 do lIpFkbLI(LmE,L5vC0Jx)end;return LmE end
function S1wg_DG.chunk(vpONJ,A)local LN,dA14qP,JcQc,hDih6_D={},0;A=A or S1wg_DG.identity
for QKbZ464i,F1TsZ in
kyWtqIf0(vpONJ)do hDih6_D=A(F1TsZ,QKbZ464i)dA14qP=(
(hDih6_D~=JcQc)and(dA14qP+1)or dA14qP)JcQc=
(JcQc==nil)and hDih6_D or JcQc;if not LN[dA14qP]then
LN[dA14qP]={vpONJ[QKbZ464i]}else
LN[dA14qP][#LN[dA14qP]+1]=vpONJ[QKbZ464i]end;JcQc=hDih6_D end;return LN end;function S1wg_DG.slice(uF2,T,pC_)local ju={}
for deu1=T or 1,pC_ or#uF2 do ju[#ju+1]=uF2[deu1]end;return ju end;function S1wg_DG.first(IgZ6,kVRiv3F)kVRiv3F=
kVRiv3F or 1;local kWMf={}
for DawC=1,kVRiv3F do kWMf[DawC]=IgZ6[DawC]end;return kWMf end
function S1wg_DG.initial(cP,w)local UZ=
#cP
w=w and UZ- (RlMSrmdD(w,UZ))or UZ-1;local tdH={}for ymt=1,w do tdH[ymt]=cP[ymt]end;return tdH end
function S1wg_DG.last(WxGA,jBuHkH)local E3=#WxGA;jBuHkH=
jBuHkH and E3-RlMSrmdD(jBuHkH-1,E3-1)or 2;local CZi_zK={}for _6KCMph=jBuHkH,E3 do
CZi_zK[#CZi_zK+1]=WxGA[_6KCMph]end;return CZi_zK end;function S1wg_DG.rest(PY3VqYZ8,V)local y={}
for QF=V or 1,#PY3VqYZ8 do y[#y+1]=PY3VqYZ8[QF]end;return y end;function S1wg_DG.nth(hN,hVflx4kh)return
hN[hVflx4kh]end
function S1wg_DG.compact(GP)local oCZYv2dT={}
for RLaqM3,PoH in l(GP)do if PoH then oCZYv2dT[
#oCZYv2dT+1]=PoH end end;return oCZYv2dT end
function S1wg_DG.flatten(xM709D,z50)z50=z50 or false;local sAPD;local AVFi={}
for GGKI,gWaGu in kyWtqIf0(xM709D)do
if
v(gWaGu)=='table'then
sAPD=z50 and gWaGu or S1wg_DG.flatten(gWaGu)
for SFKM,j6jQmlbr in kyWtqIf0(sAPD)do AVFi[#AVFi+1]=j6jQmlbr end else AVFi[#AVFi+1]=gWaGu end end;return AVFi end
function S1wg_DG.difference(m403CY,dL)
if not dL then return S1wg_DG.clone(m403CY)end
return S1wg_DG.select(m403CY,function(PrTsHeT)
return not S1wg_DG.include(dL,PrTsHeT)end)end;function S1wg_DG.union(...)
return S1wg_DG.unique(S1wg_DG.flatten({...}))end
function S1wg_DG.intersection(...)local eNI3MT7={...}
local Rfoo=eNI3MT7[1]lIpFkbLI(eNI3MT7,1)local eUJhGD={}
for wot8,j9vJ in kyWtqIf0(Rfoo)do
if
S1wg_DG.all(eNI3MT7,function(J6Qr27Mh)return
S1wg_DG.include(J6Qr27Mh,j9vJ)end)then eUJhGD[#eUJhGD+1]=j9vJ end end;return eUJhGD end;function S1wg_DG.disjoint(...)return
(#S1wg_DG.intersection(...)==0)end
function S1wg_DG.symmetricDifference(AwxW8Do,_u)return
S1wg_DG.difference(S1wg_DG.union(AwxW8Do,_u),S1wg_DG.intersection(AwxW8Do,_u))end
function S1wg_DG.unique(B)local cdxFVpZw={}
for Y=1,#B do if not S1wg_DG.find(cdxFVpZw,B[Y])then cdxFVpZw[#
cdxFVpZw+1]=B[Y]end end;return cdxFVpZw end;function S1wg_DG.isunique(o9Uh)return
#o9Uh==# (S1wg_DG.unique(o9Uh))end
function S1wg_DG.duplicates(BuX1r)
local Wyf83f2=S1wg_DG.invert(BuX1r)local P0olj={}for z,EHCCkt in kyWtqIf0(BuX1r)do
if Wyf83f2[EHCCkt]~=z and
not S1wg_DG.find(P0olj,EHCCkt)then P0olj[#P0olj+1]=EHCCkt end end;return P0olj end
function S1wg_DG.zip(...)local x={...}
local xNWVmS=S1wg_DG.max(x,function(Pkis6H28)return#Pkis6H28 end)local kGWnkgDu={}
for tSE=1,xNWVmS do
if not kGWnkgDu[tSE]then kGWnkgDu[tSE]={}end
for abKH,LDp in kyWtqIf0(x)do if(LDp[tSE]~=nil)then
kGWnkgDu[tSE][#kGWnkgDu[tSE]+1]=LDp[tSE]end end end;return kGWnkgDu end
function S1wg_DG.zipWith(GWouUlzZ,...)local MqJhIr={...}
local Q9=S1wg_DG.max(MqJhIr,function(qnZ81I)return#qnZ81I end)local c={}for N9uN=1,Q9 do
c[N9uN]=GWouUlzZ(hUL(S1wg_DG.pluck(MqJhIr,N9uN)))end;return c end
function S1wg_DG.append(QGC,K8iFU)local gbU={}for h,hS7 in kyWtqIf0(QGC)do gbU[h]=hS7 end;for KQjMKhN,R6PYgHHE in
kyWtqIf0(K8iFU)do gbU[#gbU+1]=R6PYgHHE end;return gbU end
function S1wg_DG.interleave(...)local ZwCXrLO={...}
local lI=S1wg_DG.max(ZwCXrLO,S1wg_DG.size)local iMSMP5Lp={}
for WoARZdZ3=1,lI do for n,Uj in kyWtqIf0(ZwCXrLO)do if Uj[WoARZdZ3]then
iMSMP5Lp[#iMSMP5Lp+1]=Uj[WoARZdZ3]end end end;return iMSMP5Lp end;function S1wg_DG.interpose(HpN_N,yP3QEJ)for pwi=#HpN_N,2,-1 do odpE(HpN_N,pwi,yP3QEJ)end;return
HpN_N end
function S1wg_DG.range(QP,Iy,O9P0mj)
if
(QP==nil)and(Iy==nil)and(O9P0mj==nil)then return{}elseif(QP~=nil)and
(Iy==nil)and(O9P0mj==nil)then
QP,Iy,O9P0mj=Ub(QP),QP,Ub(QP)elseif(QP~=nil)and(Iy~=nil)and(O9P0mj==nil)then
O9P0mj=Ub(Iy-QP)end;local eFGwPxi={QP}
local m4x8ZsD4=BCf7(pS78Y((Iy-QP)/O9P0mj),0)
for _witc0Pe=1,m4x8ZsD4 do eFGwPxi[#eFGwPxi+1]=QP+O9P0mj*_witc0Pe end;return eFGwPxi end
function S1wg_DG.rep(Y8E,h)local EnMMG={}for HzO7UpZ=1,h do EnMMG[HzO7UpZ]=Y8E end;return EnMMG end
function S1wg_DG.powerset(B)local RNTu=#B;local Q_={}
for S8GB,W7yjGm in kyWtqIf0(B)do for X=1,#Q_ do local Y=Q_[X]
odpE(Q_,S1wg_DG.push(S1wg_DG.slice(Y),W7yjGm))end;odpE(Q_,{W7yjGm})end;odpE(Q_,{})return Q_ end;function S1wg_DG.partition(qqvEf3,Wriu,I0Pxr5F)if Wriu<=0 then return end
return OV7(function()
MGSnnzOI(qqvEf3,Wriu or 1,X83a,I0Pxr5F)end)end
function S1wg_DG.overlapping(ukGf_,uZpt01P,hJk0n8bR)if
uZpt01P<=1 then return end
return OV7(function()
B0o5xpg7(ukGf_,uZpt01P or 2,X83a,hJk0n8bR)end)end
function S1wg_DG.aperture(o9DTTJig,v4)if v4 <=1 then return end;return
OV7(function()VQT(o9DTTJig,v4 or 2,X83a)end)end
function S1wg_DG.pairwise(Uaq2_Xzk)return S1wg_DG.aperture(Uaq2_Xzk,2)end;function S1wg_DG.permutation(S0DM)return
OV7(function()Id(S0DM,#S0DM,X83a)end)end
function S1wg_DG.concat(GHasi5,QeX_U9tm,Dp9m,sJjNM)return
JdUtcU(S1wg_DG.map(GHasi5,tostring),QeX_U9tm,Dp9m,sJjNM)end
function S1wg_DG.xprod(GnSs,XP)local Sj={}for yKj1,F9WZ in kyWtqIf0(GnSs)do
for A5,nY_O in kyWtqIf0(XP)do Sj[#Sj+1]={F9WZ,nY_O}end end;return Sj end;function S1wg_DG.xpairs(QAJAyj5,EZ)local n={}
for M,AADiL1 in kyWtqIf0(EZ)do n[M]={QAJAyj5,AADiL1}end;return n end
function S1wg_DG.xpairsRight(Arw,b)
local _ZM1Yj3={}
for rmSU,L2RHrI in kyWtqIf0(b)do _ZM1Yj3[rmSU]={L2RHrI,Arw}end;return _ZM1Yj3 end
function S1wg_DG.sum(XW7Y5Rz)local C=0;for NhwEkTd,XGz in kyWtqIf0(XW7Y5Rz)do C=C+XGz end;return C end;function S1wg_DG.product(Tf4P2eIf)local TF3Htu=1
for K5yUw1t,Mi in kyWtqIf0(Tf4P2eIf)do TF3Htu=TF3Htu*Mi end;return TF3Htu end
function S1wg_DG.mean(WWyrqnSL)return
S1wg_DG.sum(WWyrqnSL)/ (#WWyrqnSL)end
function S1wg_DG.median(gVTyP)
local Ck=S1wg_DG.sort(S1wg_DG.clone(gVTyP))local CRG=#Ck;if CRG==0 then return elseif CRG==1 then return Ck[1]end
local dkz=VCD(CRG/2)return CRG%2 ==0 and(Ck[dkz]+Ck[dkz+1])/2 or
Ck[dkz]end;function S1wg_DG.noop()return end;function S1wg_DG.identity(zrCq)return zrCq end;function S1wg_DG.call(azXMvVdM,...)return
azXMvVdM(...)end;function S1wg_DG.constant(CBgxHfbq)return
function()return CBgxHfbq end end
function S1wg_DG.applySpec(WO)return
function(...)local H={}for C28NuJ3,sz in
l(WO)do H[C28NuJ3]=sz(...)end;return H end end
function S1wg_DG.thread(qH,...)local u=qH;local uJ1Vn4uYP={...}
for Z,pJ in kyWtqIf0(uJ1Vn4uYP)do if v(pJ)=='function'then u=pJ(u)elseif
v(pJ)=='table'then local NAjg=pJ[1]lIpFkbLI(pJ,1)
u=S1wg_DG.reduce(pJ,NAjg,u)end end;return u end
function S1wg_DG.threadRight(con,...)local I=con;local TxmZR6UE={...}
for I1b4o,nAt in kyWtqIf0(TxmZR6UE)do if v(nAt)=='function'then
I=nAt(I)elseif v(nAt)=='table'then local pNJ=nAt[1]lIpFkbLI(nAt,1)odpE(nAt,I)
I=S1wg_DG.reduce(nAt,pNJ)end end;return I end
function S1wg_DG.dispatch(...)local RQ={...}return
function(...)for wnZcHKf,Lv_8 in kyWtqIf0(RQ)do local UQ={Lv_8(...)}if#UQ>0 then
return hUL(UQ)end end end end
function S1wg_DG.memoize(FG)local vLzqjJw=oUA({},{__mode='kv'})
return function(v2dsC21)if
(vLzqjJw[v2dsC21]==nil)then vLzqjJw[v2dsC21]=FG(v2dsC21)end;return
vLzqjJw[v2dsC21]end end
function S1wg_DG.unfold(O,wx)local u,V_84V={}while true do V_84V,wx=O(wx)
if V_84V~=nil then u[#u+1]=V_84V else break end end;return u end
function S1wg_DG.once(qF)local IZbOX7TW=0;local Dd6ZLpU={}return
function(...)IZbOX7TW=IZbOX7TW+1
if IZbOX7TW<=1 then Dd6ZLpU={...}end;return qF(hUL(Dd6ZLpU))end end;function S1wg_DG.before(MP,hgW2H5)local w4c=0;local C58={}
return function(...)w4c=w4c+1;if w4c<=hgW2H5 then C58={...}end;return
MP(hUL(C58))end end
function S1wg_DG.after(Jk6Nh,hgW2H5)
local s1Ws,desLYv=hgW2H5,0;return
function(...)desLYv=desLYv+1;if desLYv>=s1Ws then return Jk6Nh(...)end end end
function S1wg_DG.compose(...)local COq2NY9I=S1wg_DG.reverse{...}
return
function(...)local aoBEg65S,x6=true
for t3cNa2l,Ik in
kyWtqIf0(COq2NY9I)do if aoBEg65S then aoBEg65S=false;x6=Ik(...)else x6=Ik(x6)end end;return x6 end end
function S1wg_DG.pipe(SeHOs,...)return S1wg_DG.compose(...)(SeHOs)end;function S1wg_DG.complement(P2rGsUx)
return function(...)return not P2rGsUx(...)end end;function S1wg_DG.juxtapose(c,...)local v12AhMm={}for F2uxGC,Xs0 in
kyWtqIf0({...})do v12AhMm[F2uxGC]=Xs0(c)end
return hUL(v12AhMm)end
function S1wg_DG.wrap(QK8ibF,TEio7k0z)return function(...)return
TEio7k0z(QK8ibF,...)end end;function S1wg_DG.times(u,N)local O2YgxDc={}
for VLsC67=1,(N or 1)do O2YgxDc[VLsC67]=u(VLsC67)end;return O2YgxDc end
function S1wg_DG.bind(OHw4,FKZ)return function(...)return
OHw4(FKZ,...)end end;function S1wg_DG.bind2(Fl,QhS8FvKI)
return function(FaZIJL,...)return Fl(FaZIJL,QhS8FvKI,...)end end;function S1wg_DG.bindn(sOT2O5,...)local x={...}
return function(...)return
sOT2O5(hUL(S1wg_DG.append(x,{...})))end end
function S1wg_DG.bindall(Wswd_OC,...)
local E={...}
for A0Un,nRHrI in kyWtqIf0(E)do local k=Wswd_OC[nRHrI]if k then
Wswd_OC[nRHrI]=S1wg_DG.bind(k,Wswd_OC)end end;return Wswd_OC end;function S1wg_DG.cond(Zp)
return function(...)
for A,_L_ in kyWtqIf0(Zp)do if _L_[1](...)then return _L_[2](...)end end end end
function S1wg_DG.both(...)
local WHpm={...}
return function(...)
for g,HiR3yiw in kyWtqIf0(WHpm)do if not HiR3yiw(...)then return false end end;return true end end
function S1wg_DG.either(...)local KeKbiDqN={...}return
function(...)for WfrZqHH8,YX9s9O in kyWtqIf0(KeKbiDqN)do
if YX9s9O(...)then return true end end;return false end end
function S1wg_DG.neither(...)local y64dF={...}
return function(...)
for sNSsH,K in kyWtqIf0(y64dF)do if K(...)then return false end end;return true end end
function S1wg_DG.uniqueId(o8T)qJExeUn2=qJExeUn2+1;if o8T then
if v(o8T)=='string'then
return o8T:format(qJExeUn2)elseif v(o8T)=='function'then return o8T(qJExeUn2)end end;return qJExeUn2 end
function S1wg_DG.iterator(xeP,Tv_3VlmX,BT)local _y3z=0
return function()_y3z=_y3z+1;if BT and _y3z>BT then return end
Tv_3VlmX=xeP(Tv_3VlmX)return Tv_3VlmX end end;function S1wg_DG.skip(rdl,NAP_5jYs)
for BZnlpW=1,(NAP_5jYs or 1)do if rdl()==nil then return end end;return rdl end
function S1wg_DG.tabulate(...)
local isN={}for yRADzw1v in...do isN[#isN+1]=yRADzw1v end;return isN end
function S1wg_DG.iterlen(...)local Jafp=0;for XWh8Ee in...do Jafp=Jafp+1 end;return Jafp end;function S1wg_DG.castArray(kpezL1e)return
(v(kpezL1e)~='table')and{kpezL1e}or kpezL1e end
function S1wg_DG.flip(h)return function(...)return
h(hUL(S1wg_DG.reverse({...})))end end
function S1wg_DG.nthArg(R7yfz_l9)return
function(...)local D35PFLu={...}return
D35PFLu[(R7yfz_l9 <0)and
(#D35PFLu+R7yfz_l9+1)or R7yfz_l9]end end;function S1wg_DG.unary(wK)
return function(...)local qeEwE={...}return wK(qeEwE[1])end end
function S1wg_DG.ary(cbtvFnSa,fYKH_)fYKH_=fYKH_ or 1
return function(...)
local W={...}local o={}for Mm99M=1,fYKH_ do o[Mm99M]=W[Mm99M]end
return cbtvFnSa(hUL(o))end end
function S1wg_DG.noarg(l6YH)return function()return l6YH()end end
function S1wg_DG.rearg(gf2,F744Ew)return
function(...)local zgxKF4={...}local UlvVvSBR={}for i2i,uRGAL in kyWtqIf0(F744Ew)do
UlvVvSBR[i2i]=zgxKF4[uRGAL]end;return gf2(hUL(UlvVvSBR))end end
function S1wg_DG.over(...)local UUlqXyb6={...}return
function(...)local fOR92g8={}for jU26,WIPTsAPz in kyWtqIf0(UUlqXyb6)do
fOR92g8[#fOR92g8+1]=WIPTsAPz(...)end;return fOR92g8 end end
function S1wg_DG.overEvery(...)local DgUx8=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(DgUx8(...),function(imac,xX)
return imac and xX end)end end
function S1wg_DG.overSome(...)local Mfb6Kb=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(Mfb6Kb(...),function(RRjV,TDOaFo)return
RRjV or TDOaFo end)end end
function S1wg_DG.overArgs(tLo4,...)local m72l={...}
return
function(...)local npM3DSU={...}for HGp4e1=1,#m72l do local uzJt7E=m72l[HGp4e1]
if
npM3DSU[HGp4e1]then npM3DSU[HGp4e1]=uzJt7E(npM3DSU[HGp4e1])end end;return
tLo4(hUL(npM3DSU))end end
function S1wg_DG.converge(sRe5S32N,Bp,rg)return
function(...)return sRe5S32N(Bp(...),rg(...))end end
function S1wg_DG.partial(S,...)local Fem={...}
return
function(...)local cHmVGY={...}local g29sXR={}for Vat,sfnkWAy8 in kyWtqIf0(Fem)do
g29sXR[Vat]=
(sfnkWAy8 =='_')and S1wg_DG.shift(cHmVGY)or sfnkWAy8 end;return
S(hUL(S1wg_DG.append(g29sXR,cHmVGY)))end end
function S1wg_DG.partialRight(hbJSGe9,...)local pI={...}
return
function(...)local B7jhm={...}local hj3={}for FKxU4=1,#pI do
hj3[FKxU4]=
(pI[FKxU4]=='_')and S1wg_DG.shift(B7jhm)or pI[FKxU4]end;return
hbJSGe9(hUL(S1wg_DG.append(B7jhm,hj3)))end end
function S1wg_DG.curry(UW,tReY)tReY=tReY or 2;local lex={}
local function h79Pm(vksQpy4)
if tReY==1 then return UW(vksQpy4)end;if vksQpy4 ~=nil then lex[#lex+1]=vksQpy4 end
if#lex<tReY then
return h79Pm else local gPCIWPt={UW(hUL(lex))}lex={}return hUL(gPCIWPt)end end;return h79Pm end;function S1wg_DG.time(l4Byxa7,...)local Fn8OR=Mw()local X1Z0van={l4Byxa7(...)}
return Mw()-Fn8OR,hUL(X1Z0van)end
function S1wg_DG.keys(C_ACFsd)local GC={}for SC7gSvMB in
l(C_ACFsd)do GC[#GC+1]=SC7gSvMB end;return GC end;function S1wg_DG.values(Ei)local GFuK1ut={}
for SXmRY3i,b in l(Ei)do GFuK1ut[#GFuK1ut+1]=b end;return GFuK1ut end
function S1wg_DG.path(KApFr,...)
local jE,yVVmXC=KApFr,{...}
for MkxwoCeK,AT in kyWtqIf0(yVVmXC)do if(jE[AT]==nil)then return end;jE=jE[AT]end;return jE end
function S1wg_DG.spreadPath(_8KO,...)local NI={...}for PE,a in kyWtqIf0(NI)do
if _8KO[a]then for GhVWeuQs,kQlY in l(_8KO[a])do
_8KO[GhVWeuQs]=kQlY;_8KO[a][GhVWeuQs]=nil end end end;return _8KO end
function S1wg_DG.flattenPath(xIl1shq,...)local qv={...}for pbEt6T,MBdHQ in kyWtqIf0(qv)do
if xIl1shq[MBdHQ]then for STXAhhM,assFn in l(xIl1shq[MBdHQ])do
xIl1shq[STXAhhM]=assFn end end end
return xIl1shq end;function S1wg_DG.kvpairs(EXpWzv)local kq={}
for up,wlI_l in l(EXpWzv)do kq[#kq+1]={up,wlI_l}end;return kq end;function S1wg_DG.toObj(nK7J)
local xv={}
for IWG,XVipkEh in kyWtqIf0(nK7J)do xv[XVipkEh[1]]=XVipkEh[2]end;return xv end
function S1wg_DG.invert(Y_xg20)
local lOn={}for Mn29lGrm,y in l(Y_xg20)do lOn[y]=Mn29lGrm end;return lOn end;function S1wg_DG.property(ye3DyN)
return function(XoIfNq)return XoIfNq[ye3DyN]end end
function S1wg_DG.propertyOf(zCZ)return function(KOblE1BH)
return zCZ[KOblE1BH]end end;function S1wg_DG.toBoolean(YPFM2F)return not not YPFM2F end
function S1wg_DG.extend(iA,...)
local f={...}for W,_ in kyWtqIf0(f)do
if v(_)=='table'then for _TPK9KUS,CcTDi in l(_)do iA[_TPK9KUS]=CcTDi end end end;return iA end
function S1wg_DG.functions(HNz,_T9Gn3b2)HNz=HNz or S1wg_DG;local mx={}for X,j in l(HNz)do if v(j)=='function'then
mx[#mx+1]=X end end
if _T9Gn3b2 then
local hwLm=QFKEzBf(HNz)
if hwLm and hwLm.__index then
local Jf1lygU=S1wg_DG.functions(hwLm.__index,_T9Gn3b2)for uCC,VoL in kyWtqIf0(Jf1lygU)do mx[#mx+1]=VoL end end end;return mx end
function S1wg_DG.clone(J1Qkmucu,uy8VNDqE)if v(J1Qkmucu)~='table'then return J1Qkmucu end
local LCuIIfa={}
for SUcXQMl,lyRouGA3 in l(J1Qkmucu)do
if v(lyRouGA3)=='table'then
if not uy8VNDqE then
LCuIIfa[SUcXQMl]=S1wg_DG.clone(lyRouGA3,uy8VNDqE)else LCuIIfa[SUcXQMl]=lyRouGA3 end else LCuIIfa[SUcXQMl]=lyRouGA3 end end;return LCuIIfa end;function S1wg_DG.tap(Q3y7y2,xPOK4sH)xPOK4sH(Q3y7y2)return Q3y7y2 end;function S1wg_DG.has(Px1,SUg)return
Px1[SUg]~=nil end
function S1wg_DG.pick(Wf0F6,...)
local G3=S1wg_DG.flatten{...}local D={}for Yghyekk,axo in l(G3)do
if(Wf0F6[axo])~=nil then D[axo]=Wf0F6[axo]end end;return D end
function S1wg_DG.omit(Sv,...)local aKiYWdc=S1wg_DG.flatten{...}local tSTVAx={}
for E4dT34,L0 in l(Sv)do if not
S1wg_DG.include(aKiYWdc,E4dT34)then tSTVAx[E4dT34]=L0 end end;return tSTVAx end
function S1wg_DG.template(wY,ilY2)if not ilY2 then return wY end;for oe1We,jQLYx1y in l(ilY2)do if not wY[oe1We]then
wY[oe1We]=jQLYx1y end end;return wY end
function S1wg_DG.isEqual(m_zjn,TyjL,JVvqdW4)local kDuC=v(m_zjn)local AUw=v(TyjL)
if kDuC~=AUw then return false end;if kDuC~='table'then return(m_zjn==TyjL)end
local vCkLg=QFKEzBf(m_zjn)local A3mjn=QFKEzBf(TyjL)
if JVvqdW4 then if(vCkLg or A3mjn)and
(vCkLg.__eq or A3mjn.__eq)then
return
vCkLg.__eq(m_zjn,TyjL)or A3mjn.__eq(TyjL,m_zjn)or(m_zjn==TyjL)end end
if S1wg_DG.size(m_zjn)~=S1wg_DG.size(TyjL)then return false end;local Wt5k;for fv5Y2j,bSgv in l(m_zjn)do Wt5k=TyjL[fv5Y2j]
if Wt5k==nil or not
S1wg_DG.isEqual(bSgv,Wt5k,JVvqdW4)then return false end end;for Wa5 in l(TyjL)do if
m_zjn[Wa5]==nil then return false end end
return true end
function S1wg_DG.result(JyrC7,QP)
if JyrC7[QP]then if S1wg_DG.isCallable(JyrC7[QP])then
return JyrC7[QP](JyrC7)else return JyrC7[QP]end end;if S1wg_DG.isCallable(QP)then return QP(JyrC7)end end;function S1wg_DG.isTable(_N)return v(_N)=='table'end
function S1wg_DG.isCallable(U)return
(
(
v(U)=='function')or((v(U)=='table')and QFKEzBf(U)and
QFKEzBf(U).__call~=nil)or false)end
function S1wg_DG.isArray(e5qv6Q)
if not(v(e5qv6Q)=='table')then return false end;local S6XO=0;for p7ogY in l(e5qv6Q)do S6XO=S6XO+1
if e5qv6Q[S6XO]==nil then return false end end;return true end;function S1wg_DG.isIterable(ZDP5SDwL)
return S1wg_DG.toBoolean((l6Sm5(l,ZDP5SDwL)))end
function S1wg_DG.type(T7H)local cdPmXFla=v(T7H)if cdPmXFla==
'userdata'then local gOp2cWZ=QFKEzBf(T7H)
local A1=io and io.stdout or nil
if A1 ~=nil and gOp2cWZ==QFKEzBf(A1)then return'file'end end;return
cdPmXFla end
function S1wg_DG.isEmpty(t51v)if(t51v==nil)then return true end;if v(t51v)=='string'then return
#t51v==0 end
if v(t51v)=='table'then return e(t51v)==nil end;return true end;function S1wg_DG.isString(Hp)return v(Hp)=='string'end;function S1wg_DG.isFunction(Tee9V)return
v(Tee9V)=='function'end;function S1wg_DG.isNil(znHly)return
znHly==nil end
function S1wg_DG.isNumber(cD)return v(cD)=='number'end
function S1wg_DG.isNaN(I)return v(I)=='number'and I~=I end
function S1wg_DG.isFinite(AN9)if v(AN9)~='number'then return false end;return AN9 >-S9TO and
AN9 <S9TO end;function S1wg_DG.isBoolean(CCI)return v(CCI)=='boolean'end;function S1wg_DG.isInteger(Ax_b)
return
v(Ax_b)=='number'and pS78Y(Ax_b)==Ax_b end
do
S1wg_DG.forEach=S1wg_DG.each;S1wg_DG.forEachi=S1wg_DG.eachi;S1wg_DG.update=S1wg_DG.adjust
S1wg_DG.alleq=S1wg_DG.allEqual;S1wg_DG.loop=S1wg_DG.cycle;S1wg_DG.collect=S1wg_DG.map
S1wg_DG.inject=S1wg_DG.reduce;S1wg_DG.foldl=S1wg_DG.reduce
S1wg_DG.injectr=S1wg_DG.reduceRight;S1wg_DG.foldr=S1wg_DG.reduceRight
S1wg_DG.mapr=S1wg_DG.mapReduce;S1wg_DG.maprr=S1wg_DG.mapReduceRight
S1wg_DG.any=S1wg_DG.include;S1wg_DG.some=S1wg_DG.include;S1wg_DG.contains=S1wg_DG.include
S1wg_DG.filter=S1wg_DG.select;S1wg_DG.discard=S1wg_DG.reject;S1wg_DG.every=S1wg_DG.all
S1wg_DG.takeWhile=S1wg_DG.selectWhile;S1wg_DG.rejectWhile=S1wg_DG.dropWhile;S1wg_DG.pop=S1wg_DG.shift
S1wg_DG.remove=S1wg_DG.pull;S1wg_DG.rmRange=S1wg_DG.removeRange
S1wg_DG.chop=S1wg_DG.removeRange;S1wg_DG.sub=S1wg_DG.slice;S1wg_DG.head=S1wg_DG.first
S1wg_DG.take=S1wg_DG.first;S1wg_DG.tail=S1wg_DG.rest;S1wg_DG.without=S1wg_DG.difference
S1wg_DG.diff=S1wg_DG.difference;S1wg_DG.symdiff=S1wg_DG.symmetricDifference
S1wg_DG.xor=S1wg_DG.symmetricDifference;S1wg_DG.uniq=S1wg_DG.unique;S1wg_DG.isuniq=S1wg_DG.isunique
S1wg_DG.transpose=S1wg_DG.zip;S1wg_DG.part=S1wg_DG.partition;S1wg_DG.perm=S1wg_DG.permutation
S1wg_DG.transposeWith=S1wg_DG.zipWith;S1wg_DG.intersperse=S1wg_DG.interpose
S1wg_DG.sliding=S1wg_DG.aperture;S1wg_DG.mirror=S1wg_DG.invert;S1wg_DG.join=S1wg_DG.concat
S1wg_DG.average=S1wg_DG.mean;S1wg_DG.always=S1wg_DG.constant;S1wg_DG.cache=S1wg_DG.memoize
S1wg_DG.juxt=S1wg_DG.juxtapose;S1wg_DG.uid=S1wg_DG.uniqueId;S1wg_DG.iter=S1wg_DG.iterator
S1wg_DG.nAry=S1wg_DG.ary;S1wg_DG.methods=S1wg_DG.functions;S1wg_DG.choose=S1wg_DG.pick
S1wg_DG.drop=S1wg_DG.omit;S1wg_DG.defaults=S1wg_DG.template
S1wg_DG.compare=S1wg_DG.isEqual;S1wg_DG.matches=S1wg_DG.isEqual end
do local Hgc1S={}local gszf={}gszf.__index=Hgc1S;local function GnYt(L7g)
return oUA({_value=L7g,_wrapped=true},gszf)end
oUA(gszf,{__call=function(_IO9,zcnTZ6pI)return GnYt(zcnTZ6pI)end,__index=function(sIPPW,jrXq,...)return
Hgc1S[jrXq]end})function gszf.chain(T5V8Jm3h)return GnYt(T5V8Jm3h)end;function gszf:value()
return self._value end;Hgc1S.chain,Hgc1S.value=gszf.chain,gszf.value
for yYkU,n0 in
l(S1wg_DG)do
if yYkU~='operator'then
Hgc1S[yYkU]=function(nOa2,...)local r=
v(nOa2)=='table'and PizLA9mj(nOa2,'_wrapped')or false
if r then
local zx=nOa2._value;local crsA2=n0(zx,...)return GnYt(crsA2)else return n0(nOa2,...)end end end end;Hgc1S.operator=S1wg_DG.operator;Hgc1S.op=S1wg_DG.operator
Hgc1S.import=function(uIdK8yDV,e7iD7y21)uIdK8yDV=
uIdK8yDV or _ENV or _G;local ec=S1wg_DG.functions()
for x,Ca in
kyWtqIf0(ec)do if PizLA9mj(uIdK8yDV,Ca)~=nil then if not e7iD7y21 then
rawset(uIdK8yDV,Ca,S1wg_DG[Ca])end else
rawset(uIdK8yDV,Ca,S1wg_DG[Ca])end end;return uIdK8yDV end;gszf._VERSION='Moses v'..SWFtRywD
gszf._URL='http://github.com/Yonaba/Moses'
gszf._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'
gszf._DESCRIPTION='utility-belt library for functional programming in Lua'return gszf end
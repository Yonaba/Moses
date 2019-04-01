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
function S1wg_DG.reduce(S,cg4FV7bl,flf9sWX)
for uNoS,ZWoH9V08 in l(S)do if flf9sWX==nil then flf9sWX=ZWoH9V08 else
flf9sWX=cg4FV7bl(flf9sWX,ZWoH9V08)end end;return flf9sWX end
function S1wg_DG.best(RWo,GWBQL)local PCldTUn9,sO_=e(RWo)
for ALbdmINL,b in l(RWo)do if sO_==nil then sO_=b else
sO_=GWBQL(sO_,b)and sO_ or b end end;return sO_ end
function S1wg_DG.reduceBy(DUgF0E,vGxJ6f,a4ga2I,syGyB_)return
S1wg_DG.reduce(S1wg_DG.select(DUgF0E,a4ga2I),vGxJ6f,syGyB_)end;function S1wg_DG.reduceRight(VO,J1r,iBcU3_7D)
return S1wg_DG.reduce(S1wg_DG.reverse(VO),J1r,iBcU3_7D)end
function S1wg_DG.mapReduce(N,M4V,_feve)local OPz_7bk={}for H64aD,ny7 in
l(N)do
OPz_7bk[H64aD]=not _feve and ny7 or M4V(_feve,ny7)_feve=OPz_7bk[H64aD]end;return
OPz_7bk end
function S1wg_DG.mapReduceRight(QDj6GAX,k6pXzd,hsLwu)return
S1wg_DG.mapReduce(S1wg_DG.reverse(QDj6GAX),k6pXzd,hsLwu)end
function S1wg_DG.include(R,JKZ)
local yHbsh=(v(JKZ)=='function')and JKZ or S1wg_DG.isEqual;for d4z,i in l(R)do if yHbsh(i,JKZ)then return true end end
return false end
function S1wg_DG.detect(HyEk4lbh,PhU)
local rWwbNge=(v(PhU)=='function')and PhU or S1wg_DG.isEqual
for SKxD,o3uQKvJ in l(HyEk4lbh)do if rWwbNge(o3uQKvJ,PhU)then return SKxD end end end
function S1wg_DG.where(vAZm,q)
local fFuE=S1wg_DG.select(vAZm,function(KypMW)for JJT4nKO in l(q)do
if KypMW[JJT4nKO]~=q[JJT4nKO]then return false end end;return true end)return#fFuE>0 and fFuE or nil end
function S1wg_DG.findWhere(TFLF,hEoAa)
local PGN=S1wg_DG.detect(TFLF,function(K2_kF5)for YpimJ in l(hEoAa)do if hEoAa[YpimJ]~=K2_kF5[YpimJ]then
return false end end;return true end)return PGN and TFLF[PGN]end
function S1wg_DG.select(Gg7Ttui,_)local EGeAf={}for ymP,z5pHKyoa in l(Gg7Ttui)do if _(z5pHKyoa,ymP)then
EGeAf[#EGeAf+1]=z5pHKyoa end end
return EGeAf end
function S1wg_DG.reject(h,xwT)local y33ux={}for Ut,GOijBp in l(h)do if not xwT(GOijBp,Ut)then
y33ux[#y33ux+1]=GOijBp end end;return y33ux end;function S1wg_DG.all(oUi,b2a3)
for xer,SQHAAR in l(oUi)do if not b2a3(SQHAAR,xer)then return false end end;return true end
function S1wg_DG.invoke(qybRcP1,z)
return
S1wg_DG.map(qybRcP1,function(N0NaR,FBfW)
if(
v(N0NaR)=='table')then
if N0NaR[z]then if S1wg_DG.isCallable(N0NaR[z])then return
N0NaR[z](N0NaR,FBfW)else return N0NaR[z]end else if
S1wg_DG.isCallable(z)then return z(N0NaR,FBfW)end end elseif S1wg_DG.isCallable(z)then return z(N0NaR,FBfW)end end)end
function S1wg_DG.pluck(lnM4,_oDmX_)local t={}for K,ppm021I in l(lnM4)do
if ppm021I[_oDmX_]then t[#t+1]=ppm021I[_oDmX_]end end;return t end;function S1wg_DG.max(ASUXhD,KCm)return z5i2i(ASUXhD,sf0,KCm)end;function S1wg_DG.min(u,fDk)return
z5i2i(u,qxZa6ozV,fDk)end
function S1wg_DG.same(gxYY,sVMxk)return
S1wg_DG.all(gxYY,function(SyD)return
S1wg_DG.include(sVMxk,SyD)end)and S1wg_DG.all(sVMxk,function(v4)return
S1wg_DG.include(gxYY,v4)end)end;function S1wg_DG.sort(j7siW,Hl)p(j7siW,Hl)return j7siW end
function S1wg_DG.sortedk(AP060rq,DIEKD10)
local lLJ=S1wg_DG.keys(AP060rq)p(lLJ,DIEKD10)local EicsS=0;return function()EicsS=EicsS+1
return lLJ[EicsS],AP060rq[lLJ[EicsS]]end end
function S1wg_DG.sortedv(JubU,L)local JKci=S1wg_DG.keys(JubU)L=L or qxZa6ozV
p(JKci,function(o,ZOmcmO)return
L(JubU[o],JubU[ZOmcmO])end)local SsBe=0;return
function()SsBe=SsBe+1;return JKci[SsBe],JubU[JKci[SsBe]]end end
function S1wg_DG.sortBy(_G19JrRB,m0r3_J,MLrs)local hP5=m0r3_J or S1wg_DG.identity
if
(v(m0r3_J)=='string')then hP5=function(_G19JrRB)return _G19JrRB[m0r3_J]end end;MLrs=MLrs or qxZa6ozV
p(_G19JrRB,function(oqjhEZb0,Pha)
return MLrs(hP5(oqjhEZb0),hP5(Pha))end)return _G19JrRB end
function S1wg_DG.groupBy(G,MOrzq4)local bEMp={}
for dd,MOQN in l(G)do local O=MOrzq4(MOQN,dd)if bEMp[O]then
bEMp[O][#bEMp[O]+1]=MOQN else bEMp[O]={MOQN}end end;return bEMp end
function S1wg_DG.countBy(FEpet,P)local G={}for EcLLM,wo in l(FEpet)do local ur=P(wo,EcLLM)
G[ur]=(G[ur]or 0)+1 end;return G end;function S1wg_DG.size(...)local XTX={...}local wc8hjKp1=XTX[1]
return(v(wc8hjKp1)=='table')and
hgW2H5(XTX[1])or hgW2H5(XTX)end
function S1wg_DG.containsKeys(f,Hjag)for Yg in
l(Hjag)do if not f[Yg]then return false end end;return true end
function S1wg_DG.sameKeys(uc,bw)
for ad in l(uc)do if not bw[ad]then return false end end
for EG344W in l(bw)do if not uc[EG344W]then return false end end;return true end
function S1wg_DG.sample(MVlUhPEM,LT,pfiWYrg)LT=LT or 1;if LT==0 then return{}end
if LT==1 then
if pfiWYrg then GQLN(pfiWYrg)end;return{MVlUhPEM[toXyq(1,#MVlUhPEM)]}end
return S1wg_DG.slice(S1wg_DG.shuffle(MVlUhPEM,pfiWYrg),1,LT)end
function S1wg_DG.sampleProb(smnX9H6,FzRhHR,mMBxOoQa)if mMBxOoQa then GQLN(mMBxOoQa)end;local xYSLIT={}for Eae7ILmk,Jy23ZRAA in
kyWtqIf0(smnX9H6)do
if toXyq()<FzRhHR then xYSLIT[#xYSLIT+1]=Jy23ZRAA end end;return xYSLIT end
function S1wg_DG.nsorted(V8IWw,uyYdf,K)K=K or qxZa6ozV;uyYdf=uyYdf or 1;local ZX,hgW2H5={},0;for tbdC,VaY3 in
S1wg_DG.sortedv(V8IWw,K)do
if hgW2H5 <uyYdf then hgW2H5=hgW2H5+1;ZX[hgW2H5]=VaY3 end end;return ZX end
function S1wg_DG.shuffle(HK7Mbgze,VXPfx)if VXPfx then GQLN(VXPfx)end;local j3Qk={}for X1,GpruB in kyWtqIf0(HK7Mbgze)do local r=pS78Y(
toXyq()*X1)+1;j3Qk[X1]=j3Qk[r]
j3Qk[r]=GpruB end;return j3Qk end;function S1wg_DG.pack(...)return{...}end;function S1wg_DG.find(V7YqV,JbvH7,Cqk9Luq)
for PeAP9X=Cqk9Luq or 1,#V7YqV do if
S1wg_DG.isEqual(V7YqV[PeAP9X],JbvH7)then return PeAP9X end end end
function S1wg_DG.reverse(vN5AF9)
local j={}for EOgmP=#vN5AF9,1,-1 do j[#j+1]=vN5AF9[EOgmP]end;return j end
function S1wg_DG.fill(jmJof,yz1Kuwby,KVE6TG,YY)YY=YY or S1wg_DG.size(jmJof)for KVE6TG=KVE6TG or 1,YY do
jmJof[KVE6TG]=yz1Kuwby end;return jmJof end
function S1wg_DG.zeros(r9)return S1wg_DG.fill({},0,1,r9)end
function S1wg_DG.ones(mtUG)return S1wg_DG.fill({},1,1,mtUG)end
function S1wg_DG.vector(PFRuf,KhK1gRj9)return S1wg_DG.fill({},PFRuf,1,KhK1gRj9)end
function S1wg_DG.selectWhile(Xgj,Ko)local A={}for IU6Om,sKIIqz in kyWtqIf0(Xgj)do
if Ko(sKIIqz,IU6Om)then A[IU6Om]=sKIIqz else break end end;return A end
function S1wg_DG.dropWhile(wmhARqEa,_RT3)local V;for BTA,QVEYENaX in kyWtqIf0(wmhARqEa)do
if not _RT3(QVEYENaX,BTA)then V=BTA;break end end;if(V==nil)then return{}end;return
S1wg_DG.rest(wmhARqEa,V)end
function S1wg_DG.sortedIndex(gxqa,q4,QyKi,_o3FE)local n=QyKi or qxZa6ozV
if(_o3FE==true)then p(gxqa,n)end
for WM=1,#gxqa do if not n(gxqa[WM],q4)then return WM end end;return#gxqa+1 end;function S1wg_DG.indexOf(zb8b,YBqeh)
for WRkIg=1,#zb8b do if zb8b[WRkIg]==YBqeh then return WRkIg end end end
function S1wg_DG.lastIndexOf(RH_vLUg,aEH)
local g20N7=S1wg_DG.indexOf(S1wg_DG.reverse(RH_vLUg),aEH)if g20N7 then return#RH_vLUg-g20N7+1 end end;function S1wg_DG.findIndex(puZN,_Dy)
for MC=1,#puZN do if _Dy(puZN[MC],MC)then return MC end end end
function S1wg_DG.findLastIndex(WOBSVeqF,A)
local vqW6=S1wg_DG.findIndex(S1wg_DG.reverse(WOBSVeqF),A)if vqW6 then return#WOBSVeqF-vqW6+1 end end;function S1wg_DG.addTop(R4oRlgh,...)
for rBRXA,qfFSJN in kyWtqIf0({...})do odpE(R4oRlgh,1,qfFSJN)end;return R4oRlgh end;function S1wg_DG.prepend(Va8fT08T,...)return
S1wg_DG.append({...},Va8fT08T)end;function S1wg_DG.push(d778,...)
local aZT={...}
for ni9je9bJ,uwwNE in kyWtqIf0({...})do d778[#d778+1]=uwwNE end;return d778 end
function S1wg_DG.shift(X40cF,EW)EW=RlMSrmdD(
EW or 1,#X40cF)local asgq={}for IQybL1=1,EW do local hYKT45=X40cF[1]
asgq[#asgq+1]=hYKT45;lIpFkbLI(X40cF,1)end
return hUL(asgq)end
function S1wg_DG.unshift(Rq7,LQ_EIcl)LQ_EIcl=RlMSrmdD(LQ_EIcl or 1,#Rq7)local uaL={}
for gujcrFp=1,LQ_EIcl do local ph06vXj=Rq7[
#Rq7]uaL[#uaL+1]=ph06vXj;lIpFkbLI(Rq7)end;return hUL(uaL)end
function S1wg_DG.pull(nH0LB4c,...)local ALwJ9={...}
for _X=#nH0LB4c,1,-1 do local ruXMob=false;for E,jcgjAE in kyWtqIf0(ALwJ9)do
if
(ruXMob==false)then if S1wg_DG.isEqual(nH0LB4c[_X],jcgjAE)then lIpFkbLI(nH0LB4c,_X)
ruXMob=true end end end end;return nH0LB4c end
function S1wg_DG.removeRange(BZmaGN,HSav,sDjMr)HSav=HSav or 1;sDjMr=sDjMr or#BZmaGN;if HSav>sDjMr then
zupvsz("start cannot be greater than finish.")end
for biQX3Ut=sDjMr,HSav,-1 do lIpFkbLI(BZmaGN,biQX3Ut)end;return BZmaGN end
function S1wg_DG.chunk(BLEXN_,Ljc)local fpN7T,FNSk_,LmE,pZTFVP={},0;Ljc=Ljc or S1wg_DG.identity
for XL,L5vC0Jx in
kyWtqIf0(BLEXN_)do pZTFVP=Ljc(L5vC0Jx,XL)
FNSk_=((pZTFVP~=LmE)and(FNSk_+1)or FNSk_)LmE=(LmE==nil)and pZTFVP or LmE;if
not fpN7T[FNSk_]then fpN7T[FNSk_]={BLEXN_[XL]}else
fpN7T[FNSk_][#fpN7T[FNSk_]+1]=BLEXN_[XL]end;LmE=pZTFVP end;return fpN7T end
function S1wg_DG.slice(vpONJ,A,LN)local dA14qP={}for JcQc=A or 1,LN or#vpONJ do
dA14qP[#dA14qP+1]=vpONJ[JcQc]end;return dA14qP end
function S1wg_DG.first(hDih6_D,QKbZ464i)QKbZ464i=QKbZ464i or 1;local F1TsZ={}for uF2=1,QKbZ464i do
F1TsZ[uF2]=hDih6_D[uF2]end;return F1TsZ end
function S1wg_DG.initial(T,pC_)local ju=#T
pC_=pC_ and ju- (RlMSrmdD(pC_,ju))or ju-1;local deu1={}for IgZ6=1,pC_ do deu1[IgZ6]=T[IgZ6]end;return deu1 end
function S1wg_DG.last(kVRiv3F,kWMf)local DawC=#kVRiv3F;kWMf=
kWMf and DawC-RlMSrmdD(kWMf-1,DawC-1)or 2;local cP={}for w=kWMf,DawC do
cP[#cP+1]=kVRiv3F[w]end;return cP end;function S1wg_DG.rest(UZ,tdH)local ymt={}
for WxGA=tdH or 1,#UZ do ymt[#ymt+1]=UZ[WxGA]end;return ymt end;function S1wg_DG.nth(jBuHkH,E3)return
jBuHkH[E3]end
function S1wg_DG.compact(CZi_zK)local _6KCMph={}for PY3VqYZ8,V in l(CZi_zK)do if V then
_6KCMph[#_6KCMph+1]=V end end;return _6KCMph end
function S1wg_DG.flatten(y,QF)QF=QF or false;local hN;local hVflx4kh={}
for GP,oCZYv2dT in kyWtqIf0(y)do
if v(oCZYv2dT)=='table'then
hN=
QF and oCZYv2dT or S1wg_DG.flatten(oCZYv2dT)
for RLaqM3,PoH in kyWtqIf0(hN)do hVflx4kh[#hVflx4kh+1]=PoH end else hVflx4kh[#hVflx4kh+1]=oCZYv2dT end end;return hVflx4kh end
function S1wg_DG.difference(xM709D,z50)
if not z50 then return S1wg_DG.clone(xM709D)end;return
S1wg_DG.select(xM709D,function(sAPD)return not S1wg_DG.include(z50,sAPD)end)end;function S1wg_DG.union(...)
return S1wg_DG.unique(S1wg_DG.flatten({...}))end
function S1wg_DG.intersection(...)local AVFi={...}
local GGKI=AVFi[1]lIpFkbLI(AVFi,1)local gWaGu={}
for SFKM,j6jQmlbr in kyWtqIf0(GGKI)do
if
S1wg_DG.all(AVFi,function(m403CY)return
S1wg_DG.include(m403CY,j6jQmlbr)end)then gWaGu[#gWaGu+1]=j6jQmlbr end end;return gWaGu end;function S1wg_DG.disjoint(...)return
(#S1wg_DG.intersection(...)==0)end
function S1wg_DG.symmetricDifference(dL,PrTsHeT)return
S1wg_DG.difference(S1wg_DG.union(dL,PrTsHeT),S1wg_DG.intersection(dL,PrTsHeT))end
function S1wg_DG.unique(eNI3MT7)local Rfoo={}for eUJhGD=1,#eNI3MT7 do
if
not S1wg_DG.find(Rfoo,eNI3MT7[eUJhGD])then Rfoo[#Rfoo+1]=eNI3MT7[eUJhGD]end end;return Rfoo end;function S1wg_DG.isunique(wot8)return
#wot8 ==# (S1wg_DG.unique(wot8))end
function S1wg_DG.duplicates(j9vJ)
local J6Qr27Mh=S1wg_DG.invert(j9vJ)local AwxW8Do={}for _u,B in kyWtqIf0(j9vJ)do
if J6Qr27Mh[B]~=_u and
not S1wg_DG.find(AwxW8Do,B)then AwxW8Do[#AwxW8Do+1]=B end end;return AwxW8Do end
function S1wg_DG.zip(...)local cdxFVpZw={...}
local Y=S1wg_DG.max(cdxFVpZw,function(BuX1r)return#BuX1r end)local o9Uh={}
for Wyf83f2=1,Y do if not o9Uh[Wyf83f2]then o9Uh[Wyf83f2]={}end
for P0olj,z in
kyWtqIf0(cdxFVpZw)do if(z[Wyf83f2]~=nil)then
o9Uh[Wyf83f2][#o9Uh[Wyf83f2]+1]=z[Wyf83f2]end end end;return o9Uh end
function S1wg_DG.zipWith(EHCCkt,...)local x={...}
local xNWVmS=S1wg_DG.max(x,function(Pkis6H28)return#Pkis6H28 end)local kGWnkgDu={}for tSE=1,xNWVmS do
kGWnkgDu[tSE]=EHCCkt(hUL(S1wg_DG.pluck(x,tSE)))end;return kGWnkgDu end
function S1wg_DG.append(abKH,LDp)local GWouUlzZ={}
for MqJhIr,Q9 in kyWtqIf0(abKH)do GWouUlzZ[MqJhIr]=Q9 end
for c,qnZ81I in kyWtqIf0(LDp)do GWouUlzZ[#GWouUlzZ+1]=qnZ81I end;return GWouUlzZ end
function S1wg_DG.interleave(...)local N9uN={...}
local QGC=S1wg_DG.max(N9uN,S1wg_DG.size)local K8iFU={}
for gbU=1,QGC do for h,hS7 in kyWtqIf0(N9uN)do
if hS7[gbU]then K8iFU[#K8iFU+1]=hS7[gbU]end end end;return K8iFU end;function S1wg_DG.interpose(KQjMKhN,R6PYgHHE)
for ZwCXrLO=#KQjMKhN,2,-1 do odpE(KQjMKhN,ZwCXrLO,R6PYgHHE)end;return KQjMKhN end
function S1wg_DG.range(lI,iMSMP5Lp,WoARZdZ3)
if
(
lI==nil)and(iMSMP5Lp==nil)and(WoARZdZ3 ==nil)then return{}elseif
(lI~=nil)and(iMSMP5Lp==nil)and(WoARZdZ3 ==nil)then lI,iMSMP5Lp,WoARZdZ3=Ub(lI),lI,Ub(lI)elseif
(lI~=nil)and(iMSMP5Lp~=nil)and(WoARZdZ3 ==nil)then
WoARZdZ3=Ub(iMSMP5Lp-lI)end;local n={lI}
local Uj=BCf7(pS78Y((iMSMP5Lp-lI)/WoARZdZ3),0)for HpN_N=1,Uj do n[#n+1]=lI+WoARZdZ3*HpN_N end;return n end
function S1wg_DG.rep(yP3QEJ,pwi)local QP={}for Iy=1,pwi do QP[Iy]=yP3QEJ end;return QP end
function S1wg_DG.powerset(O9P0mj)local eFGwPxi=#O9P0mj;local m4x8ZsD4={}
for _witc0Pe,Y8E in kyWtqIf0(O9P0mj)do for h=1,#m4x8ZsD4 do
local EnMMG=m4x8ZsD4[h]
odpE(m4x8ZsD4,S1wg_DG.push(S1wg_DG.slice(EnMMG),Y8E))end
odpE(m4x8ZsD4,{Y8E})end;odpE(m4x8ZsD4,{})return m4x8ZsD4 end;function S1wg_DG.partition(HzO7UpZ,B,RNTu)if B<=0 then return end
return OV7(function()
MGSnnzOI(HzO7UpZ,B or 1,X83a,RNTu)end)end
function S1wg_DG.overlapping(Q_,S8GB,W7yjGm)if
S8GB<=1 then return end;return
OV7(function()B0o5xpg7(Q_,S8GB or 2,X83a,W7yjGm)end)end;function S1wg_DG.aperture(X,Y)if Y<=1 then return end;return
OV7(function()VQT(X,Y or 2,X83a)end)end;function S1wg_DG.pairwise(qqvEf3)return
S1wg_DG.aperture(qqvEf3,2)end
function S1wg_DG.permutation(Wriu)return OV7(function()
Id(Wriu,#Wriu,X83a)end)end
function S1wg_DG.concat(I0Pxr5F,ukGf_,uZpt01P,hJk0n8bR)return
JdUtcU(S1wg_DG.map(I0Pxr5F,tostring),ukGf_,uZpt01P,hJk0n8bR)end
function S1wg_DG.xprod(o9DTTJig,v4)local Uaq2_Xzk={}
for S0DM,GHasi5 in kyWtqIf0(o9DTTJig)do for QeX_U9tm,Dp9m in kyWtqIf0(v4)do
Uaq2_Xzk[#Uaq2_Xzk+1]={GHasi5,Dp9m}end end;return Uaq2_Xzk end;function S1wg_DG.xpairs(sJjNM,GnSs)local XP={}
for Sj,yKj1 in kyWtqIf0(GnSs)do XP[Sj]={sJjNM,yKj1}end;return XP end;function S1wg_DG.xpairsRight(F9WZ,A5)
local nY_O={}for QAJAyj5,EZ in kyWtqIf0(A5)do nY_O[QAJAyj5]={EZ,F9WZ}end
return nY_O end
function S1wg_DG.sum(n)
local M=0;for AADiL1,Arw in kyWtqIf0(n)do M=M+Arw end;return M end;function S1wg_DG.product(b)local _ZM1Yj3=1
for rmSU,L2RHrI in kyWtqIf0(b)do _ZM1Yj3=_ZM1Yj3*L2RHrI end;return _ZM1Yj3 end
function S1wg_DG.mean(XW7Y5Rz)return
S1wg_DG.sum(XW7Y5Rz)/ (#XW7Y5Rz)end
function S1wg_DG.median(C)
local NhwEkTd=S1wg_DG.sort(S1wg_DG.clone(C))local XGz=#NhwEkTd
if XGz==0 then return elseif XGz==1 then return NhwEkTd[1]end;local Tf4P2eIf=VCD(XGz/2)return
XGz%2 ==0 and
(NhwEkTd[Tf4P2eIf]+NhwEkTd[Tf4P2eIf+1])/2 or NhwEkTd[Tf4P2eIf]end;function S1wg_DG.noop()return end;function S1wg_DG.identity(TF3Htu)return TF3Htu end;function S1wg_DG.call(K5yUw1t,...)return
K5yUw1t(...)end;function S1wg_DG.constant(Mi)
return function()return Mi end end
function S1wg_DG.applySpec(WWyrqnSL)return
function(...)local gVTyP={}for Ck,CRG in l(WWyrqnSL)do
gVTyP[Ck]=CRG(...)end;return gVTyP end end
function S1wg_DG.thread(dkz,...)local zrCq=dkz;local azXMvVdM={...}
for CBgxHfbq,WO in kyWtqIf0(azXMvVdM)do if v(WO)=='function'then
zrCq=WO(zrCq)elseif v(WO)=='table'then local H=WO[1]lIpFkbLI(WO,1)
zrCq=S1wg_DG.reduce(WO,H,zrCq)end end;return zrCq end
function S1wg_DG.threadRight(C28NuJ3,...)local sz=C28NuJ3;local qH={...}
for u,uJ1Vn4uYP in kyWtqIf0(qH)do
if v(uJ1Vn4uYP)=='function'then
sz=uJ1Vn4uYP(sz)elseif v(uJ1Vn4uYP)=='table'then local Z=uJ1Vn4uYP[1]
lIpFkbLI(uJ1Vn4uYP,1)odpE(uJ1Vn4uYP,sz)sz=S1wg_DG.reduce(uJ1Vn4uYP,Z)end end;return sz end
function S1wg_DG.dispatch(...)local pJ={...}return
function(...)for NAjg,con in kyWtqIf0(pJ)do local I={con(...)}
if#I>0 then return hUL(I)end end end end
function S1wg_DG.memoize(TxmZR6UE)local I1b4o=oUA({},{__mode='kv'})
return function(nAt)if
(I1b4o[nAt]==nil)then I1b4o[nAt]=TxmZR6UE(nAt)end
return I1b4o[nAt]end end
function S1wg_DG.unfold(pNJ,RQ)local wnZcHKf,Lv_8={}
while true do Lv_8,RQ=pNJ(RQ)if Lv_8 ~=nil then
wnZcHKf[#wnZcHKf+1]=Lv_8 else break end end;return wnZcHKf end;function S1wg_DG.once(UQ)local FG=0;local vLzqjJw={}
return function(...)FG=FG+1;if FG<=1 then vLzqjJw={...}end;return
UQ(hUL(vLzqjJw))end end
function S1wg_DG.before(v2dsC21,hgW2H5)
local O=0;local wx={}return
function(...)O=O+1;if O<=hgW2H5 then wx={...}end;return v2dsC21(hUL(wx))end end
function S1wg_DG.after(u,hgW2H5)local V_84V,qF=hgW2H5,0;return
function(...)qF=qF+1;if qF>=V_84V then return u(...)end end end
function S1wg_DG.compose(...)local IZbOX7TW=S1wg_DG.reverse{...}
return
function(...)local Dd6ZLpU,MP=true
for w4c,C58 in
kyWtqIf0(IZbOX7TW)do if Dd6ZLpU then Dd6ZLpU=false;MP=C58(...)else MP=C58(MP)end end;return MP end end
function S1wg_DG.pipe(Jk6Nh,...)return S1wg_DG.compose(...)(Jk6Nh)end;function S1wg_DG.complement(s1Ws)
return function(...)return not s1Ws(...)end end
function S1wg_DG.juxtapose(desLYv,...)local COq2NY9I={}for aoBEg65S,x6 in
kyWtqIf0({...})do COq2NY9I[aoBEg65S]=x6(desLYv)end;return
hUL(COq2NY9I)end;function S1wg_DG.wrap(t3cNa2l,Ik)
return function(...)return Ik(t3cNa2l,...)end end
function S1wg_DG.times(SeHOs,P2rGsUx)local c={}for v12AhMm=1,(P2rGsUx or 1)do
c[v12AhMm]=SeHOs(v12AhMm)end;return c end;function S1wg_DG.bind(F2uxGC,Xs0)
return function(...)return F2uxGC(Xs0,...)end end
function S1wg_DG.bind2(QK8ibF,TEio7k0z)return function(u,...)
return QK8ibF(u,TEio7k0z,...)end end;function S1wg_DG.bindn(N,...)local O2YgxDc={...}
return function(...)return
N(hUL(S1wg_DG.append(O2YgxDc,{...})))end end
function S1wg_DG.bindall(VLsC67,...)
local OHw4={...}
for FKZ,Fl in kyWtqIf0(OHw4)do local QhS8FvKI=VLsC67[Fl]if QhS8FvKI then
VLsC67[Fl]=S1wg_DG.bind(QhS8FvKI,VLsC67)end end;return VLsC67 end;function S1wg_DG.cond(FaZIJL)
return function(...)
for sOT2O5,x in kyWtqIf0(FaZIJL)do if x[1](...)then return x[2](...)end end end end
function S1wg_DG.both(...)
local Wswd_OC={...}
return function(...)
for E,A0Un in kyWtqIf0(Wswd_OC)do if not A0Un(...)then return false end end;return true end end
function S1wg_DG.either(...)local nRHrI={...}
return function(...)
for kZp,A in kyWtqIf0(nRHrI)do if A(...)then return true end end;return false end end;function S1wg_DG.neither(...)local _L_={...}
return function(...)
for WHpm,g in kyWtqIf0(_L_)do if g(...)then return false end end;return true end end
function S1wg_DG.uniqueId(HiR3yiw)qJExeUn2=
qJExeUn2+1;if HiR3yiw then
if v(HiR3yiw)=='string'then
return HiR3yiw:format(qJExeUn2)elseif v(HiR3yiw)=='function'then return HiR3yiw(qJExeUn2)end end
return qJExeUn2 end
function S1wg_DG.iterator(KeKbiDqN,WfrZqHH8,YX9s9O)local y64dF=0;return
function()y64dF=y64dF+1
if YX9s9O and y64dF>YX9s9O then return end;WfrZqHH8=KeKbiDqN(WfrZqHH8)return WfrZqHH8 end end;function S1wg_DG.skip(sNSsH,K)
for o8T=1,(K or 1)do if sNSsH()==nil then return end end;return sNSsH end
function S1wg_DG.tabulate(...)
local xeP={}for Tv_3VlmX in...do xeP[#xeP+1]=Tv_3VlmX end;return xeP end
function S1wg_DG.iterlen(...)local BT=0;for _y3z in...do BT=BT+1 end;return BT end;function S1wg_DG.castArray(rdl)
return(v(rdl)~='table')and{rdl}or rdl end;function S1wg_DG.flip(NAP_5jYs)
return function(...)return
NAP_5jYs(hUL(S1wg_DG.reverse({...})))end end;function S1wg_DG.nthArg(BZnlpW)
return function(...)local isN={...}return
isN[(
BZnlpW<0)and(#isN+BZnlpW+1)or BZnlpW]end end;function S1wg_DG.unary(yRADzw1v)
return function(...)
local Jafp={...}return yRADzw1v(Jafp[1])end end
function S1wg_DG.ary(XWh8Ee,kpezL1e)
kpezL1e=kpezL1e or 1;return
function(...)local h={...}local R7yfz_l9={}
for D35PFLu=1,kpezL1e do R7yfz_l9[D35PFLu]=h[D35PFLu]end;return XWh8Ee(hUL(R7yfz_l9))end end
function S1wg_DG.noarg(wK)return function()return wK()end end
function S1wg_DG.rearg(qeEwE,cbtvFnSa)return
function(...)local fYKH_={...}local W={}
for o,Mm99M in kyWtqIf0(cbtvFnSa)do W[o]=fYKH_[Mm99M]end;return qeEwE(hUL(W))end end
function S1wg_DG.over(...)local l6YH={...}return
function(...)local gf2={}for F744Ew,zgxKF4 in kyWtqIf0(l6YH)do
gf2[#gf2+1]=zgxKF4(...)end;return gf2 end end
function S1wg_DG.overEvery(...)local UlvVvSBR=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(UlvVvSBR(...),function(i2i,uRGAL)return
i2i and uRGAL end)end end
function S1wg_DG.overSome(...)local UUlqXyb6=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(UUlqXyb6(...),function(fOR92g8,jU26)return
fOR92g8 or jU26 end)end end
function S1wg_DG.overArgs(WIPTsAPz,...)local DgUx8={...}
return
function(...)local imac={...}for xX=1,#DgUx8 do local Mfb6Kb=DgUx8[xX]if imac[xX]then
imac[xX]=Mfb6Kb(imac[xX])end end;return
WIPTsAPz(hUL(imac))end end
function S1wg_DG.converge(RRjV,TDOaFo,tLo4)return
function(...)return RRjV(TDOaFo(...),tLo4(...))end end
function S1wg_DG.partial(m72l,...)local npM3DSU={...}
return
function(...)local HGp4e1={...}local uzJt7E={}for sRe5S32N,Bp in kyWtqIf0(npM3DSU)do
uzJt7E[sRe5S32N]=(
Bp=='_')and S1wg_DG.shift(HGp4e1)or Bp end;return
m72l(hUL(S1wg_DG.append(uzJt7E,HGp4e1)))end end
function S1wg_DG.partialRight(rg,...)local S={...}
return
function(...)local Fem={...}local cHmVGY={}for g29sXR=1,#S do
cHmVGY[g29sXR]=
(S[g29sXR]=='_')and S1wg_DG.shift(Fem)or S[g29sXR]end;return
rg(hUL(S1wg_DG.append(Fem,cHmVGY)))end end
function S1wg_DG.curry(Vat,sfnkWAy8)sfnkWAy8=sfnkWAy8 or 2;local hbJSGe9={}
local function pI(B7jhm)
if sfnkWAy8 ==1 then return Vat(B7jhm)end;if B7jhm~=nil then hbJSGe9[#hbJSGe9+1]=B7jhm end;if#
hbJSGe9 <sfnkWAy8 then return pI else local hj3={Vat(hUL(hbJSGe9))}
hbJSGe9={}return hUL(hj3)end end;return pI end
function S1wg_DG.time(FKxU4,...)local UW=Mw()local tReY={FKxU4(...)}return Mw()-UW,hUL(tReY)end;function S1wg_DG.keys(lex)local h79Pm={}
for vksQpy4 in l(lex)do h79Pm[#h79Pm+1]=vksQpy4 end;return h79Pm end
function S1wg_DG.values(gPCIWPt)
local l4Byxa7={}
for Fn8OR,X1Z0van in l(gPCIWPt)do l4Byxa7[#l4Byxa7+1]=X1Z0van end;return l4Byxa7 end
function S1wg_DG.path(C_ACFsd,...)local GC,SC7gSvMB=C_ACFsd,{...}
for Ei,GFuK1ut in kyWtqIf0(SC7gSvMB)do if
(GC[GFuK1ut]==nil)then return end;GC=GC[GFuK1ut]end;return GC end
function S1wg_DG.spreadPath(SXmRY3i,...)local b={...}
for KApFr,jE in kyWtqIf0(b)do if SXmRY3i[jE]then
for yVVmXC,MkxwoCeK in l(SXmRY3i[jE])do
SXmRY3i[yVVmXC]=MkxwoCeK;SXmRY3i[jE][yVVmXC]=nil end end end;return SXmRY3i end
function S1wg_DG.flattenPath(AT,...)local _8KO={...}
for NI,PE in kyWtqIf0(_8KO)do if AT[PE]then
for a,GhVWeuQs in l(AT[PE])do AT[a]=GhVWeuQs end end end;return AT end
function S1wg_DG.kvpairs(kQlY)local xIl1shq={}for qv,pbEt6T in l(kQlY)do
xIl1shq[#xIl1shq+1]={qv,pbEt6T}end;return xIl1shq end
function S1wg_DG.toObj(MBdHQ)local STXAhhM={}for assFn,EXpWzv in kyWtqIf0(MBdHQ)do
STXAhhM[EXpWzv[1]]=EXpWzv[2]end;return STXAhhM end
function S1wg_DG.invert(kq)local up={}for wlI_l,nK7J in l(kq)do up[nK7J]=wlI_l end;return up end
function S1wg_DG.property(xv)return function(IWG)return IWG[xv]end end;function S1wg_DG.propertyOf(XVipkEh)
return function(Y_xg20)return XVipkEh[Y_xg20]end end;function S1wg_DG.toBoolean(lOn)
return not not lOn end
function S1wg_DG.extend(Mn29lGrm,...)local y={...}for ye3DyN,XoIfNq in kyWtqIf0(y)do
if
v(XoIfNq)=='table'then for zCZ,KOblE1BH in l(XoIfNq)do Mn29lGrm[zCZ]=KOblE1BH end end end;return Mn29lGrm end
function S1wg_DG.functions(YPFM2F,iA)YPFM2F=YPFM2F or S1wg_DG;local f={}for W,_ in l(YPFM2F)do if v(_)=='function'then
f[#f+1]=W end end
if iA then
local _TPK9KUS=QFKEzBf(YPFM2F)
if _TPK9KUS and _TPK9KUS.__index then
local CcTDi=S1wg_DG.functions(_TPK9KUS.__index,iA)for HNz,_T9Gn3b2 in kyWtqIf0(CcTDi)do f[#f+1]=_T9Gn3b2 end end end;return f end
function S1wg_DG.clone(mx,X)if v(mx)~='table'then return mx end;local j={}
for hwLm,Jf1lygU in l(mx)do
if
v(Jf1lygU)=='table'then
if not X then j[hwLm]=S1wg_DG.clone(Jf1lygU,X)else j[hwLm]=Jf1lygU end else j[hwLm]=Jf1lygU end end;return j end;function S1wg_DG.tap(uCC,VoL)VoL(uCC)return uCC end;function S1wg_DG.has(J1Qkmucu,uy8VNDqE)return
J1Qkmucu[uy8VNDqE]~=nil end
function S1wg_DG.pick(LCuIIfa,...)
local SUcXQMl=S1wg_DG.flatten{...}local lyRouGA3={}
for Q3y7y2,xPOK4sH in l(SUcXQMl)do if(LCuIIfa[xPOK4sH])~=nil then
lyRouGA3[xPOK4sH]=LCuIIfa[xPOK4sH]end end;return lyRouGA3 end
function S1wg_DG.omit(Px1,...)local SUg=S1wg_DG.flatten{...}local Wf0F6={}
for G3,D in l(Px1)do if not
S1wg_DG.include(SUg,G3)then Wf0F6[G3]=D end end;return Wf0F6 end
function S1wg_DG.template(Yghyekk,axo)if not axo then return Yghyekk end;for Sv,aKiYWdc in l(axo)do if not Yghyekk[Sv]then
Yghyekk[Sv]=aKiYWdc end end;return Yghyekk end
function S1wg_DG.isEqual(tSTVAx,E4dT34,L0)local wY=v(tSTVAx)local ilY2=v(E4dT34)
if wY~=ilY2 then return false end;if wY~='table'then return(tSTVAx==E4dT34)end
local oe1We=QFKEzBf(tSTVAx)local jQLYx1y=QFKEzBf(E4dT34)
if L0 then
if(oe1We or jQLYx1y)and
(oe1We.__eq or jQLYx1y.__eq)then return
oe1We.__eq(tSTVAx,E4dT34)or
jQLYx1y.__eq(E4dT34,tSTVAx)or(tSTVAx==E4dT34)end end
if S1wg_DG.size(tSTVAx)~=S1wg_DG.size(E4dT34)then return false end;local m_zjn;for TyjL,JVvqdW4 in l(tSTVAx)do m_zjn=E4dT34[TyjL]
if m_zjn==nil or not
S1wg_DG.isEqual(JVvqdW4,m_zjn,L0)then return false end end;for kDuC in l(E4dT34)do if
tSTVAx[kDuC]==nil then return false end end;return
true end
function S1wg_DG.result(AUw,vCkLg)
if AUw[vCkLg]then if S1wg_DG.isCallable(AUw[vCkLg])then
return AUw[vCkLg](AUw)else return AUw[vCkLg]end end;if S1wg_DG.isCallable(vCkLg)then return vCkLg(AUw)end end;function S1wg_DG.isTable(A3mjn)return v(A3mjn)=='table'end
function S1wg_DG.isCallable(Wt5k)return
((
v(Wt5k)=='function')or
(
(v(Wt5k)=='table')and QFKEzBf(Wt5k)and QFKEzBf(Wt5k).__call~=nil)or false)end
function S1wg_DG.isArray(fv5Y2j)
if not(v(fv5Y2j)=='table')then return false end;local bSgv=0;for Wa5 in l(fv5Y2j)do bSgv=bSgv+1
if fv5Y2j[bSgv]==nil then return false end end;return true end;function S1wg_DG.isIterable(JyrC7)
return S1wg_DG.toBoolean((l6Sm5(l,JyrC7)))end
function S1wg_DG.type(QP)local _N=v(QP)
if _N=='userdata'then
local U=QFKEzBf(QP)local e5qv6Q=io and io.stdout or nil;if e5qv6Q~=nil and
U==QFKEzBf(e5qv6Q)then return'file'end end;return _N end
function S1wg_DG.isEmpty(S6XO)if(S6XO==nil)then return true end;if v(S6XO)=='string'then return
#S6XO==0 end
if v(S6XO)=='table'then return e(S6XO)==nil end;return true end;function S1wg_DG.isString(p7ogY)return v(p7ogY)=='string'end;function S1wg_DG.isFunction(ZDP5SDwL)return
v(ZDP5SDwL)=='function'end;function S1wg_DG.isNil(T7H)return
T7H==nil end;function S1wg_DG.isNumber(cdPmXFla)
return v(cdPmXFla)=='number'end
function S1wg_DG.isNaN(gOp2cWZ)return v(gOp2cWZ)=='number'and
gOp2cWZ~=gOp2cWZ end;function S1wg_DG.isFinite(A1)if v(A1)~='number'then return false end;return
A1 >-S9TO and A1 <S9TO end;function S1wg_DG.isBoolean(t51v)return
v(t51v)=='boolean'end
function S1wg_DG.isInteger(Hp)return v(Hp)==
'number'and pS78Y(Hp)==Hp end
do S1wg_DG.forEach=S1wg_DG.each;S1wg_DG.forEachi=S1wg_DG.eachi
S1wg_DG.update=S1wg_DG.adjust;S1wg_DG.alleq=S1wg_DG.allEqual;S1wg_DG.loop=S1wg_DG.cycle
S1wg_DG.collect=S1wg_DG.map;S1wg_DG.inject=S1wg_DG.reduce;S1wg_DG.foldl=S1wg_DG.reduce
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
do local Tee9V={}local znHly={}znHly.__index=Tee9V;local function cD(I)
return oUA({_value=I,_wrapped=true},znHly)end
oUA(znHly,{__call=function(AN9,CCI)return cD(CCI)end,__index=function(Ax_b,Hgc1S,...)return
Tee9V[Hgc1S]end})function znHly.chain(gszf)return cD(gszf)end
function znHly:value()return self._value end;Tee9V.chain,Tee9V.value=znHly.chain,znHly.value
for GnYt,L7g in l(S1wg_DG)do
if
GnYt~='operator'then
Tee9V[GnYt]=function(_IO9,...)local zcnTZ6pI=v(_IO9)=='table'and PizLA9mj(_IO9,'_wrapped')or
false
if zcnTZ6pI then
local sIPPW=_IO9._value;local jrXq=L7g(sIPPW,...)return cD(jrXq)else return L7g(_IO9,...)end end end end;Tee9V.operator=S1wg_DG.operator;Tee9V.op=S1wg_DG.operator
Tee9V.import=function(T5V8Jm3h,yYkU)T5V8Jm3h=
T5V8Jm3h or _ENV or _G;local n0=S1wg_DG.functions()
for nOa2,r in
kyWtqIf0(n0)do
if PizLA9mj(T5V8Jm3h,r)~=nil then if not yYkU then
rawset(T5V8Jm3h,r,S1wg_DG[r])end else rawset(T5V8Jm3h,r,S1wg_DG[r])end end;return T5V8Jm3h end;znHly._VERSION='Moses v'..SWFtRywD
znHly._URL='http://github.com/Yonaba/Moses'
znHly._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'
znHly._DESCRIPTION='utility-belt library for functional programming in Lua'return znHly end
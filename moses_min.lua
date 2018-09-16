local SWFtRywD='2.1.0'local e,v,l6Sm5=next,type,pcall;local oUA,QFKEzBf=setmetatable,getmetatable
local odpE,p=table.insert,table.sort;local lIpFkbLI,JdUtcU=table.remove,table.concat
local GQLN,toXyq,S9TO=math.randomseed,math.random,math.huge;local pS78Y,BCf7,RlMSrmdD,VCD=math.floor,math.max,math.min,math.ceil
local OV7=coroutine.wrap;local X83a=coroutine.yield;local PizLA9mj=rawget
local hUL=table.unpack or unpack;local l,kyWtqIf0=pairs,ipairs;local zupvsz=error;local Mw=os.clock;local S1wg_DG={}local function sf0(cmWo_v,RoXZEsn)
return cmWo_v>RoXZEsn end
local function qxZa6ozV(BKLwtAVx,BMZNmf0)return BKLwtAVx<BMZNmf0 end
local function hgW2H5(qL9C)local Colg=0;for ex2xo17,I in l(qL9C)do Colg=Colg+1 end;return Colg end
local function z5i2i(K66,Tq,jmB,...)jmB=jmB or S1wg_DG.identity;local bjO;for QoYPziln,Hj in l(K66)do
if not bjO then bjO=jmB(Hj,...)else
local KBlIVi=jmB(Hj,...)bjO=Tq(bjO,KBlIVi)and bjO or KBlIVi end end;return bjO end
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
function S1wg_DG.chunk(BLEXN_,Ljc)local fpN7T,FNSk_,LmE,pZTFVP={},0
for XL,L5vC0Jx in kyWtqIf0(BLEXN_)do pZTFVP=Ljc(L5vC0Jx,XL)LmE=
(LmE==nil)and pZTFVP or LmE;FNSk_=(
(pZTFVP~=LmE)and(FNSk_+1)or FNSk_)if
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
function S1wg_DG.powerset(O9P0mj)local eFGwPxi=#O9P0mj;if eFGwPxi==0 then return{{}}end;local m4x8ZsD4={}for _witc0Pe=1,eFGwPxi do
for Y8E=1,
eFGwPxi-_witc0Pe+1 do m4x8ZsD4[#m4x8ZsD4+1]=S1wg_DG.slice(O9P0mj,Y8E,
Y8E+_witc0Pe-1)end end
return m4x8ZsD4 end;function S1wg_DG.partition(h,EnMMG,HzO7UpZ)if EnMMG<=0 then return end
return OV7(function()
MGSnnzOI(h,EnMMG or 1,X83a,HzO7UpZ)end)end
function S1wg_DG.overlapping(B,RNTu,Q_)if
RNTu<=1 then return end;return
OV7(function()B0o5xpg7(B,RNTu or 2,X83a,Q_)end)end
function S1wg_DG.aperture(S8GB,W7yjGm)if W7yjGm<=1 then return end;return OV7(function()
VQT(S8GB,W7yjGm or 2,X83a)end)end
function S1wg_DG.pairwise(X)return S1wg_DG.aperture(X,2)end;function S1wg_DG.permutation(Y)
return OV7(function()Id(Y,#Y,X83a)end)end
function S1wg_DG.concat(qqvEf3,Wriu,I0Pxr5F,ukGf_)return
JdUtcU(S1wg_DG.map(qqvEf3,tostring),Wriu,I0Pxr5F,ukGf_)end
function S1wg_DG.xprod(uZpt01P,hJk0n8bR)local o9DTTJig={}
for v4,Uaq2_Xzk in kyWtqIf0(uZpt01P)do for S0DM,GHasi5 in kyWtqIf0(hJk0n8bR)do
o9DTTJig[#o9DTTJig+1]={Uaq2_Xzk,GHasi5}end end;return o9DTTJig end;function S1wg_DG.xpairs(QeX_U9tm,Dp9m)local sJjNM={}
for GnSs,XP in kyWtqIf0(Dp9m)do sJjNM[GnSs]={QeX_U9tm,XP}end;return sJjNM end
function S1wg_DG.xpairsRight(Sj,yKj1)
local F9WZ={}for A5,nY_O in kyWtqIf0(yKj1)do F9WZ[A5]={nY_O,Sj}end;return F9WZ end
function S1wg_DG.sum(QAJAyj5)local EZ=0;for n,M in kyWtqIf0(QAJAyj5)do EZ=EZ+M end;return EZ end;function S1wg_DG.product(AADiL1)local Arw=1
for b,_ZM1Yj3 in kyWtqIf0(AADiL1)do Arw=Arw*_ZM1Yj3 end;return Arw end;function S1wg_DG.mean(rmSU)return
S1wg_DG.sum(rmSU)/ (#rmSU)end
function S1wg_DG.median(L2RHrI)
local XW7Y5Rz=S1wg_DG.sort(S1wg_DG.clone(L2RHrI))local C=#XW7Y5Rz;if C==0 then return elseif C==1 then return XW7Y5Rz[1]end
local NhwEkTd=VCD(C/2)return
C%2 ==0 and
(XW7Y5Rz[NhwEkTd]+XW7Y5Rz[NhwEkTd+1])/2 or XW7Y5Rz[NhwEkTd]end;function S1wg_DG.noop()return end;function S1wg_DG.identity(XGz)return XGz end;function S1wg_DG.call(Tf4P2eIf,...)return
Tf4P2eIf(...)end;function S1wg_DG.constant(TF3Htu)
return function()return TF3Htu end end
function S1wg_DG.applySpec(K5yUw1t)return
function(...)local Mi={}for WWyrqnSL,gVTyP in l(K5yUw1t)do
Mi[WWyrqnSL]=gVTyP(...)end;return Mi end end
function S1wg_DG.thread(Ck,...)local CRG=Ck;local dkz={...}
for zrCq,azXMvVdM in kyWtqIf0(dkz)do
if v(azXMvVdM)=='function'then
CRG=azXMvVdM(CRG)elseif v(azXMvVdM)=='table'then local CBgxHfbq=azXMvVdM[1]lIpFkbLI(azXMvVdM,1)
CRG=S1wg_DG.reduce(azXMvVdM,CBgxHfbq,CRG)end end;return CRG end
function S1wg_DG.threadRight(WO,...)local H=WO;local C28NuJ3={...}
for sz,qH in kyWtqIf0(C28NuJ3)do if v(qH)=='function'then H=qH(H)elseif
v(qH)=='table'then local u=qH[1]lIpFkbLI(qH,1)odpE(qH,H)
H=S1wg_DG.reduce(qH,u)end end;return H end
function S1wg_DG.dispatch(...)local u={...}return
function(...)for J1Vn4uYP,Z in kyWtqIf0(u)do local pJ={Z(...)}
if#pJ>0 then return hUL(pJ)end end end end;function S1wg_DG.memoize(NAjg)local con=oUA({},{__mode='kv'})
return function(I)if(con[I]==nil)then
con[I]=NAjg(I)end;return con[I]end end
function S1wg_DG.unfold(TxmZR6UE,I1b4o)
local nAt,pNJ={}while true do pNJ,I1b4o=TxmZR6UE(I1b4o)
if pNJ~=nil then nAt[#nAt+1]=pNJ else break end end;return nAt end
function S1wg_DG.once(RQ)local wnZcHKf=0;local Lv_8={}
return function(...)wnZcHKf=wnZcHKf+1
if wnZcHKf<=1 then Lv_8={...}end;return RQ(hUL(Lv_8))end end
function S1wg_DG.before(UQ,hgW2H5)local FG=0;local vLzqjJw={}
return function(...)FG=FG+1;if FG<=hgW2H5 then vLzqjJw={...}end;return
UQ(hUL(vLzqjJw))end end
function S1wg_DG.after(v2dsC21,hgW2H5)local O,wx=hgW2H5,0;return
function(...)wx=wx+1;if wx>=O then return v2dsC21(...)end end end
function S1wg_DG.compose(...)local u=S1wg_DG.reverse{...}
return
function(...)local V_84V,qF=true
for IZbOX7TW,Dd6ZLpU in kyWtqIf0(u)do if V_84V then
V_84V=false;qF=Dd6ZLpU(...)else qF=Dd6ZLpU(qF)end end;return qF end end
function S1wg_DG.pipe(MP,...)return S1wg_DG.compose(...)(MP)end
function S1wg_DG.complement(w4c)return function(...)return not w4c(...)end end
function S1wg_DG.juxtapose(C58,...)local Jk6Nh={}
for s1Ws,desLYv in kyWtqIf0({...})do Jk6Nh[s1Ws]=desLYv(C58)end;return hUL(Jk6Nh)end;function S1wg_DG.wrap(COq2NY9I,aoBEg65S)
return function(...)return aoBEg65S(COq2NY9I,...)end end
function S1wg_DG.times(x6,t3cNa2l)local Ik={}for SeHOs=1,(t3cNa2l or 1)
do Ik[SeHOs]=x6(SeHOs)end;return Ik end
function S1wg_DG.bind(P2rGsUx,c)return function(...)return P2rGsUx(c,...)end end;function S1wg_DG.bind2(v12AhMm,F2uxGC)
return function(Xs0,...)return v12AhMm(Xs0,F2uxGC,...)end end;function S1wg_DG.bindn(QK8ibF,...)local TEio7k0z={...}
return function(...)return
QK8ibF(hUL(S1wg_DG.append(TEio7k0z,{...})))end end
function S1wg_DG.bindall(u,...)
local N={...}for O2YgxDc,VLsC67 in kyWtqIf0(N)do local OHw4=u[VLsC67]
if OHw4 then u[VLsC67]=S1wg_DG.bind(OHw4,u)end end;return u end
function S1wg_DG.cond(FKZ)return
function(...)for Fl,QhS8FvKI in kyWtqIf0(FKZ)do
if QhS8FvKI[1](...)then return QhS8FvKI[2](...)end end end end
function S1wg_DG.both(...)local FaZIJL={...}
return function(...)
for sOT2O5,x in kyWtqIf0(FaZIJL)do if not x(...)then return false end end;return true end end
function S1wg_DG.either(...)local Wswd_OC={...}
return function(...)
for E,A0Un in kyWtqIf0(Wswd_OC)do if A0Un(...)then return true end end;return false end end
function S1wg_DG.neither(...)local nRHrI={...}
return function(...)
for kZp,A in kyWtqIf0(nRHrI)do if A(...)then return false end end;return true end end
function S1wg_DG.uniqueId(_L_)qJExeUn2=qJExeUn2+1;if _L_ then
if v(_L_)=='string'then
return _L_:format(qJExeUn2)elseif v(_L_)=='function'then return _L_(qJExeUn2)end end;return qJExeUn2 end
function S1wg_DG.iterator(WHpm,g,HiR3yiw)local KeKbiDqN=0;return
function()KeKbiDqN=KeKbiDqN+1;if
HiR3yiw and KeKbiDqN>HiR3yiw then return end;g=WHpm(g)return g end end;function S1wg_DG.skip(WfrZqHH8,YX9s9O)
for y64dF=1,(YX9s9O or 1)do if WfrZqHH8()==nil then return end end;return WfrZqHH8 end
function S1wg_DG.tabulate(...)
local sNSsH={}for K in...do sNSsH[#sNSsH+1]=K end;return sNSsH end
function S1wg_DG.iterlen(...)local o8T=0;for xeP in...do o8T=o8T+1 end;return o8T end
function S1wg_DG.castArray(Tv_3VlmX)return(v(Tv_3VlmX)~='table')and{Tv_3VlmX}or
Tv_3VlmX end
function S1wg_DG.flip(BT)return function(...)
return BT(hUL(S1wg_DG.reverse({...})))end end;function S1wg_DG.nthArg(_y3z)
return function(...)local rdl={...}return
rdl[(_y3z<0)and(#rdl+_y3z+1)or _y3z]end end;function S1wg_DG.unary(NAP_5jYs)
return function(...)
local BZnlpW={...}return NAP_5jYs(BZnlpW[1])end end
function S1wg_DG.ary(isN,yRADzw1v)
yRADzw1v=yRADzw1v or 1;return
function(...)local Jafp={...}local XWh8Ee={}
for kpezL1e=1,yRADzw1v do XWh8Ee[kpezL1e]=Jafp[kpezL1e]end;return isN(hUL(XWh8Ee))end end;function S1wg_DG.noarg(h)return function()return h()end end
function S1wg_DG.rearg(R7yfz_l9,D35PFLu)
return
function(...)
local wK={...}local qeEwE={}
for cbtvFnSa,fYKH_ in kyWtqIf0(D35PFLu)do qeEwE[cbtvFnSa]=wK[fYKH_]end;return R7yfz_l9(hUL(qeEwE))end end;function S1wg_DG.over(...)local W={...}
return function(...)local o={}
for Mm99M,l6YH in kyWtqIf0(W)do o[#o+1]=l6YH(...)end;return o end end
function S1wg_DG.overEvery(...)
local gf2=S1wg_DG.over(...)return
function(...)return
S1wg_DG.reduce(gf2(...),function(F744Ew,zgxKF4)return F744Ew and zgxKF4 end)end end
function S1wg_DG.overSome(...)local UlvVvSBR=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(UlvVvSBR(...),function(i2i,uRGAL)return
i2i or uRGAL end)end end
function S1wg_DG.overArgs(UUlqXyb6,...)local fOR92g8={...}
return
function(...)local jU26={...}for WIPTsAPz=1,#fOR92g8 do
local DgUx8=fOR92g8[WIPTsAPz]
if jU26[WIPTsAPz]then jU26[WIPTsAPz]=DgUx8(jU26[WIPTsAPz])end end;return
UUlqXyb6(hUL(jU26))end end
function S1wg_DG.converge(imac,xX,Mfb6Kb)return
function(...)return imac(xX(...),Mfb6Kb(...))end end
function S1wg_DG.partial(RRjV,...)local TDOaFo={...}
return
function(...)local tLo4={...}local m72l={}for npM3DSU,HGp4e1 in kyWtqIf0(TDOaFo)do
m72l[npM3DSU]=
(HGp4e1 =='_')and S1wg_DG.shift(tLo4)or HGp4e1 end;return
RRjV(hUL(S1wg_DG.append(m72l,tLo4)))end end
function S1wg_DG.partialRight(uzJt7E,...)local sRe5S32N={...}
return
function(...)local Bp={...}local rg={}for S=1,#sRe5S32N do
rg[S]=
(sRe5S32N[S]=='_')and S1wg_DG.shift(Bp)or sRe5S32N[S]end;return
uzJt7E(hUL(S1wg_DG.append(Bp,rg)))end end
function S1wg_DG.curry(Fem,cHmVGY)cHmVGY=cHmVGY or 2;local g29sXR={}
local function Vat(sfnkWAy8)
if cHmVGY==1 then return Fem(sfnkWAy8)end
if sfnkWAy8 ~=nil then g29sXR[#g29sXR+1]=sfnkWAy8 end;if#g29sXR<cHmVGY then return Vat else local hbJSGe9={Fem(hUL(g29sXR))}
g29sXR={}return hUL(hbJSGe9)end end;return Vat end
function S1wg_DG.time(pI,...)local B7jhm=Mw()local hj3={pI(...)}return Mw()-B7jhm,hUL(hj3)end
function S1wg_DG.keys(FKxU4)local UW={}for tReY in l(FKxU4)do UW[#UW+1]=tReY end;return UW end;function S1wg_DG.values(lex)local h79Pm={}
for vksQpy4,gPCIWPt in l(lex)do h79Pm[#h79Pm+1]=gPCIWPt end;return h79Pm end
function S1wg_DG.path(l4Byxa7,...)
local Fn8OR,X1Z0van=l4Byxa7,{...}for C_ACFsd,GC in kyWtqIf0(X1Z0van)do if(Fn8OR[GC]==nil)then return end
Fn8OR=Fn8OR[GC]end;return Fn8OR end
function S1wg_DG.spreadPath(SC7gSvMB,...)local Ei={...}
for GFuK1ut,SXmRY3i in kyWtqIf0(Ei)do if SC7gSvMB[SXmRY3i]then
for b,KApFr in
l(SC7gSvMB[SXmRY3i])do SC7gSvMB[b]=KApFr;SC7gSvMB[SXmRY3i][b]=nil end end end;return SC7gSvMB end
function S1wg_DG.flattenPath(jE,...)local yVVmXC={...}
for MkxwoCeK,AT in kyWtqIf0(yVVmXC)do if jE[AT]then
for _8KO,NI in l(jE[AT])do jE[_8KO]=NI end end end;return jE end;function S1wg_DG.kvpairs(PE)local a={}
for GhVWeuQs,kQlY in l(PE)do a[#a+1]={GhVWeuQs,kQlY}end;return a end
function S1wg_DG.toObj(xIl1shq)local qv={}for pbEt6T,MBdHQ in
kyWtqIf0(xIl1shq)do qv[MBdHQ[1]]=MBdHQ[2]end;return qv end;function S1wg_DG.invert(STXAhhM)local assFn={}for EXpWzv,kq in l(STXAhhM)do assFn[kq]=EXpWzv end
return assFn end
function S1wg_DG.property(up)return function(wlI_l)return
wlI_l[up]end end
function S1wg_DG.propertyOf(nK7J)return function(xv)return nK7J[xv]end end;function S1wg_DG.toBoolean(IWG)return not not IWG end
function S1wg_DG.extend(XVipkEh,...)
local Y_xg20={...}
for lOn,Mn29lGrm in kyWtqIf0(Y_xg20)do if v(Mn29lGrm)=='table'then
for y,ye3DyN in l(Mn29lGrm)do XVipkEh[y]=ye3DyN end end end;return XVipkEh end
function S1wg_DG.functions(XoIfNq,zCZ)XoIfNq=XoIfNq or S1wg_DG;local KOblE1BH={}
for YPFM2F,iA in l(XoIfNq)do if
v(iA)=='function'then KOblE1BH[#KOblE1BH+1]=YPFM2F end end
if zCZ then local f=QFKEzBf(XoIfNq)if f and f.__index then
local W=S1wg_DG.functions(f.__index,zCZ)
for _,_TPK9KUS in kyWtqIf0(W)do KOblE1BH[#KOblE1BH+1]=_TPK9KUS end end end;return KOblE1BH end
function S1wg_DG.clone(CcTDi,HNz)if v(CcTDi)~='table'then return CcTDi end;local _T9Gn3b2={}for mx,X in l(CcTDi)do
if
v(X)=='table'then if not HNz then _T9Gn3b2[mx]=S1wg_DG.clone(X,HNz)else
_T9Gn3b2[mx]=X end else _T9Gn3b2[mx]=X end end;return
_T9Gn3b2 end;function S1wg_DG.tap(j,hwLm)hwLm(j)return j end;function S1wg_DG.has(Jf1lygU,uCC)return
Jf1lygU[uCC]~=nil end
function S1wg_DG.pick(VoL,...)
local J1Qkmucu=S1wg_DG.flatten{...}local uy8VNDqE={}
for LCuIIfa,SUcXQMl in l(J1Qkmucu)do if(VoL[SUcXQMl])~=nil then
uy8VNDqE[SUcXQMl]=VoL[SUcXQMl]end end;return uy8VNDqE end
function S1wg_DG.omit(lyRouGA3,...)local Q3y7y2=S1wg_DG.flatten{...}local xPOK4sH={}
for Px1,SUg in l(lyRouGA3)do if not
S1wg_DG.include(Q3y7y2,Px1)then xPOK4sH[Px1]=SUg end end;return xPOK4sH end
function S1wg_DG.template(Wf0F6,G3)if not G3 then return Wf0F6 end;for D,Yghyekk in l(G3)do
if not Wf0F6[D]then Wf0F6[D]=Yghyekk end end;return Wf0F6 end
function S1wg_DG.isEqual(axo,Sv,aKiYWdc)local tSTVAx=v(axo)local E4dT34=v(Sv)
if tSTVAx~=E4dT34 then return false end;if tSTVAx~='table'then return(axo==Sv)end;local L0=QFKEzBf(axo)
local wY=QFKEzBf(Sv)if aKiYWdc then
if(L0 or wY)and(L0.__eq or wY.__eq)then return L0.__eq(axo,Sv)or
wY.__eq(Sv,axo)or(axo==Sv)end end;if
S1wg_DG.size(axo)~=S1wg_DG.size(Sv)then return false end
local ilY2;for oe1We,jQLYx1y in l(axo)do ilY2=Sv[oe1We]
if ilY2 ==nil or
not S1wg_DG.isEqual(jQLYx1y,ilY2,aKiYWdc)then return false end end;for m_zjn in l(Sv)do if
axo[m_zjn]==nil then return false end end
return true end
function S1wg_DG.result(TyjL,JVvqdW4)if TyjL[JVvqdW4]then
if S1wg_DG.isCallable(TyjL[JVvqdW4])then return
TyjL[JVvqdW4](TyjL)else return TyjL[JVvqdW4]end end;if
S1wg_DG.isCallable(JVvqdW4)then return JVvqdW4(TyjL)end end;function S1wg_DG.isTable(kDuC)return v(kDuC)=='table'end
function S1wg_DG.isCallable(AUw)return
((
v(AUw)=='function')or
(
(v(AUw)=='table')and QFKEzBf(AUw)and QFKEzBf(AUw).__call~=nil)or false)end
function S1wg_DG.isArray(vCkLg)
if not(v(vCkLg)=='table')then return false end;local A3mjn=0;for Wt5k in l(vCkLg)do A3mjn=A3mjn+1
if vCkLg[A3mjn]==nil then return false end end;return true end;function S1wg_DG.isIterable(fv5Y2j)
return S1wg_DG.toBoolean((l6Sm5(l,fv5Y2j)))end
function S1wg_DG.type(bSgv)local Wa5=v(bSgv)if
Wa5 =='userdata'then local JyrC7=QFKEzBf(bSgv)
if JyrC7 ==QFKEzBf(io.stdout)then return'file'end end;return Wa5 end
function S1wg_DG.isEmpty(QP)if(QP==nil)then return true end
if v(QP)=='string'then return#QP==0 end;if v(QP)=='table'then return e(QP)==nil end;return true end;function S1wg_DG.isString(_N)return v(_N)=='string'end;function S1wg_DG.isFunction(U)return
v(U)=='function'end;function S1wg_DG.isNil(e5qv6Q)
return e5qv6Q==nil end
function S1wg_DG.isNumber(S6XO)return v(S6XO)=='number'end;function S1wg_DG.isNaN(p7ogY)
return v(p7ogY)=='number'and p7ogY~=p7ogY end;function S1wg_DG.isFinite(ZDP5SDwL)if v(ZDP5SDwL)~='number'then return
false end
return ZDP5SDwL>-S9TO and ZDP5SDwL<S9TO end;function S1wg_DG.isBoolean(T7H)return
v(T7H)=='boolean'end;function S1wg_DG.isInteger(cdPmXFla)
return
v(cdPmXFla)=='number'and pS78Y(cdPmXFla)==cdPmXFla end
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
S1wg_DG.juxt=S1wg_DG.juxtapose;S1wg_DG.uid=S1wg_DG.uniqueid;S1wg_DG.iter=S1wg_DG.iterator
S1wg_DG.nAry=S1wg_DG.ary;S1wg_DG.methods=S1wg_DG.functions;S1wg_DG.choose=S1wg_DG.pick
S1wg_DG.drop=S1wg_DG.omit;S1wg_DG.defaults=S1wg_DG.template
S1wg_DG.compare=S1wg_DG.isEqual;S1wg_DG.matches=S1wg_DG.isEqual end
do local gOp2cWZ={}local A1={}A1.__index=gOp2cWZ;local function t51v(Hp)
return oUA({_value=Hp,_wrapped=true},A1)end
oUA(A1,{__call=function(Tee9V,znHly)return t51v(znHly)end,__index=function(cD,I,...)return
gOp2cWZ[I]end})function A1.chain(AN9)return t51v(AN9)end
function A1:value()return self._value end;gOp2cWZ.chain,gOp2cWZ.value=A1.chain,A1.value
for CCI,Ax_b in l(S1wg_DG)do
if
CCI~='operator'then
gOp2cWZ[CCI]=function(Hgc1S,...)local gszf=
v(Hgc1S)=='table'and PizLA9mj(Hgc1S,'_wrapped')or false
if gszf then
local GnYt=Hgc1S._value;local L7g=Ax_b(GnYt,...)return t51v(L7g)else return Ax_b(Hgc1S,...)end end end end;gOp2cWZ.operator=S1wg_DG.operator;gOp2cWZ.op=S1wg_DG.operator
gOp2cWZ.import=function(_IO9,zcnTZ6pI)_IO9=
_IO9 or _ENV or _G;local sIPPW=S1wg_DG.functions()
for jrXq,T5V8Jm3h in
kyWtqIf0(sIPPW)do if PizLA9mj(_IO9,T5V8Jm3h)~=nil then if not zcnTZ6pI then
rawset(_IO9,T5V8Jm3h,S1wg_DG[T5V8Jm3h])end else
rawset(_IO9,T5V8Jm3h,S1wg_DG[T5V8Jm3h])end end;return _IO9 end;A1._VERSION='Moses v'..SWFtRywD
A1._URL='http://github.com/Yonaba/Moses'
A1._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'A1._DESCRIPTION='utility-belt library for functional programming in Lua'
return A1 end
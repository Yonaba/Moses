local e='2.0.0'local v,l6Sm5,oUA,QFKEzBf=next,type,select,pcall
local odpE,p=setmetatable,getmetatable;local lIpFkbLI,JdUtcU=table.insert,table.sort
local GQLN,toXyq=table.remove,table.concat;local S9TO,pS78Y,BCf7=math.randomseed,math.random,math.huge
local RlMSrmdD,VCD,OV7,X83a=math.floor,math.max,math.min,math.ceil;local PizLA9mj=coroutine.wrap;local hUL=coroutine.yield;local l=rawget
local kyWtqIf0=table.unpack or unpack;local zupvsz,Mw=pairs,ipairs;local S1wg_DG=error;local sf0=os.clock;local qxZa6ozV={}local function hgW2H5(BKLwtAVx,BMZNmf0)
return BKLwtAVx>BMZNmf0 end
local function z5i2i(qL9C,Colg)return qL9C<Colg end
local function MGSnnzOI(ex2xo17)local I=0;for K66,Tq in zupvsz(ex2xo17)do I=I+1 end;return I end
local function B0o5xpg7(jmB,bjO,QoYPziln,...)QoYPziln=QoYPziln or qxZa6ozV.identity;local Hj
for KBlIVi,OR8it1 in zupvsz(jmB)do if not Hj then
Hj=QoYPziln(OR8it1,...)else local GAqAsa=QoYPziln(OR8it1,...)
Hj=bjO(Hj,GAqAsa)and Hj or GAqAsa end end;return Hj end
local function VQT(Oc_,Qj,Ybp8,ZmzyNm)
for akG0mUnS=0,#Oc_,Qj do
local iy=qxZa6ozV.slice(Oc_,akG0mUnS+1,akG0mUnS+Qj)if#iy>0 then
while(#iy<Qj and ZmzyNm)do iy[#iy+1]=ZmzyNm end;Ybp8(iy)end end end
local function Id(gc7SaW,FnbJWd2,cpdLk,FbQX)
for ejMVLYZd=0,#gc7SaW,FnbJWd2-1 do
local eS0X=qxZa6ozV.slice(gc7SaW,ejMVLYZd+1,ejMVLYZd+FnbJWd2)
if#eS0X>0 and ejMVLYZd+1 <#gc7SaW then while
(#eS0X<FnbJWd2 and FbQX)do eS0X[#eS0X+1]=FbQX end;cpdLk(eS0X)end end end
local function Ub(XDQS4ASf,IiNU,gUfudNUg,d3)
for gTOcAHv=0,#XDQS4ASf,1 do
local vY_4HT1n=qxZa6ozV.slice(XDQS4ASf,gTOcAHv+1,gTOcAHv+IiNU)
if#vY_4HT1n>0 and gTOcAHv+IiNU<=#XDQS4ASf then
while(#vY_4HT1n<
IiNU and d3)do vY_4HT1n[#vY_4HT1n+1]=d3 end;gUfudNUg(vY_4HT1n)end end end
local function qJExeUn2(DzPbzg,UMD,K3ZE7Ou)if UMD==0 then K3ZE7Ou(DzPbzg)end;for fBI=1,UMD do
DzPbzg[UMD],DzPbzg[fBI]=DzPbzg[fBI],DzPbzg[UMD]qJExeUn2(DzPbzg,UMD-1,K3ZE7Ou)
DzPbzg[UMD],DzPbzg[fBI]=DzPbzg[fBI],DzPbzg[UMD]end end;local function cmWo_v(wMSY)return wMSY>=0 and 1 or-1 end;local RoXZEsn=-1
qxZa6ozV.operator={}
qxZa6ozV.operator.add=function(_nD2rl,aVh8xSly)return _nD2rl+aVh8xSly end
qxZa6ozV.operator.sub=function(i,P_NNVDyt)return i-P_NNVDyt end
qxZa6ozV.operator.mul=function(cVEyN,uj2AiF)return cVEyN*uj2AiF end
qxZa6ozV.operator.div=function(W,lbHN2)return W/lbHN2 end
qxZa6ozV.operator.mod=function(PwgW3lfq,z)return PwgW3lfq%z end;qxZa6ozV.operator.exp=function(K,xx)return K^xx end
qxZa6ozV.operator.pow=qxZa6ozV.operator.exp;qxZa6ozV.operator.unm=function(aYb)return-aYb end
qxZa6ozV.operator.neg=qxZa6ozV.operator.unm
qxZa6ozV.operator.floordiv=function(JM2,bmAjLT)return RlMSrmdD(JM2/bmAjLT)end
qxZa6ozV.operator.intdiv=function(eExYnwnh,XMBmJyiP)
return
eExYnwnh>=0 and RlMSrmdD(eExYnwnh/XMBmJyiP)or X83a(eExYnwnh/XMBmJyiP)end
qxZa6ozV.operator.eq=function(nowqEU6m,iKD8V)return nowqEU6m==iKD8V end
qxZa6ozV.operator.neq=function(YtRS,A)return YtRS~=A end
qxZa6ozV.operator.lt=function(mHJ,Q57BJ)return mHJ<Q57BJ end
qxZa6ozV.operator.gt=function(vM,JeGCDX)return vM>JeGCDX end
qxZa6ozV.operator.le=function(A,UFZlp)return A<=UFZlp end
qxZa6ozV.operator.ge=function(VsrKM,uhIq)return VsrKM>=uhIq end
qxZa6ozV.operator.land=function(EEOUzhy,hbrt)return EEOUzhy and hbrt end;qxZa6ozV.operator.lor=function(D,Q)return D or Q end;qxZa6ozV.operator.lnot=function(mRqle)return
not mRqle end
qxZa6ozV.operator.concat=function(sBEZ8,WhHB0ygh)return
sBEZ8 ..WhHB0ygh end
qxZa6ozV.operator.length=function(rYSD0)return#rYSD0 end;qxZa6ozV.operator.len=qxZa6ozV.operator.length
function qxZa6ozV.clear(BIL5)for GQLlkH in
zupvsz(BIL5)do BIL5[GQLlkH]=nil end;return BIL5 end;function qxZa6ozV.each(aN4J2zRQ,eWca,...)
for AGUR2QK,FK in zupvsz(aN4J2zRQ)do eWca(FK,AGUR2QK,...)end end
function qxZa6ozV.eachi(_,YQZ729qQ,...)
local rZh2wG=qxZa6ozV.sort(qxZa6ozV.select(qxZa6ozV.keys(_),qxZa6ozV.isInteger))for sef4eW6Q,Z in Mw(rZh2wG)do YQZ729qQ(_[Z],Z,...)end end
function qxZa6ozV.at(UacO6D,...)local FdnzjW={}for o,lMAL in Mw({...})do
FdnzjW[#FdnzjW+1]=UacO6D[lMAL]end;return FdnzjW end
function qxZa6ozV.adjust(CpQ,L,HnQS_Z,...)if(CpQ[L]==nil)then
S1wg_DG("key not existing in table")end;local rib=qxZa6ozV.clone(CpQ)
rib[L]=
l6Sm5(HnQS_Z)=='function'and HnQS_Z(rib[L],...)or HnQS_Z;return rib end
function qxZa6ozV.count(w,YT6wZ)if YT6wZ==nil then return qxZa6ozV.size(w)end
local MGSnnzOI=0;for VYv,gU in zupvsz(w)do
if qxZa6ozV.isEqual(gU,YT6wZ)then MGSnnzOI=MGSnnzOI+1 end end;return MGSnnzOI end
function qxZa6ozV.countf(JzG8W4Ya,dZ54oc,...)local MGSnnzOI=0;for v_LoR,gRY in zupvsz(JzG8W4Ya)do if dZ54oc(gRY,v_LoR,...)then
MGSnnzOI=MGSnnzOI+1 end end;return
MGSnnzOI end
function qxZa6ozV.cycle(z,ad)ad=ad or 1;if ad<=0 then return qxZa6ozV.noop end;local Ui0Qa,g
local Itx=0
while true do
return
function()Ui0Qa=Ui0Qa and v(z,Ui0Qa)or v(z)
g=not g and Ui0Qa or g;if ad then Itx=(Ui0Qa==g)and Itx+1 or Itx
if Itx>ad then return end end;return z[Ui0Qa],Ui0Qa end end end
function qxZa6ozV.map(JpoaGH,cyAcCT,...)local RCA={}
for L46S,GKTYT in zupvsz(JpoaGH)do
local hXSTz8FJ,C24r7o4G,b_4Q38cU=L46S,cyAcCT(GKTYT,L46S,...)
RCA[b_4Q38cU and C24r7o4G or hXSTz8FJ]=b_4Q38cU or C24r7o4G end;return RCA end
function qxZa6ozV.reduce(N,JbPw,j)for S,cg4FV7bl in zupvsz(N)do
if j==nil then j=cg4FV7bl else j=JbPw(j,cg4FV7bl)end end;return j end
function qxZa6ozV.reduceby(flf9sWX,uNoS,ZWoH9V08,RWo,...)return
qxZa6ozV.reduce(qxZa6ozV.select(flf9sWX,ZWoH9V08,...),uNoS,RWo)end
function qxZa6ozV.reduceRight(GWBQL,PCldTUn9,sO_)return
qxZa6ozV.reduce(qxZa6ozV.reverse(GWBQL),PCldTUn9,sO_)end
function qxZa6ozV.mapReduce(ALbdmINL,b,DUgF0E)local vGxJ6f={}
for a4ga2I,syGyB_ in zupvsz(ALbdmINL)do vGxJ6f[a4ga2I]=not DUgF0E and syGyB_ or
b(DUgF0E,syGyB_)DUgF0E=vGxJ6f[a4ga2I]end;return vGxJ6f end
function qxZa6ozV.mapReduceRight(VO,J1r,iBcU3_7D)return
qxZa6ozV.mapReduce(qxZa6ozV.reverse(VO),J1r,iBcU3_7D)end
function qxZa6ozV.include(N,M4V)local _feve=(l6Sm5(M4V)=='function')and M4V or
qxZa6ozV.isEqual;for OPz_7bk,H64aD in zupvsz(N)do if
_feve(H64aD,M4V)then return true end end;return false end
function qxZa6ozV.detect(ny7,QDj6GAX)
local k6pXzd=
(l6Sm5(QDj6GAX)=='function')and QDj6GAX or qxZa6ozV.isEqual
for hsLwu,R in zupvsz(ny7)do if k6pXzd(R,QDj6GAX)then return hsLwu end end end
function qxZa6ozV.where(JKZ,yHbsh)
local d4z=qxZa6ozV.select(JKZ,function(i)
for HyEk4lbh in zupvsz(yHbsh)do if i[HyEk4lbh]~=yHbsh[HyEk4lbh]then return
false end end;return true end)return#d4z>0 and d4z or nil end
function qxZa6ozV.findWhere(PhU,rWwbNge)
local SKxD=qxZa6ozV.detect(PhU,function(o3uQKvJ)
for vAZm in zupvsz(rWwbNge)do if
rWwbNge[vAZm]~=o3uQKvJ[vAZm]then return false end end;return true end)return SKxD and PhU[SKxD]end
function qxZa6ozV.select(q,fFuE,...)local KypMW={}for JJT4nKO,TFLF in zupvsz(q)do if fFuE(TFLF,JJT4nKO,...)then
KypMW[#KypMW+1]=TFLF end end
return KypMW end
function qxZa6ozV.reject(hEoAa,PGN,...)local K2_kF5={}
for YpimJ,Gg7Ttui in zupvsz(hEoAa)do if not PGN(Gg7Ttui,YpimJ,...)then
K2_kF5[#K2_kF5+1]=Gg7Ttui end end;return K2_kF5 end
function qxZa6ozV.all(_,EGeAf,...)for ymP,z5pHKyoa in zupvsz(_)do
if not EGeAf(z5pHKyoa,ymP,...)then return false end end;return true end
function qxZa6ozV.invoke(h,xwT,...)local y33ux={...}
return
qxZa6ozV.map(h,function(Ut)
if(l6Sm5(Ut)=='table')then
if Ut[xwT]then
if
qxZa6ozV.isCallable(Ut[xwT])then return Ut[xwT](Ut,kyWtqIf0(y33ux))else return Ut[xwT]end else
if qxZa6ozV.isCallable(xwT)then return xwT(Ut,kyWtqIf0(y33ux))end end elseif qxZa6ozV.isCallable(xwT)then return xwT(Ut,kyWtqIf0(y33ux))end end)end
function qxZa6ozV.pluck(GOijBp,oUi)local b2a3={}for xer,SQHAAR in zupvsz(GOijBp)do if SQHAAR[oUi]then
b2a3[#b2a3+1]=SQHAAR[oUi]end end;return b2a3 end
function qxZa6ozV.max(qybRcP1,z,...)return B0o5xpg7(qybRcP1,hgW2H5,z,...)end
function qxZa6ozV.min(N0NaR,FBfW,...)return B0o5xpg7(N0NaR,z5i2i,FBfW,...)end
function qxZa6ozV.same(lnM4,_oDmX_)
return
qxZa6ozV.all(lnM4,function(t)return qxZa6ozV.include(_oDmX_,t)end)and
qxZa6ozV.all(_oDmX_,function(K)return qxZa6ozV.include(lnM4,K)end)end
function qxZa6ozV.sort(ppm021I,ASUXhD)JdUtcU(ppm021I,ASUXhD)return ppm021I end
function qxZa6ozV.sortBy(KCm,u,fDk)local gxYY=u or qxZa6ozV.identity
if
(l6Sm5(u)=='string')then gxYY=function(KCm)return KCm[u]end end;fDk=fDk or z5i2i
JdUtcU(KCm,function(sVMxk,SyD)return fDk(gxYY(sVMxk),gxYY(SyD))end)return KCm end
function qxZa6ozV.groupBy(v4,j7siW,...)local Hl={...}local AP060rq={}
for DIEKD10,lLJ in zupvsz(v4)do
local EicsS=j7siW(lLJ,DIEKD10,kyWtqIf0(Hl))if AP060rq[EicsS]then
AP060rq[EicsS][#AP060rq[EicsS]+1]=lLJ else AP060rq[EicsS]={lLJ}end end;return AP060rq end
function qxZa6ozV.countBy(JubU,L,...)local JKci={}
for SsBe,o in zupvsz(JubU)do local ZOmcmO=L(o,SsBe,...)JKci[ZOmcmO]=(
JKci[ZOmcmO]or 0)+1 end;return JKci end
function qxZa6ozV.size(...)local _G19JrRB={...}local m0r3_J=_G19JrRB[1]return

(l6Sm5(m0r3_J)=='table')and MGSnnzOI(_G19JrRB[1])or MGSnnzOI(_G19JrRB)end
function qxZa6ozV.containsKeys(MLrs,hP5)for oqjhEZb0 in zupvsz(hP5)do
if not MLrs[oqjhEZb0]then return false end end;return true end
function qxZa6ozV.sameKeys(Pha,G)
for MOrzq4 in zupvsz(Pha)do if not G[MOrzq4]then return false end end
for bEMp in zupvsz(G)do if not Pha[bEMp]then return false end end;return true end
function qxZa6ozV.sample(dd,MOQN,O)MOQN=MOQN or 1;if MOQN==0 then return{}end;if MOQN==1 then
if O then S9TO(O)end;return{dd[pS78Y(1,#dd)]}end;return
qxZa6ozV.slice(qxZa6ozV.shuffle(dd,O),1,MOQN)end
function qxZa6ozV.sampleProb(FEpet,P,G)if G then S9TO(G)end;local EcLLM={}for wo,ur in Mw(FEpet)do if pS78Y()<P then
EcLLM[#EcLLM+1]=ur end end;return EcLLM end
function qxZa6ozV.shuffle(XTX,wc8hjKp1)if wc8hjKp1 then S9TO(wc8hjKp1)end;local f={}
for Hjag,Yg in Mw(XTX)do local uc=RlMSrmdD(pS78Y()*
Hjag)+1;f[Hjag]=f[uc]f[uc]=Yg end;return f end;function qxZa6ozV.toArray(...)return{...}end;function qxZa6ozV.find(bw,ad,EG344W)
for MVlUhPEM=EG344W or 1,#bw do if
qxZa6ozV.isEqual(bw[MVlUhPEM],ad)then return MVlUhPEM end end end;function qxZa6ozV.reverse(LT)
local pfiWYrg={}
for smnX9H6=#LT,1,-1 do pfiWYrg[#pfiWYrg+1]=LT[smnX9H6]end;return pfiWYrg end
function qxZa6ozV.fill(FzRhHR,mMBxOoQa,xYSLIT,Eae7ILmk)Eae7ILmk=
Eae7ILmk or qxZa6ozV.size(FzRhHR)for xYSLIT=xYSLIT or 1,Eae7ILmk
do FzRhHR[xYSLIT]=mMBxOoQa end;return FzRhHR end
function qxZa6ozV.zeros(Jy23ZRAA)return qxZa6ozV.fill({},0,1,Jy23ZRAA)end
function qxZa6ozV.ones(V8IWw)return qxZa6ozV.fill({},1,1,V8IWw)end
function qxZa6ozV.vector(uyYdf,K)return qxZa6ozV.fill({},uyYdf,1,K)end
function qxZa6ozV.selectWhile(ZX,tbdC,...)local VaY3={}
for HK7Mbgze,VXPfx in Mw(ZX)do if tbdC(VXPfx,HK7Mbgze,...)then VaY3[HK7Mbgze]=VXPfx else
break end end;return VaY3 end
function qxZa6ozV.dropWhile(j3Qk,X1,...)local GpruB;for r,V7YqV in Mw(j3Qk)do
if not X1(V7YqV,r,...)then GpruB=r;break end end;if(GpruB==nil)then return{}end;return
qxZa6ozV.rest(j3Qk,GpruB)end
function qxZa6ozV.sortedIndex(JbvH7,Cqk9Luq,PeAP9X,vN5AF9)local j=PeAP9X or z5i2i;if(vN5AF9 ==true)then
JdUtcU(JbvH7,j)end;for EOgmP=1,#JbvH7 do
if not j(JbvH7[EOgmP],Cqk9Luq)then return EOgmP end end;return#JbvH7+1 end;function qxZa6ozV.indexOf(j,mJof)
for yz1Kuwby=1,#j do if j[yz1Kuwby]==mJof then return yz1Kuwby end end end
function qxZa6ozV.lastIndexOf(KVE6TG,YY)
local r9=qxZa6ozV.indexOf(qxZa6ozV.reverse(KVE6TG),YY)if r9 then return#KVE6TG-r9+1 end end
function qxZa6ozV.findIndex(mtUG,PFRuf,...)for KhK1gRj9=1,#mtUG do
if PFRuf(mtUG[KhK1gRj9],KhK1gRj9,...)then return KhK1gRj9 end end end
function qxZa6ozV.findLastIndex(Xgj,Ko,...)
local A=qxZa6ozV.findIndex(qxZa6ozV.reverse(Xgj),Ko,...)if A then return#Xgj-A+1 end end;function qxZa6ozV.addTop(IU6Om,...)
for sKIIqz,wmhARqEa in Mw({...})do lIpFkbLI(IU6Om,1,wmhARqEa)end;return IU6Om end;function qxZa6ozV.prepend(_RT3,...)return
qxZa6ozV.append({...},_RT3)end
function qxZa6ozV.push(V,...)local BTA={...}for QVEYENaX,gxqa in
Mw({...})do V[#V+1]=gxqa end;return V end
function qxZa6ozV.shift(q4,QyKi)QyKi=OV7(QyKi or 1,#q4)local _o3FE={}for n=1,QyKi do local WM=q4[1]
_o3FE[#_o3FE+1]=WM;GQLN(q4,1)end;return kyWtqIf0(_o3FE)end
function qxZa6ozV.unshift(zb8b,YBqeh)YBqeh=OV7(YBqeh or 1,#zb8b)local WRkIg={}
for RH_vLUg=1,YBqeh do
local aEH=zb8b[#zb8b]WRkIg[#WRkIg+1]=aEH;GQLN(zb8b)end;return kyWtqIf0(WRkIg)end
function qxZa6ozV.pull(g20N7,...)
for puZN,_Dy in Mw({...})do for MC=#g20N7,1,-1 do if qxZa6ozV.isEqual(g20N7[MC],_Dy)then
GQLN(g20N7,MC)end end end;return g20N7 end
function qxZa6ozV.removeRange(WOBSVeqF,A,vqW6)A=A or 1;vqW6=vqW6 or#WOBSVeqF;if A>vqW6 then
S1wg_DG("start cannot be greater than finish.")end
for R4oRlgh=vqW6,A,-1 do GQLN(WOBSVeqF,R4oRlgh)end;return WOBSVeqF end
function qxZa6ozV.chunk(rBRXA,qfFSJN,...)local Va8fT08T,d778,aZT,ni9je9bJ={},0
for uwwNE,X40cF in Mw(rBRXA)do
ni9je9bJ=qfFSJN(X40cF,uwwNE,...)aZT=(aZT==nil)and ni9je9bJ or aZT
d778=(
(ni9je9bJ~=aZT)and(d778+1)or d778)if not Va8fT08T[d778]then Va8fT08T[d778]={rBRXA[uwwNE]}else
Va8fT08T[d778][
#Va8fT08T[d778]+1]=rBRXA[uwwNE]end;aZT=ni9je9bJ end;return Va8fT08T end
function qxZa6ozV.slice(EW,asgq,IQybL1)local hYKT45={}for Rq7=asgq or 1,IQybL1 or#EW do
hYKT45[#hYKT45+1]=EW[Rq7]end;return hYKT45 end
function qxZa6ozV.first(LQ_EIcl,uaL)uaL=uaL or 1;local gujcrFp={}for ph06vXj=1,uaL do
gujcrFp[ph06vXj]=LQ_EIcl[ph06vXj]end;return gujcrFp end
function qxZa6ozV.initial(nH0LB4c,ALwJ9)local _X=#nH0LB4c;ALwJ9=
ALwJ9 and _X- (OV7(ALwJ9,_X))or _X-1;local ruXMob={}for E=1,ALwJ9 do
ruXMob[E]=nH0LB4c[E]end;return ruXMob end
function qxZa6ozV.last(jcgjAE,BZmaGN)local HSav=#jcgjAE;BZmaGN=
BZmaGN and HSav-OV7(BZmaGN-1,HSav-1)or 2;local sDjMr={}for biQX3Ut=BZmaGN,HSav do
sDjMr[#sDjMr+1]=jcgjAE[biQX3Ut]end;return sDjMr end
function qxZa6ozV.rest(BLEXN_,Ljc)local fpN7T={}for FNSk_=Ljc or 1,#BLEXN_ do
fpN7T[#fpN7T+1]=BLEXN_[FNSk_]end;return fpN7T end;function qxZa6ozV.nth(LmE,pZTFVP)return LmE[pZTFVP]end
function qxZa6ozV.compact(XL)
local L5vC0Jx={}
for vpONJ,A in zupvsz(XL)do if A then L5vC0Jx[#L5vC0Jx+1]=A end end;return L5vC0Jx end
function qxZa6ozV.flatten(LN,dA14qP)dA14qP=dA14qP or false;local JcQc;local hDih6_D={}
for QKbZ464i,F1TsZ in Mw(LN)do
if
l6Sm5(F1TsZ)=='table'then
JcQc=dA14qP and F1TsZ or qxZa6ozV.flatten(F1TsZ)for uF2,T in Mw(JcQc)do hDih6_D[#hDih6_D+1]=T end else hDih6_D[#
hDih6_D+1]=F1TsZ end end;return hDih6_D end
function qxZa6ozV.difference(pC_,ju)if not ju then return qxZa6ozV.clone(pC_)end;return
qxZa6ozV.select(pC_,function(deu1)return
not qxZa6ozV.include(ju,deu1)end)end;function qxZa6ozV.union(...)
return qxZa6ozV.unique(qxZa6ozV.flatten({...}))end
function qxZa6ozV.intersection(IgZ6,...)local kVRiv3F={...}local kWMf={}
for DawC,cP in
Mw(IgZ6)do if
qxZa6ozV.all(kVRiv3F,function(w)return qxZa6ozV.include(w,cP)end)then kWMf[#kWMf+1]=cP end end;return kWMf end
function qxZa6ozV.symmetricDifference(UZ,tdH)return
qxZa6ozV.difference(qxZa6ozV.union(UZ,tdH),qxZa6ozV.intersection(UZ,tdH))end
function qxZa6ozV.unique(ymt)local WxGA={}
for jBuHkH=1,#ymt do if
not qxZa6ozV.find(WxGA,ymt[jBuHkH])then WxGA[#WxGA+1]=ymt[jBuHkH]end end;return WxGA end;function qxZa6ozV.isunique(E3)
return#E3 ==# (qxZa6ozV.unique(E3))end
function qxZa6ozV.zip(...)local CZi_zK={...}local _6KCMph=qxZa6ozV.max(CZi_zK,function(V)
return#V end)local PY3VqYZ8={}
for y=1,_6KCMph
do if not PY3VqYZ8[y]then PY3VqYZ8[y]={}end;for QF,hN in Mw(CZi_zK)do
if hN[y]then PY3VqYZ8[y][
#PY3VqYZ8[y]+1]=hN[y]end end end;return PY3VqYZ8 end
function qxZa6ozV.zipWith(hVflx4kh,...)local GP={...}
local oCZYv2dT=qxZa6ozV.max(GP,function(PoH)return#PoH end)local RLaqM3={}for xM709D=1,oCZYv2dT do
RLaqM3[xM709D]=hVflx4kh(kyWtqIf0(qxZa6ozV.pluck(GP,xM709D)))end;return RLaqM3 end
function qxZa6ozV.append(z50,sAPD)local AVFi={}for GGKI,gWaGu in Mw(z50)do AVFi[GGKI]=gWaGu end;for SFKM,j6jQmlbr in
Mw(sAPD)do AVFi[#AVFi+1]=j6jQmlbr end;return AVFi end
function qxZa6ozV.interleave(...)local m403CY={...}
local dL=qxZa6ozV.max(m403CY,qxZa6ozV.size)local PrTsHeT={}for eNI3MT7=1,dL do
for Rfoo,eUJhGD in Mw(m403CY)do if eUJhGD[eNI3MT7]then
PrTsHeT[#PrTsHeT+1]=eUJhGD[eNI3MT7]end end end;return PrTsHeT end;function qxZa6ozV.interpose(wot8,j9vJ)
for J6Qr27Mh=#wot8,2,-1 do lIpFkbLI(wot8,J6Qr27Mh,j9vJ)end;return wot8 end
function qxZa6ozV.range(AwxW8Do,_u,B)
if(
AwxW8Do==nil)and(_u==nil)and(B==nil)then return{}elseif(
AwxW8Do~=nil)and(_u==nil)and(B==nil)then
AwxW8Do,_u,B=cmWo_v(AwxW8Do),AwxW8Do,cmWo_v(AwxW8Do)elseif(AwxW8Do~=nil)and(_u~=nil)and(B==nil)then B=cmWo_v(_u-
AwxW8Do)end;local cdxFVpZw={AwxW8Do}
local Y=VCD(RlMSrmdD((_u-AwxW8Do)/B),0)
for o9Uh=1,Y do cdxFVpZw[#cdxFVpZw+1]=AwxW8Do+B*o9Uh end;return cdxFVpZw end
function qxZa6ozV.rep(BuX1r,Wyf83f2)local P0olj={}for z=1,Wyf83f2 do P0olj[z]=BuX1r end;return P0olj end
function qxZa6ozV.powerset(EHCCkt)local x=#EHCCkt;if x==0 then return{{}}end;local xNWVmS={}
for kGWnkgDu=1,x do for Pkis6H28=1,x-kGWnkgDu+1
do
xNWVmS[#xNWVmS+1]=qxZa6ozV.slice(EHCCkt,Pkis6H28,Pkis6H28+kGWnkgDu-1)end end;return xNWVmS end
function qxZa6ozV.partition(tSE,abKH,LDp)if abKH<=0 then return end;return PizLA9mj(function()
VQT(tSE,abKH or 1,hUL,LDp)end)end;function qxZa6ozV.overlapping(GWouUlzZ,MqJhIr,Q9)if MqJhIr<=1 then return end
return PizLA9mj(function()
Id(GWouUlzZ,MqJhIr or 2,hUL,Q9)end)end
function qxZa6ozV.aperture(c,qnZ81I)if
qnZ81I<=1 then return end;return
PizLA9mj(function()Ub(c,qnZ81I or 2,hUL)end)end
function qxZa6ozV.pairwise(N9uN)return qxZa6ozV.aperture(N9uN,2)end;function qxZa6ozV.permutation(QGC)return
PizLA9mj(function()qJExeUn2(QGC,#QGC,hUL)end)end
function qxZa6ozV.invert(K8iFU)
local gbU={}for h,hS7 in Mw(K8iFU)do gbU[hS7]=h end;return gbU end
function qxZa6ozV.concat(KQjMKhN,R6PYgHHE,ZwCXrLO,lI)return
toXyq(qxZa6ozV.map(KQjMKhN,tostring),R6PYgHHE,ZwCXrLO,lI)end
function qxZa6ozV.xprod(iMSMP5Lp,WoARZdZ3)local n={}for Uj,HpN_N in Mw(iMSMP5Lp)do
for yP3QEJ,pwi in Mw(WoARZdZ3)do n[#n+1]={HpN_N,pwi}end end;return n end
function qxZa6ozV.sum(QP)local Iy=0;for O9P0mj,eFGwPxi in Mw(QP)do Iy=Iy+eFGwPxi end;return Iy end;function qxZa6ozV.product(m4x8ZsD4)local _witc0Pe=1
for Y8E,h in Mw(m4x8ZsD4)do _witc0Pe=_witc0Pe*h end;return _witc0Pe end
function qxZa6ozV.mean(EnMMG)return
qxZa6ozV.sum(EnMMG)/ (#EnMMG)end
function qxZa6ozV.median(HzO7UpZ)
local B=qxZa6ozV.sort(qxZa6ozV.clone(HzO7UpZ))local RNTu=#B;if RNTu==0 then return elseif RNTu==1 then return B[1]end
local Q_=X83a(RNTu/2)return
RNTu%2 ==0 and(B[Q_]+B[Q_+1])/2 or B[Q_]end;function qxZa6ozV.noop()return end;function qxZa6ozV.identity(S8GB)return S8GB end;function qxZa6ozV.constant(W7yjGm)return function()return
W7yjGm end end
function qxZa6ozV.applySpec(X)return
function(...)
local Y={}for qqvEf3,Wriu in zupvsz(X)do Y[qqvEf3]=Wriu(...)end;return Y end end
function qxZa6ozV.memoize(I0Pxr5F)local ukGf_=odpE({},{__mode='kv'})
return function(uZpt01P)if
(ukGf_[uZpt01P]==nil)then ukGf_[uZpt01P]=I0Pxr5F(uZpt01P)end;return
ukGf_[uZpt01P]end end
function qxZa6ozV.unfold(hJk0n8bR,o9DTTJig)local v4,Uaq2_Xzk={}
while true do Uaq2_Xzk,o9DTTJig=hJk0n8bR(o9DTTJig)if
Uaq2_Xzk~=nil then v4[#v4+1]=Uaq2_Xzk else break end end;return v4 end
function qxZa6ozV.once(S0DM)local GHasi5=0;local QeX_U9tm={}return
function(...)GHasi5=GHasi5+1
if GHasi5 <=1 then QeX_U9tm={...}end;return S0DM(kyWtqIf0(QeX_U9tm))end end
function qxZa6ozV.before(Dp9m,MGSnnzOI)local sJjNM=0;local GnSs={}return
function(...)sJjNM=sJjNM+1
if sJjNM<=MGSnnzOI then GnSs={...}end;return Dp9m(kyWtqIf0(GnSs))end end
function qxZa6ozV.after(XP,MGSnnzOI)local Sj,yKj1=MGSnnzOI,0;return function(...)yKj1=yKj1+1
if yKj1 >=Sj then return XP(...)end end end
function qxZa6ozV.compose(...)local F9WZ=qxZa6ozV.reverse{...}
return function(...)local A5,nY_O=true
for QAJAyj5,EZ in Mw(F9WZ)do if A5 then
A5=false;nY_O=EZ(...)else nY_O=EZ(nY_O)end end;return nY_O end end
function qxZa6ozV.pipe(n,...)return qxZa6ozV.compose(...)(n)end
function qxZa6ozV.complement(M)return function(...)return not M(...)end end
function qxZa6ozV.juxtapose(AADiL1,...)local Arw={}
for b,_ZM1Yj3 in Mw({...})do Arw[b]=_ZM1Yj3(AADiL1)end;return kyWtqIf0(Arw)end;function qxZa6ozV.wrap(rmSU,L2RHrI)
return function(...)return L2RHrI(rmSU,...)end end
function qxZa6ozV.times(XW7Y5Rz,C,...)local NhwEkTd={}for XGz=1,(C or 1)do
NhwEkTd[XGz]=XW7Y5Rz(XGz,...)end;return NhwEkTd end;function qxZa6ozV.bind(Tf4P2eIf,TF3Htu)
return function(...)return Tf4P2eIf(TF3Htu,...)end end
function qxZa6ozV.bind2(K5yUw1t,Mi)return function(WWyrqnSL,...)return
K5yUw1t(WWyrqnSL,Mi,...)end end;function qxZa6ozV.bindn(gVTyP,...)local Ck={...}
return function(...)return
gVTyP(kyWtqIf0(qxZa6ozV.append(Ck,{...})))end end
function qxZa6ozV.bindall(CRG,...)
local dkz={...}
for zrCq,azXMvVdM in Mw(dkz)do local CBgxHfbq=CRG[azXMvVdM]if CBgxHfbq then
CRG[azXMvVdM]=qxZa6ozV.bind(CBgxHfbq,CRG)end end;return CRG end
function qxZa6ozV.cond(WO)return
function(...)for H,C28NuJ3 in Mw(WO)do
if C28NuJ3[1](...)then return C28NuJ3[2](...)end end end end
function qxZa6ozV.uniqueId(sz,...)RoXZEsn=RoXZEsn+1;if sz then
if l6Sm5(sz)=='string'then
return sz:format(RoXZEsn)elseif l6Sm5(sz)=='function'then return sz(RoXZEsn,...)end end;return RoXZEsn end
function qxZa6ozV.iterator(qH,u,uJ1Vn4uYP)local MGSnnzOI=0;return
function()MGSnnzOI=MGSnnzOI+1;if
uJ1Vn4uYP and MGSnnzOI>uJ1Vn4uYP then return end;u=qH(u)return u end end
function qxZa6ozV.array(...)local Z={}for pJ in...do Z[#Z+1]=pJ end;return Z end;function qxZa6ozV.castArray(NAjg)return
(l6Sm5(NAjg)~='table')and{NAjg}or NAjg end;function qxZa6ozV.flip(con)
return function(...)return
con(kyWtqIf0(qxZa6ozV.reverse({...})))end end;function qxZa6ozV.nthArg(I)
return function(...)
local TxmZR6UE={...}return
TxmZR6UE[(I<0)and(#TxmZR6UE+I+1)or I]end end;function qxZa6ozV.unary(I1b4o)
return function(...)
local nAt={...}return I1b4o(nAt[1])end end
function qxZa6ozV.ary(pNJ,RQ)RQ=RQ or 1
return function(...)
local wnZcHKf={...}local Lv_8={}for UQ=1,RQ do Lv_8[UQ]=wnZcHKf[UQ]end;return
pNJ(kyWtqIf0(Lv_8))end end
function qxZa6ozV.rearg(FG,vLzqjJw)return
function(...)local v2dsC21={...}local O={}
for wx,u in Mw(vLzqjJw)do O[wx]=v2dsC21[u]end;return FG(kyWtqIf0(O))end end
function qxZa6ozV.over(...)local V_84V={...}
return function(...)local qF={}
for IZbOX7TW,Dd6ZLpU in Mw(V_84V)do qF[#qF+1]=Dd6ZLpU(...)end;return qF end end
function qxZa6ozV.overEvery(...)local MP=qxZa6ozV.over(...)
return function(...)
return qxZa6ozV.reduce(MP(...),function(w4c,C58)
return w4c and C58 end)end end
function qxZa6ozV.overSome(...)local Jk6Nh=qxZa6ozV.over(...)
return function(...)
return qxZa6ozV.reduce(Jk6Nh(...),function(s1Ws,desLYv)return
s1Ws or desLYv end)end end
function qxZa6ozV.overArgs(COq2NY9I,...)local aoBEg65S={...}
return
function(...)local x6={...}for t3cNa2l=1,#aoBEg65S do
local COq2NY9I=aoBEg65S[t3cNa2l]
if x6[t3cNa2l]then x6[t3cNa2l]=COq2NY9I(x6[t3cNa2l])end end;return
COq2NY9I(kyWtqIf0(x6))end end
function qxZa6ozV.converge(Ik,SeHOs,P2rGsUx)return
function(...)return Ik(SeHOs(...),P2rGsUx(...))end end
function qxZa6ozV.partial(c,...)local v12AhMm={...}
return
function(...)local F2uxGC={...}local Xs0={}for QK8ibF,TEio7k0z in Mw(v12AhMm)do
Xs0[QK8ibF]=
(TEio7k0z=='_')and qxZa6ozV.shift(F2uxGC)or TEio7k0z end;return
c(kyWtqIf0(qxZa6ozV.append(Xs0,F2uxGC)))end end
function qxZa6ozV.partialRight(u,...)local N={...}
return
function(...)local O2YgxDc={...}local VLsC67={}for OHw4=1,#N do
VLsC67[OHw4]=
(N[OHw4]=='_')and qxZa6ozV.shift(O2YgxDc)or N[OHw4]end;return
u(kyWtqIf0(qxZa6ozV.append(O2YgxDc,VLsC67)))end end
function qxZa6ozV.curry(FKZ,Fl)Fl=Fl or 2;local QhS8FvKI={}
local function FaZIJL(sOT2O5)if Fl==1 then return FKZ(sOT2O5)end
if sOT2O5 ~=
nil then QhS8FvKI[#QhS8FvKI+1]=sOT2O5 end
if#QhS8FvKI<Fl then return FaZIJL else
local x={FKZ(kyWtqIf0(QhS8FvKI))}QhS8FvKI={}return kyWtqIf0(x)end end;return FaZIJL end;function qxZa6ozV.time(Wswd_OC,...)local E=sf0()local A0Un={Wswd_OC(...)}
return sf0()-E,kyWtqIf0(A0Un)end
function qxZa6ozV.keys(nRHrI)local k={}for Zp in
zupvsz(nRHrI)do k[#k+1]=Zp end;return k end;function qxZa6ozV.values(A)local _L_={}for WHpm,g in zupvsz(A)do _L_[#_L_+1]=g end
return _L_ end
function qxZa6ozV.path(HiR3yiw,...)
local KeKbiDqN,WfrZqHH8=HiR3yiw,{...}for YX9s9O,y64dF in Mw(WfrZqHH8)do if(KeKbiDqN[y64dF]==nil)then return end
KeKbiDqN=KeKbiDqN[y64dF]end;return KeKbiDqN end;function qxZa6ozV.kvpairs(sNSsH)local K={}
for o8T,xeP in zupvsz(sNSsH)do K[#K+1]={o8T,xeP}end;return K end
function qxZa6ozV.toObj(Tv_3VlmX)
local BT={}for _y3z,rdl in Mw(Tv_3VlmX)do BT[rdl[1]]=rdl[2]end;return BT end;function qxZa6ozV.property(NAP_5jYs)
return function(BZnlpW)return BZnlpW[NAP_5jYs]end end
function qxZa6ozV.propertyOf(isN)return function(yRADzw1v)
return isN[yRADzw1v]end end;function qxZa6ozV.toBoolean(Jafp)return not not Jafp end
function qxZa6ozV.extend(XWh8Ee,...)
local kpezL1e={...}for h,R7yfz_l9 in Mw(kpezL1e)do
if l6Sm5(R7yfz_l9)=='table'then for D35PFLu,wK in zupvsz(R7yfz_l9)do
XWh8Ee[D35PFLu]=wK end end end;return XWh8Ee end
function qxZa6ozV.functions(qeEwE,cbtvFnSa)qeEwE=qeEwE or qxZa6ozV;local fYKH_={}
for W,o in zupvsz(qeEwE)do if
l6Sm5(o)=='function'then fYKH_[#fYKH_+1]=W end end
if cbtvFnSa then local Mm99M=p(qeEwE)
if Mm99M and Mm99M.__index then
local l6YH=qxZa6ozV.functions(Mm99M.__index,cbtvFnSa)for gf2,F744Ew in Mw(l6YH)do fYKH_[#fYKH_+1]=F744Ew end end end;return fYKH_ end
function qxZa6ozV.clone(zgxKF4,UlvVvSBR)if l6Sm5(zgxKF4)~='table'then return zgxKF4 end
local i2i={}
for uRGAL,UUlqXyb6 in zupvsz(zgxKF4)do
if l6Sm5(UUlqXyb6)=='table'then if not UlvVvSBR then
i2i[uRGAL]=qxZa6ozV.clone(UUlqXyb6,UlvVvSBR)else i2i[uRGAL]=UUlqXyb6 end else
i2i[uRGAL]=UUlqXyb6 end end;return i2i end
function qxZa6ozV.tap(fOR92g8,jU26,...)jU26(fOR92g8,...)return fOR92g8 end
function qxZa6ozV.has(WIPTsAPz,DgUx8)return WIPTsAPz[DgUx8]~=nil end
function qxZa6ozV.pick(imac,...)local xX=qxZa6ozV.flatten{...}local Mfb6Kb={}for RRjV,TDOaFo in zupvsz(xX)do
if
(imac[TDOaFo])~=nil then Mfb6Kb[TDOaFo]=imac[TDOaFo]end end;return Mfb6Kb end
function qxZa6ozV.omit(tLo4,...)local m72l=qxZa6ozV.flatten{...}local npM3DSU={}for HGp4e1,uzJt7E in zupvsz(tLo4)do
if not
qxZa6ozV.include(m72l,HGp4e1)then npM3DSU[HGp4e1]=uzJt7E end end;return npM3DSU end
function qxZa6ozV.template(sRe5S32N,Bp)if not Bp then return sRe5S32N end;for rg,S in zupvsz(Bp)do if not sRe5S32N[rg]then
sRe5S32N[rg]=S end end;return sRe5S32N end
function qxZa6ozV.isEqual(Fem,cHmVGY,g29sXR)local Vat=l6Sm5(Fem)local sfnkWAy8=l6Sm5(cHmVGY)if Vat~=sfnkWAy8 then
return false end
if Vat~='table'then return(Fem==cHmVGY)end;local hbJSGe9=p(Fem)local pI=p(cHmVGY)
if g29sXR then if(hbJSGe9 or pI)and
(hbJSGe9.__eq or pI.__eq)then
return
hbJSGe9.__eq(Fem,cHmVGY)or pI.__eq(cHmVGY,Fem)or(Fem==cHmVGY)end end
if qxZa6ozV.size(Fem)~=qxZa6ozV.size(cHmVGY)then return false end;local B7jhm;for hj3,FKxU4 in zupvsz(Fem)do B7jhm=cHmVGY[hj3]
if B7jhm==nil or not
qxZa6ozV.isEqual(FKxU4,B7jhm,g29sXR)then return false end end;for UW in
zupvsz(cHmVGY)do if Fem[UW]==nil then return false end end;return
true end
function qxZa6ozV.result(tReY,lex,...)
if tReY[lex]then if qxZa6ozV.isCallable(tReY[lex])then return
tReY[lex](tReY,...)else return tReY[lex]end end
if qxZa6ozV.isCallable(lex)then return lex(tReY,...)end end
function qxZa6ozV.isTable(h79Pm)return l6Sm5(h79Pm)=='table'end
function qxZa6ozV.isCallable(vksQpy4)return
((l6Sm5(vksQpy4)=='function')or
(
(l6Sm5(vksQpy4)=='table')and p(vksQpy4)and p(vksQpy4).__call~=nil)or false)end
function qxZa6ozV.isArray(gPCIWPt)
if not(l6Sm5(gPCIWPt)=='table')then return false end;local l4Byxa7=0;for Fn8OR in zupvsz(gPCIWPt)do l4Byxa7=l4Byxa7+1;if gPCIWPt[l4Byxa7]==nil then
return false end end
return true end;function qxZa6ozV.isIterable(X1Z0van)return
qxZa6ozV.toBoolean((QFKEzBf(zupvsz,X1Z0van)))end
function qxZa6ozV.isEmpty(C_ACFsd)if(
C_ACFsd==nil)then return true end;if l6Sm5(C_ACFsd)=='string'then return
#C_ACFsd==0 end;if l6Sm5(C_ACFsd)=='table'then return
v(C_ACFsd)==nil end;return true end
function qxZa6ozV.isString(GC)return l6Sm5(GC)=='string'end
function qxZa6ozV.isFunction(SC7gSvMB)return l6Sm5(SC7gSvMB)=='function'end;function qxZa6ozV.isNil(Ei)return Ei==nil end;function qxZa6ozV.isNumber(GFuK1ut)return l6Sm5(GFuK1ut)==
'number'end;function qxZa6ozV.isNaN(SXmRY3i)
return
l6Sm5(SXmRY3i)=='number'and SXmRY3i~=SXmRY3i end
function qxZa6ozV.isFinite(b)if
l6Sm5(b)~='number'then return false end;return b>-BCf7 and b<BCf7 end
function qxZa6ozV.isBoolean(KApFr)return l6Sm5(KApFr)=='boolean'end;function qxZa6ozV.isInteger(jE)
return l6Sm5(jE)=='number'and RlMSrmdD(jE)==jE end
do
qxZa6ozV.forEach=qxZa6ozV.each;qxZa6ozV.forEachi=qxZa6ozV.eachi
qxZa6ozV.update=qxZa6ozV.adjust;qxZa6ozV.loop=qxZa6ozV.cycle;qxZa6ozV.collect=qxZa6ozV.map
qxZa6ozV.inject=qxZa6ozV.reduce;qxZa6ozV.foldl=qxZa6ozV.reduce
qxZa6ozV.injectr=qxZa6ozV.reduceRight;qxZa6ozV.foldr=qxZa6ozV.reduceRight
qxZa6ozV.mapr=qxZa6ozV.mapReduce;qxZa6ozV.maprr=qxZa6ozV.mapReduceRight
qxZa6ozV.any=qxZa6ozV.include;qxZa6ozV.some=qxZa6ozV.include
qxZa6ozV.contains=qxZa6ozV.include;qxZa6ozV.filter=qxZa6ozV.select
qxZa6ozV.discard=qxZa6ozV.reject;qxZa6ozV.every=qxZa6ozV.all
qxZa6ozV.takeWhile=qxZa6ozV.selectWhile;qxZa6ozV.rejectWhile=qxZa6ozV.dropWhile
qxZa6ozV.pop=qxZa6ozV.shift;qxZa6ozV.remove=qxZa6ozV.pull
qxZa6ozV.rmRange=qxZa6ozV.removeRange;qxZa6ozV.chop=qxZa6ozV.removeRange
qxZa6ozV.sub=qxZa6ozV.slice;qxZa6ozV.head=qxZa6ozV.first;qxZa6ozV.take=qxZa6ozV.first
qxZa6ozV.tail=qxZa6ozV.rest;qxZa6ozV.skip=qxZa6ozV.last
qxZa6ozV.without=qxZa6ozV.difference;qxZa6ozV.diff=qxZa6ozV.difference
qxZa6ozV.symdiff=qxZa6ozV.symmetricDifference;qxZa6ozV.xor=qxZa6ozV.symmetricDifference
qxZa6ozV.uniq=qxZa6ozV.unique;qxZa6ozV.isuniq=qxZa6ozV.isunique
qxZa6ozV.transpose=qxZa6ozV.zip;qxZa6ozV.part=qxZa6ozV.partition
qxZa6ozV.perm=qxZa6ozV.permutation;qxZa6ozV.transposeWith=qxZa6ozV.zipWith
qxZa6ozV.intersperse=qxZa6ozV.interpose;qxZa6ozV.sliding=qxZa6ozV.aperture
qxZa6ozV.mirror=qxZa6ozV.invert;qxZa6ozV.join=qxZa6ozV.concat;qxZa6ozV.average=qxZa6ozV.mean
qxZa6ozV.always=qxZa6ozV.constant;qxZa6ozV.cache=qxZa6ozV.memoize
qxZa6ozV.juxt=qxZa6ozV.juxtapose;qxZa6ozV.uid=qxZa6ozV.uniqueid
qxZa6ozV.iter=qxZa6ozV.iterator;qxZa6ozV.tabulate=qxZa6ozV.array;qxZa6ozV.nAry=qxZa6ozV.ary
qxZa6ozV.methods=qxZa6ozV.functions;qxZa6ozV.choose=qxZa6ozV.pick;qxZa6ozV.drop=qxZa6ozV.omit
qxZa6ozV.defaults=qxZa6ozV.template;qxZa6ozV.compare=qxZa6ozV.isEqual
qxZa6ozV.matches=qxZa6ozV.isEqual end
do local yVVmXC={}local MkxwoCeK={}MkxwoCeK.__index=yVVmXC;local function AT(_8KO)return
odpE({_value=_8KO,_wrapped=true},MkxwoCeK)end
odpE(MkxwoCeK,{__call=function(NI,PE)
return AT(PE)end,__index=function(a,GhVWeuQs,...)return yVVmXC[GhVWeuQs]end})function MkxwoCeK.chain(kQlY)return AT(kQlY)end;function MkxwoCeK:value()
return self._value end
yVVmXC.chain,yVVmXC.value=MkxwoCeK.chain,MkxwoCeK.value
for xIl1shq,qv in zupvsz(qxZa6ozV)do
if xIl1shq~='operator'then
yVVmXC[xIl1shq]=function(pbEt6T,...)
local MBdHQ=l6Sm5(pbEt6T)=='table'and
l(pbEt6T,'_wrapped')or false;if MBdHQ then local STXAhhM=pbEt6T._value;local assFn=qv(STXAhhM,...)return AT(assFn)else return
qv(pbEt6T,...)end end end end;yVVmXC.operator=qxZa6ozV.operator;yVVmXC.op=qxZa6ozV.operator
yVVmXC.import=function(EXpWzv,kq)EXpWzv=
EXpWzv or _ENV or _G;local up=qxZa6ozV.functions()
for wlI_l,nK7J in
Mw(up)do if l(EXpWzv,nK7J)~=nil then if not kq then
rawset(EXpWzv,nK7J,qxZa6ozV[nK7J])end else
rawset(EXpWzv,nK7J,qxZa6ozV[nK7J])end end;return EXpWzv end;MkxwoCeK._VERSION='Moses v'..e
MkxwoCeK._URL='http://github.com/Yonaba/Moses'
MkxwoCeK._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'
MkxwoCeK._DESCRIPTION='utility-belt library for functional programming in Lua'return MkxwoCeK end